const User  = require('../models/userModels');
const jwt = require('jsonwebtoken');
const auth = require('../middleware/auth');
const nodemailer = require('nodemailer');
const fs = require('fs');
require('dotenv').config();
// const { uploadFileToGCS, bucket  } = require('../middleware/upload');

exports.registerUser = async (req, res) => {
  const { name, email, password, role } = req.body;
  const hashedPassword = auth.hashPassword(password);

  try {
    const user = await User.create({
      name,
      email,
      password: hashedPassword,
      role
    });

    res.status(201).json({
      message: 'User registered successfully',
      user: {
        id: user.id,
        name: user.name,
        email: user.email,
        password: user.password,
        role: user.role
      }
    });
  } catch (error) {
    // console.log(error);
    res.status(500).json({
      message: 'Failed to register user'
    });
  }
};



exports.getAllUsers = async (req, res) => {
  try {
    const users = await User.findAll();
    res.status(200).json(users);
  } catch (error) {
    console.log(error);
    res.status(500).json({
      message: 'Failed to get all users'
    });
  }
};

exports.getUserById = async (req, res) => {
  const { id } = req.params;

  try {
    const user = await User.findByPk(id);
    if (!user) {
      res.status(404).json({
        message: 'User not found'
      });
    } else {
      res.status(200).json(user);
    }
  } catch (error) {
    console.log(error);
    res.status(500).json({
      message: 'Failed to get user'
    });
  }
};

exports.loginUser = async (req, res) => {
  const { email, password } = req.body;

  try {
    const user = await User.findOne({ where: { email } });
    if (!user) {
      res.status(401).json({
        message: 'Invalid email or password'
      });
    } else {
      const passwordMatch = auth.comparePassword(password, user.password);
      if (passwordMatch) {
        const token = jwt.sign({ id: user.id_user, name: user.name, email: user.email, role: user.role }, process.env.JWT_SECRET);
        res.status(200).json({ id: user.id_user, name: user.name, email: user.email, role: user.role, token });
      } else {
        res.status(401).json({
          message: 'Invalid email or password'
        });
      }
    }
  } catch (error) {
    console.log(error);
    res.status(500).json({
      message: 'Failed to login'
    });
  }
};

exports.updateUser = async (req, res) => {
  const { id_user } = req.params;
  const { name, email, password, alamat } = req.body;
  let hashedPassword;

  if (password) {
    hashedPassword = auth.hashPassword(password);
  }

  try {
    const user = await User.update(
      { name, email, password: hashedPassword, alamat },
      { where: { id_user: id_user } }
    );
    if (user[0] === 0) {
      return res.status(404).json({
        message: 'User not found'
      });
    }
    return res.status(200).json({
      message: 'User updated successfully'
    });
  } catch (error) {
    console.log(error);
    if (error.name === 'SequelizeDatabaseError') {
      return res.status(500).json({
        message: 'Database error while updating user'
      });
    }
    return res.status(500).json({
      message: 'Failed to update user due to a server error'
    });
  }
};

exports.uploadPhoto = async (req, res) => {
  const { id_user } = req.params;
  const photo = req.file;

  try {
    const user = await User.findByPk(id_user);
    if (!user) {
      // Hapus file gambar yang diupload
      if (photo) {
        fs.unlink(`uploads/users/${photo.filename}`, (err, deleted) => {
          if (err) {
            console.log(err);
          }
        });
      }
      res.status(404).json({
        message: 'User not found'
      });
    } else {
      // Menghapus file gambar lama
      const oldPhoto = user.photo;
      if (oldPhoto) {
        fs.unlink(`uploads/users/${oldPhoto}`, (err, deleted) => {
          if(err) {
            console.log(err);
          }
        });
      }

      // Memperbarui data pengguna dengan foto baru
      await user.update({ photo: photo.filename });
      res.status(200).json({
        message: 'Photo uploaded successfully'
      });
    }
  } catch (error) {
    console.log(error);
    res.status(500).json({
      message: 'Failed to upload photo'
    });
  }
};

// exports.uploadPhoto = async (req, res) => {
//   const { id_user } = req.params;
//   const photo = req.file;

