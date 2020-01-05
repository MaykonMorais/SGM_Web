var express = require('express')

var router = express.Router();

router.get("/teste", (req, res, next) => {
  res.render("index", { title: "Teste" });
})

module.exports = router;