const express = require('express');
const router = express.Router();
const reviewController = require('../controllers/reviewController');
const auth = require('../middleware/auth');

router.get('/productReview',auth.auth, reviewController.getAllReviewProduct);
router.get('/serviceReview',auth.auth, reviewController.getAllReviewService);

router.post('/createReview/product',auth.auth, reviewController.createReviewProduct);
router.post('/createReview/service',auth.auth, reviewController.createReviewService);

router.delete('/deleteReview/:id',auth.auth, reviewController.deleteReview);


module.exports = router;