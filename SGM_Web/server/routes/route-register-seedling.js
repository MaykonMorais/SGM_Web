var express = require('express');
var router = express.Router();
var path = require('path');

router.get("/registerSeedling", (req, res) => {
  res.render("registerSeedling");
})

module.exports = router;