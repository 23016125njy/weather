const express = require('express');
const axios = require('axios');
const mysql = require('mysql2'); // MySQL driver
const bodyParser = require('body-parser');
const multer = require('multer'); 
const app = express();

const storage = multer.diskStorage({
    destination: (req, file, cb) => {
        cb(null, 'public/images');
    },
    filename: (req, file, cb) => {
        cb(null, file.originalname);
    }
});
const upload = multer({ storage: storage });

app.use(bodyParser.urlencoded({ extended: true }));
app.use(express.static('views'));

// MySQL Database connection
const connection = mysql.createConnection({
    host: 'mysql-nicia.alwaysdata.net',
    user: 'nicia',
    password: 'nicia12345!',
    database: 'nicia_weather'
});

// Connect to the database
connection.connect((err) => { 
    if (err) { 
        console.error('Error connecting to MySQL:', err); 
        return; 
    } 
    console.log('Connected to MySQL database'); 
}); 

// Set up view engine 
app.set('view engine', 'ejs'); 
// Enable static files 
app.use(express.static('public')); 
// Enable form processing
app.use(express.urlencoded({ extended: false }));

// Delete favorite function
const deleteFavorite = (favId) => {
    return new Promise((resolve, reject) => {
        const query = 'DELETE FROM favs WHERE favId = ?';
        connection.query(query, [favId], (error, results) => {
            if (error) {
                return reject(error);
            }
            resolve(results);
        });
    });
};

// Compare weather route (GET)
app.get('/compare', (req, res) => {
    const userid = req.query.userid || null;
    
    const sql = 'SELECT DISTINCT area_name FROM AreaMetadata';
    connection.query(sql, (err, results) => {
        if (err) throw err;
        res.render('compare', { locations: results, results: null, userid });
    });
});

app.post('/compare', (req, res) => {
    const { location1, location2 } = req.body;
    
    const sql = `
        SELECT area_name, forecast, timestamp 
        FROM WeatherForecast 
        WHERE area_name IN (?, ?) 
        AND timestamp = (
            SELECT MAX(timestamp) 
            FROM WeatherForecast 
            WHERE area_name = WeatherForecast.area_name
        )
    `;
    connection.query(sql, [location1, location2], (err, results) => {
        if (err) {
            console.error('Error fetching comparison data:', err);
            return res.redirect('/compare');
        }
        
        const formattedResults = results.map(result => ({
            location: result.area_name,
            forecast: result.forecast,
            timestamp: result.timestamp
        }));

        const locationsSql = 'SELECT DISTINCT area_name FROM AreaMetadata';
        connection.query(locationsSql, (err, locationResults) => {
            if (err) throw err;
            res.render('compare.ejs', { locations: locationResults, results: formattedResults, userid: req.query.userid || null });
        });
    });
});

app.get('/', (req, res) => {
    const userid = req.query.userid || null;

    const sql = 'SELECT DISTINCT area_name FROM AreaMetadata';
    connection.query(sql, (err, results) => {
        if (err) throw err;
        res.render('homepage', { locations: results, forecasts: null, userid });
    });
});

app.get('/user/:userid', (req, res) => {
    const userid = req.params.userid || null;

    const sql = 'SELECT DISTINCT area_name FROM AreaMetadata';
    connection.query(sql, (err, results) => {
        if (err) throw err;
        res.render('homepage', { locations: results, forecasts: null, userid });
    });
});

app.post('/search', (req, res) => {
    const { location, date } = req.body;
    const userid = req.query.userid || null;

    const sql = 'SELECT * FROM WeatherForecast WHERE area_name = ? AND DATE(timestamp) = ?';
    connection.query(sql, [location, date], (err, results) => {
        if (err) {
            console.error('Error executing search query:', err);
            return res.redirect('/'); 
        }

        const locationSql = 'SELECT DISTINCT area_name FROM AreaMetadata';
        connection.query(locationSql, (err, locationResults) => {
            if (err) throw err;
            res.render('homepage', { locations: locationResults, forecasts: results, userid });
        });
    });
});

// Register route
app.get('/register', (req, res) => {
    res.render('register.ejs');
});

app.post('/register', (req, res) => {
    const { username, email, password } = req.body;
    const sql = 'INSERT INTO user (username, email, password) VALUES (?, ?, ?)';
    connection.query(sql, [username, email, password], (err, results) => {
        if (err) {
            console.error('Error registering user:', err);
            return res.redirect('/register');
        }
        res.redirect('/login');
    });
});

// Login route
app.get('/login', (req, res) => {
    res.render('login.ejs');
});

app.post('/login', (req, res) => {
    const { email, password } = req.body;
    const sql = 'SELECT user_id FROM user WHERE email = ? AND password = ?';
    connection.query(sql, [email, password], (err, results) => {
        if (err) {
            console.error('Error logging in:', err);
            return res.redirect('/login');
        }
        if (results.length === 0) {
            return res.redirect('/login');
        }
        const user = results[0]; 
        res.redirect(`/user/${user.user_id}`); 
    });
});

app.post('/favorite', (req, res) => {
    const { area_name } = req.body; 
    const userId = req.query.userid; 
    
    const sql = 'INSERT INTO favs (user_id, area_name) VALUES (?, ?)';
    connection.query(sql, [userId, area_name], (err, results) => {
        if (err) {
            console.error('Error marking favorite:', err);
            return res.redirect(`/user/${userId}`);
        }
        res.redirect(`/user/${userId}`);
    });
});

app.post('/favs/delete', (req, res) => {
    const favId = req.body.favId;

    deleteFavorite(favId)
        .then(() => {
            res.redirect(`/user/${req.body.userid}/favs`);
        })
        .catch(err => {
            console.error(err);
            res.status(500).send("Error deleting favorite.");
        });
});

app.get('/user/:userid/favs', (req, res) => {
    const userId = req.params.userid; 
    const favsSql = 'SELECT area_name, favId FROM favs WHERE user_id = ?'; // Include favId
    const forecastSql = `
        SELECT area_name, forecast, timestamp 
        FROM WeatherForecast 
        WHERE area_name = ? 
        AND timestamp = (SELECT MAX(timestamp) FROM WeatherForecast WHERE area_name = ?)
    `;

    connection.query(favsSql, [userId], (err, favs) => {
        if (err) throw err;

        const forecasts = [];

        const fetchForecasts = favs.map(fav => {
            return new Promise((resolve, reject) => {
                connection.query(forecastSql, [fav.area_name, fav.area_name], (err, result) => {
                    if (err) {
                        return reject(err);
                    }
                    forecasts.push({ area_name: fav.area_name, favId: fav.favId, ...result[0] }); // Include favId
                    resolve();
                });
            });
        });

        Promise.all(fetchForecasts)
            .then(() => {
                res.render('favs.ejs', { favs: forecasts, userid: userId });
            })
            .catch(err => {
                console.error('Error fetching forecasts:', err);
                res.redirect('/user/' + userId);
            });
    });
});

const PORT = process.env.PORT || 3009;
app.listen(PORT, () => {
    console.log(`Server is running on port http://localhost:${PORT}`);
});