//   try {
//     const user = await User.findByPk(id_user);
//     if (!user) {
//       res.status(404).json({
//         message: 'User not found'
//       });
//     } else {
//       // Menghapus file gambar lama di GCS
//       const oldPhoto = user.photo;
//       if (oldPhoto) {
//         const oldPhotoUrl = oldPhoto;
//         const oldPhotoId = oldPhotoUrl.split('/').pop();
//         const file = bucket.file(oldPhotoId);
//         await file.delete();
//       }

//       // Mengupload file gambar baru ke GCS
//       const photoUrl = await uploadFileToGCS(photo);

//       // Memperbarui data pengguna dengan foto baru
//       await user.update({ photo: photoUrl });
      
//       res.status(200).json({
//         message: 'Photo uploaded successfully'
//       });
//     }
//   } catch (error) {
//     console.log(error);
//     res.status(500).json({
//       message: 'Failed to upload photo'
//     });
//   }
// };


// // Lupa password
// exports.forgotPassword = async (req, res) => {
//   const { email } = req.body;

//   try {
//     const user = await User.findOne({
//       where: {
//         email: req.body.email
//       }
//     });

//     if (!user) {
//       return res.status(404).json({
//         message: 'User not found'
//       });
//     }

//     const token = jwt.sign({ id: user.id_user }, process.env.JWT_SECRET, { expiresIn: '1h' });

//     user.resetPasswordToken = token;
//     user.resetPasswordExpires = Date.now() + 3600000; // 1 hour
//     await user.save();

//     const transporter = nodemailer.createTransport({
//       service: 'gmail',
//       auth: {
//         user: process.env.EMAIL_USERNAME,
//         pass: process.env.EMAIL_PASSWORD
//       }
//     });

//     const mailOptions = {
//       from: process.env.EMAIL_USERNAME,
//       to: user.email,
//       subject: 'Password Reset Request',
//       text: `Hi ${user.name},\n\nYou are receiving this email because you (or someone else) requested to reset your password.\n\nPlease click on the following link, or paste this into your browser to complete the process:\n\n${process.env.CLIENT_URL}/reset-password/${token}\n\nIf you did not request this, please ignore this email and your password will remain unchanged.\n`
//     };

//     transporter.sendMail(mailOptions, (error, info) => {
//       if (error) {
//         console.log(error);
//         return res.status(500).json({
//           message: 'Failed to send email'
//         });
//       } else {
//         console.log('Email sent: ' + info.response);
//         return res.status(200).json({
//           message: 'Email sent successfully'
//         });
//       }
//     });
//   } catch (error) {
//     console.log(error);
//     res.status(500).json({
//       message: 'Failed to process request'
//     });
//   }
// };

// // Reset password
// exports.resetPassword = async (req, res) => {
//   const { token } = req.params;
//   const { password } = req.body;

//   try {
//     const user = await User.findOne({
//       resetPasswordToken: token,
//       resetPasswordExpires: { $gt: Date.now() }
//     });

//     if (!user) {
//       return res.status(400).json({
//         message: 'Invalid or expired token'
//       });
//     }

//     user.password = auth.hashPassword(password);
//     user.resetPasswordToken = undefined;
//     user.resetPasswordExpires = undefined;
//     await user.save();

//     const transporter = nodemailer.createTransport({
//       service: 'gmail',
//       auth: {
//         user: process.env.EMAIL_USERNAME,
//         pass: process.env.EMAIL_PASSWORD
//       }
//     });

//     const mailOptions = {
//       from: process.env.EMAIL_USERNAME,
//       to: user.email,
//       subject: 'Password Reset Confirmation',
//       text: `Hi ${user.name},\n\nYour password has been reset successfully.\n`
//     };

//     transporter.sendMail(mailOptions, (error, info) => {
//       if (error) {
//         console.log(error);
//         return res.status(500).json({
//           message: 'Failed to send email'
//         });
//       } else {
//         console.log('Email sent: ' + info.response);
//         return res.status(200).json({
//           message: 'Password reset successfully'
//         });
//       }
//     });
//   } catch (error) {
//     console.log(error);
//     res.status(500).json({
//       message: 'Failed to process request'
//     });
//   }
// };
 
