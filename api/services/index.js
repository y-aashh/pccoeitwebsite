"use strict";

const express = require('express');
var router = express.Router();

//Login
var login = require('./login/index');
router.use('/login',login.router);

//View
var view = require('./view/index');
router.use('/view',view.router);

var report = require('./report/index');
router.use('/report',report.router);

var edit = require('./edit/index');
router.use('/edit',edit.router);

var add = require('./add/index');
router.use('/add',add.router);

var find = require('./find/index');
router.use('/find',find.router);

var admin = require('./admin/index');
router.use('/admin',admin.router);

module.exports.router = router;