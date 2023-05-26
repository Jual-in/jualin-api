const express = require('express');
const router = express.Router();
const serviceController = require('../controllers/serviceController');
const auth = require('../middleware/auth');

router.get('/',auth.auth, serviceController.getAllService);  
router.get('/:id',auth.auth, serviceController.getServiceById);
router.get('/serviceReview/:id',auth.auth, serviceController.getServiceByIdwithReview);

router.post('/createService',auth.auth, serviceController.createService);
router.put('/updateService/:id',auth.auth, serviceController.updateService);
router.delete('/deleteService/:id',auth.auth, serviceController.deleteService);

module.exports = router;