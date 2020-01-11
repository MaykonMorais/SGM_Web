var express = require('express');
var router = express.Router();
var path = require('path');
const mudasController = require('../controllers/mudasController')

router.get("/registerSeedling", mudasController.renderAddMudaPage)
router.post('/registerSeedling', mudasController.addMuda);

module.exports = router;