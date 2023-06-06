const Product = require('../models/productModels');
const Umkm = require('../models/umkmModels');
const Review = require('../models/reviewModels')
const fs = require('fs');
const { uploadFileToGCS, bucket  } = require('../middleware/upload');

// Controller function to get all products
exports.getAllProducts = async (req, res) => {
  try {
    const products = await Product.findAll({
      attributes: ['id', 'Nama', 'Harga', 'Photo', 'Diskon'],
      include: {
        model: Umkm,
        attributes: ['id', 'id_user', 'Nama_usaha']
      }
    });
    res.json(products);
  } catch (error) {
    console.error(error);
    res.status(500).json({ message: 'Internal server error' });
  }
};

exports.getProductById = async (req, res) => {
  try {
    const product = await Product.findOne({
      where: { id: req.params.id },
      attributes: ['id', 'Nama', 'Harga', 'Photo', 'Diskon'],
      include: {
        model: Umkm,
        attributes: ['id', 'id_user', 'Nama_usaha']
      }
    });
    if (!product) {
      return res.status(404).json({ message: 'Product not found' });
    }
    res.json(product);
  } catch (error) {
    console.error(error);
    res.status(500).json({ message: 'Internal server error' });
  }
};

exports.getProductByIdwithReview = async (req, res) => {
  try {
    const product = await Product.findOne({
      where: { id: req.params.id },
      attributes: ['id', 'Nama', 'Harga', 'Photo', 'Diskon'],
      include: 
      [ 
        {
          model: Umkm,
          attributes: ['id', 'id_user', 'Nama_usaha']
        },
        {
          model: Review,
          attributes: ['id', 'id_user', 'Rating', 'Comment']
        },

      ]
    });
    if (!product) {
      return res.status(404).json({ message: 'Product not found' });
    }
    res.json(product);
  } catch (error) {
    console.error(error);
    res.status(500).json({ message: 'Internal server error' });
  }
};

exports.createProduct = async (req, res) => {
  const { id_umkm, Nama, Harga, Diskon } = req.body;
  try {
    const umkm = await Umkm.findByPk(id_umkm);
    if (!umkm) {
      return res.status(404).json({ message: 'UMKM not found' });
    }
    let product = {};
    if (req.file) {
      const photoUrl = await uploadFileToGCS(req.file);
      product = await Product.create({
        id_umkm,
        Nama,
        Harga,
        Diskon,
        Photo: photoUrl,
      });
    } else {
      product = await Product.create({
        id_umkm,
        Nama,
        Harga,
        Diskon
      });
    }
    res.status(201).json({
      message: 'Product created successfully',
      product: {
        id: product.id,
        umkm: umkm,
        Nama: product.Nama,
        Harga: product.Harga,
        Diskon: product.Diskon,
        Photo: product.Photo,
      },
    });
  } catch (error) {
    console.error(error);
    if(req.file) {
      // Hapus file gambar jika terjadi error
      fs.unlinkSync(req.file.path);
    }
    res.status(500).json({ message: 'Internal server error' });
  }
};

exports.updateProduct = async (req, res) => {
  const productId = req.params.id;
  const { Nama, Harga, Diskon } = req.body;
  try {
    const product = await Product.findByPk(productId);
    if (!product) {
      return res.status(404).json({ message: 'Product not found' });
    }
    const umkm = await Umkm.findByPk(product.id_umkm);
    if (!umkm) {
      return res.status(404).json({ message: 'UMKM not found' });
    }
    let updatedProduct = {};
    if (req.file) {
      // Menghapus file gambar lama di GCS
      const oldPhoto = product.Photo;
      if (oldPhoto) {
        const oldPhotoUrl = oldPhoto;
        const oldPhotoId = oldPhotoUrl.split('/').pop();
        const file = bucket.file(oldPhotoId);
        await file.delete();
      }
      const photoUrl = await uploadFileToGCS(req.file);
      updatedProduct = await product.update({
        Nama,
        Harga,
        Diskon,
        Photo: photoUrl,
      });
    } else {
      updatedProduct = await product.update({
        Nama,
        Harga,
        Diskon
      });
  }
  res.status(200).json({
    message: 'Product updated successfully',
    product: {
      id: updatedProduct.id,
      umkm: umkm,
      Nama: updatedProduct.Nama,
      Harga: updatedProduct.Harga,
      Diskon: updatedProduct.Diskon,
      Photo: updatedProduct.Photo,
    },
  });
  } catch (error) {
    console.error(error);
    if(req.file) {
      // Hapus file gambar jika terjadi error
      fs.unlinkSync(req.file.path);
    }
    res.status(500).json({ message: 'Internal server error' });
  }
};

exports.deleteProduct = async (req, res) => {
  const productId = req.params.id;
  try {
    const product = await Product.findByPk(productId);
    if (!product) {
      return res.status(404).json({ message: 'Product not found' });
    }
    // Menghapus file gambar lama di GCS
    const oldPhoto = product.Photo;
    if (oldPhoto) {
      const oldPhotoUrl = oldPhoto;
      const oldPhotoId = oldPhotoUrl.split('/').pop();
      const file = bucket.file(oldPhotoId);
      await file.delete();
    }
    await product.destroy();
    res.status(200).json({ message: 'Product deleted successfully' });
  } catch (error) {
    console.error(error);
    res.status(500).json({ message: 'Internal server error' });
  }
};
