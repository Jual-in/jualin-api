const express = require('express');
const router = express.Router();
const productController = require('../controllers/productController');
const auth = require('../middleware/auth');
const { productUpload } = require('../middleware/upload');

router.get('/', auth.auth, productController.getAllProducts);
router.get('/:id', auth.auth, productController.getProductById);
router.get('/productReview/:id', auth.auth, productController.getProductByIdwithReview);

router.post('/createProduct', auth.authSellers, productUpload.single('Photo'), productController.createProduct);
router.put('/updateProduct/:id', auth.authSellers, productUpload.single('Photo'), productController.updateProduct);
router.delete('/deleteProduct/:id', auth.authSellers, productController.deleteProduct);

module.exports = router;