const express = require('express');
const router = express.Router();

const loginController = require('../controllers/loginController')

router.get('/login', loginController.renderLoginPage)
router.post('/login', loginController.login)

module.exports = router;