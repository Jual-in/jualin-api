const express = require('express');
const router = express.Router();
const searchController = require('../controllers/searchController');
const auth = require('../middleware/auth');

router.get('/product', searchController.searchProducts);
router.get('/service', searchController.searchServices);

module.exports = router;