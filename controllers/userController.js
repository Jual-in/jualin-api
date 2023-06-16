const User  = require('../models/userModels');
const Umkm = require("../models/umkmModels");
const jwt = require('jsonwebtoken');
const auth = require('../middleware/auth');
require('dotenv').config();
const { uploadFileToGCS, bucket  } = require('../middleware/upload');

exports.registerUser = async (req, res) => {
  const { name, email, password, role } = req.body;
  const hashedPassword = auth.hashPassword(password);

  try {
    const user = await User.create({
      name,
      email,
      password: hashedPassword,
      role,
    });

    res.status(201).json({
      message: "User registered successfully",
      user: {
        id: user.id,
        name: user.name,
        email: user.email,
        password: user.password,
        role: user.role,
      },
    });
  } catch (error) {
    // console.log(error);
    res.status(500).json({
      message: "Failed to register user",
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
      message: "Failed to get all users",
    });
  }
};

exports.getUserById = async (req, res) => {
  const { id } = req.params;

  try {
    const user = await User.findByPk(id, {
      include: {
        model: Umkm,
        attributes: ["id"],
      },
    });
    if (!user) {
      res.status(404).json({
        message: "User not found",
      });
    } else {
      const transformedUser = {
        id_user: user.id_user,
        name: user.name,
        email: user.email,
        password: user.password,
        role: user.role,
        alamat: user.alamat,
        photo: user.photo,
        umkm_id: user.umkms.length > 0 ? user.umkms[0].id : null,
      };
      res.status(200).json(transformedUser);
    }
  } catch (error) {
    console.log(error);
    res.status(500).json({
      message: "Failed to get user",
    });
  }
};

exports.loginUser = async (req, res) => {
  const { email, password } = req.body;

  try {
    const user = await User.findOne({ where: { email } });
    if (!user) {
      res.status(401).json({
        message: "Invalid email or password",
      });
    } else {
      const passwordMatch = auth.comparePassword(password, user.password);
      if (passwordMatch) {
        const token = jwt.sign(
          {
            id: user.id_user,
            name: user.name,
            email: user.email,
            role: user.role,
          },
          process.env.JWT_SECRET
        );
        res.status(200).json({
          id: user.id_user,
          name: user.name,
          email: user.email,
          role: user.role,
          token,
        });
      } else {
        res.status(401).json({
          message: "Invalid email or password",
        });
      }
    }
  } catch (error) {
    console.log(error);
    res.status(500).json({
      message: "Failed to login",
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
        message: "User not found",
      });
    }
    return res.status(200).json({
      message: "User updated successfully",
    });
  } catch (error) {
    console.log(error);
    if (error.name === "SequelizeDatabaseError") {
      return res.status(500).json({
        message: "Database error while updating user",
      });
    }
    return res.status(500).json({
      message: "Failed to update user due to a server error",
    });
  }
};

exports.uploadPhoto = async (req, res) => {
  const { id_user } = req.params;
  const photo = req.file;

  try {
    const user = await User.findByPk(id_user);
    if (!user) {
      res.status(404).json({
        message: 'User not found'
      });
    } else {
      // Menghapus file gambar lama di GCS
      const oldPhoto = user.photo;
      if (oldPhoto) {
        const oldPhotoUrl = oldPhoto;
        const oldPhotoId = oldPhotoUrl.split('/').pop();
        const file = bucket.file(oldPhotoId);
        await file.delete();
      }

      // Mengupload file gambar baru ke GCS
      const photoUrl = await uploadFileToGCS(photo);

      // Memperbarui data pengguna dengan foto baru
      await user.update({ photo: photoUrl });
      
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

//Run the following code to save the image in local

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

 
