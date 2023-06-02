const express = require('express');
const router = express.Router();
const userController = require('../controllers/userController');
const { upload } = require('../middleware/upload');
const auth = require('../middleware/auth');

router.get('/', userController.getAllUsers);
router.get('/:id', userController.getUserById);
router.post('/register', userController.registerUser);
router.post('/login', userController.loginUser);

// router.post('/lupa-password', userController.forgotPassword);
// router.post('/reset-password/:token', userController.resetPassword);

router.put('/update/:id_user', auth.auth, userController.updateUser);
router.post('/upload-photo/:id_user',auth.auth, upload.single('photo'), userController.uploadPhoto);

module.exports = router;