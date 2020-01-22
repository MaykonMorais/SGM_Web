const express = require('express')
const router = express.Router();
const mudaController = require('../controllers/mudasController')


router.get('/removeMuda', (req, res) => {
  if (req.query.nome == undefined) {
    console.log('entrei na rota para renderizar a pagina de remover')
    mudaController.renderRemovePage(req, res);
  } else {
    console.log('entrei na rota de procura')
    mudaController.searchMuda(req, res)
  }
});

router.post('/removeMuda', (req, res) => {
  console.log('aqui')
  mudaController.removeMuda(req, res)
});

module.exports = router;