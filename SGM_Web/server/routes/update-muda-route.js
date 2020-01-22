const express = require('express')
const router = express.Router()

const mudaController = require('../controllers/mudasController')

router.get('/updateMuda', (req, res) => {
  if (req.query.nome == undefined) {
    mudaController.renderUpdateMuda(req, res);
  }
  else {
    mudaController.searchMuda(req, res)
  }
})
router.post('/updateMuda', mudaController.updateMuda)

module.exports = router;