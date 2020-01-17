const express = require('express')
const router = express.Router()

const mudaController = require('../controllers/mudasController')

router.get('/updateMuda', mudaController.updateMuda)

module.exports = router;