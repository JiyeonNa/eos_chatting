var express = require('express');
var router = express.Router();

router.get('/', function(req, re, next) {
    res.send('hello world!!');
});

module.exports = router;