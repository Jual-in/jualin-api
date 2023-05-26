const express = require('express');
const router = express.Router();
const umkmController = require('../controllers/umkmController');
const auth = require('../middleware/auth');

router.get('/', auth.auth, umkmController.getAllUmkm);
router.get('/:id', auth.auth, umkmController.getUmkmById);

router.get('/umkmproduct/allProduct', auth.auth, umkmController.getAllUmkmWithProduct);
router.get('/umkmproduct/allService', auth.auth, umkmController.getAllUmkmWithService);
router.get('/umkmProduct/:id', auth.auth, umkmController.getUmkmProductById);
router.get('/umkmService/:id', auth.auth, umkmController.getUmkmServiceById);

router.post('/create', auth.auth, umkmController.createUmkm);
router.put('update/:id', auth.auth, umkmController.updateUmkm);
router.delete('/delete/:id', auth.auth, umkmController.deleteUmkm);

module.exports = router;


