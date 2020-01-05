var express = require('express');
var router = express.Router();
var path = require('path');

router.get("/requisicao", (req, res) => {
  res.render("requests")
})

module.exports = router;