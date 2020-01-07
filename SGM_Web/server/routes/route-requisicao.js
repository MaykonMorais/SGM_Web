var express = require('express');
var router = express.Router();

const mudasController = require('../controllers/mudasController')

router.get("/requisicao", mudasController.showMudas);


module.exports = router;