const express       = require('express');
const logger        = require('morgan');

// This will be our application entry. We'll setup our server here.
const http = require('http');
// Set up the express app
const app = express();
// Log requests to the console.
app.use(logger('dev'));
// Parse incoming requests data (https://github.com/expressjs/body-parser)
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
// Setup a default catch-all route that sends back a welcome message in JSON format.
//require('./routes')(app);  pendiente crear rutas
app.get('*', (req, res) => res.status(200).send({
     message: 'Nos hemos conectado',
}));
const port = parseInt(process.env.PORT, 10) || 8013;
app.set('port', port);
const server = http.createServer(app);
server.listen(port);
module.exports = app;