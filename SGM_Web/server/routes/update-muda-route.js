const express = require('express')
const router = express.Router()

const mudaController = require('../controllers/mudasController')

router.get('/updateMuda', (req, res) => {
  if (req.query.nome == undefined) {
    console.log('Entrei inicial')
    mudaController.updateMuda(req, res);
  }
  else {
    console.log('Entrei na rota para procura')
    mudaController.searchMuda(req, res)
  }
})

module.exports = router;