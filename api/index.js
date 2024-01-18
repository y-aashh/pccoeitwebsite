const express = require('express');
const database = require('./config/database');
const common = require('./config/common')

var app = express();
app.use(express.json());

var cors = require("cors");
app.use(cors());

var services = require('./services/index');
app.use('/services',services.router);

app.listen(common.PORT,() => {console.log('App running on',common.PORT)});