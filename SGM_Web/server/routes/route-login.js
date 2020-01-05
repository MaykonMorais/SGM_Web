var express = require('express');
var router = express.Router();
var path = require('path');

router.get('/login', (req, res) => {
	res.render("login")
})

router.get('/logar', function (req, res, next) {
	console.log('redirect');
	res.redirect('/dashboard');
});

module.exports = router;