var express = require('express');
var router = express.Router();
var path = require('path');

router.get("/", (req, res) => {
	res.render("dashboard")
})

/*router.post('/', function (req, res, next) {
	res.sendFile(path.join(__dirname, '..', 'public', 'index.html'));
});*/


module.exports = router;