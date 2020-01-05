var express = require('express');
var router = express.Router();
var path = require('path');

router.get("/register", (req, res) => {
	res.render("register")
})

module.exports = router;
