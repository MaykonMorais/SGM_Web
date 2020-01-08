var express = require('express');
var router = express.Router();

const mudasController = require('../controllers/mudasController')
const requisicao = require('../controllers/requisicaoController')

router.get("/requisicao", mudasController.showMudas);
router.post("/requisicao", mudasController.showRequest)


module.exports = router;