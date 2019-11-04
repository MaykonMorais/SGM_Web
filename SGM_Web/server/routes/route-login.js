var express = require('express');
var router  = express.Router();
var path    = require('path');

router.get('/', function(req, res, next){
	
  res.sendFile(path.join(__dirname, '..', 'public','login.html'));
});

router.get('/logar', function(req, res, next){
	console.log('redirect');
	res.redirect('/dashboard');
});

module.exports = router;