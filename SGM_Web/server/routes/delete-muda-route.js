const express = require('express')
const router = express.Router();
const mudaController = require('../controllers/mudasController')


router.get('/removeMuda', (req, res) => {
  if (req.query.nome == undefined) {
    mudaController.renderRemovePage(req, res);
  } else {
    mudaController.searchMuda(req, res)
  }
});

router.post('/removeMuda', (req, res) => {
  mudaController.removeMuda(req, res)
});

module.exports = router;