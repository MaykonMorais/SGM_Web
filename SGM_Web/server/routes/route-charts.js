var express = require('express');
var router = express.Router();
var path = require('path');

router.get("/charts", (req, res) => {
  res.render("charts")
})

module.exports = router;