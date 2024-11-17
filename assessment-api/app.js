const express = require('express');
const bodyParser = require('body-parser');
const authRoutes = require('./routes/authRoutes');
const noteRoutes = require('./routes/noteRoutes');
const rateLimiter = require('./middleware/rateLimiter');

const app = express();

app.use(bodyParser.json());
app.use('/api/auth', authRoutes);
app.use('/api/notes', noteRoutes);
app.use(rateLimiter);

module.exports = app;
