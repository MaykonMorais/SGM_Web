var express = require('express');
var router = express.Router();
var path = require('path');

router.get("/allowRegister", (req, res) => {
  res.render("allowRegister")
})

module.exports = router;