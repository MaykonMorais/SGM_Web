const express = require('express');
const router = express.Router();
const dashBoardController = require('../controllers/dashboardController')

router.get("/dashboard", dashBoardController.renderDashboard)

module.exports = router;