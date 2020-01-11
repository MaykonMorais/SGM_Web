var express = require('express');
var router = express.Router();
var path = require('path');
const mudasController = require('../controllers/mudasController')

router.get("/registerseedling", mudasController.renderAddMudaPage)
router.post("/registerseedling", mudasController.addMuda);

module.exports = router;