const Umkm = require('../models/umkmModels');
const User  = require('../models/userModels');
const Product = require('../models/productModels');
const Service = require('../models/serviceModels');
const { Op } = require('sequelize');

exports.RecommendUmkm = async (req, res) => {
  const umkms = await Umkm.findAll();

  if (umkms.length === 0) {
    return res.status(404).json({ message: 'Tidak ada UMKM yang ditemukan.' });
  }

  const latitude = parseFloat(req.body.latitude);
  const longitude = parseFloat(req.body.longitude);

  // Menghitung jarak antara lokasi pengguna dan setiap UMKM
  umkms.forEach((umkm) => {
    const distance = Math.sqrt(
      Math.pow(umkm.latitude - latitude, 2) +
        Math.pow(umkm.longitude - longitude, 2)
    );
    umkm.distance = distance;
  });

  // Mengurutkan UMKM berdasarkan jarak terdekat
  umkms.sort((a, b) => a.distance - b.distance);

  // Mengambil 20 UMKM terdekat dan memformat data yang akan dikembalikan
  const nearby_umkm = umkms
    .slice(0, 20)
    .map((umkm) => ({
      id: umkm.id,
      Nama_usaha: umkm.Nama_usaha,
      Deskripsi: umkm.Deskripsi,
      Kategori: umkm.Kategori,
      Alamat: umkm.Alamat,
      No_hp: umkm.No_hp,
      latitude: umkm.latitude,
      longitude: umkm.longitude,
    }));

  res.json(nearby_umkm);
};


exports.getAllUmkm = async (req, res) => {
  try {
    const umkm = await Umkm.findAll({
      attributes: ['id', 'Nama_usaha', 'Deskripsi', 'Kategori', 'No_hp', 'latitude', 'longitude'],
      include: [{
        model: User,
        as: 'Pemilik',
        attributes: ['name', 'alamat', 'role'],
      }]
    });

    res.send(umkm);
  } catch (error) {
    res.status(500).send({
      message: error.message || 'Some error occurred while retrieving UMKM.',
    });
  }
};

exports.getUmkmById = async (req, res) => {
  const { id } = req.params;
  
  try {
    const umkm = await Umkm.findByPk(id, {
      attributes: ['id', 'Nama_usaha', 'Deskripsi', 'Kategori', 'No_hp', 'latitude', 'longitude'],
      include: [{
        model: User,
        as: 'Pemilik',
        attributes: ['name', 'alamat', 'role'],
      }]
    });

    if (!umkm) {
      return res.status(404).send({ message: 'Umkm not found' });
    }

    res.send(umkm);
  } catch (error) {
    res.status(500).send({
      message: error.message || 'Some error occurred while retrieving Umkm.',
    });
  }
};

exports.getAllUmkmWithProduct = async (req, res) => {
  try {
    const umkms = await Umkm.findAll({
      attributes: ['id', 'Nama_usaha', 'Deskripsi', 'Kategori', 'No_hp', 'latitude', 'longitude'],
      include: [{
        model: Product,
        attributes: ['id', 'Nama', 'Harga', 'Diskon','photo'],
        where: {
          id: { [Op.ne]: null }
        }
      },
      {
        model: User,
        as: 'Pemilik',
        attributes: ['name', 'alamat', 'role']
      }]
    });
    if (umkms.length === 0) {
      res.status(404).send({
        message: 'No UMKM found with product data.',
      });
    } else {
      res.send(umkms);
    }
  } catch (error) {
    res.status(500).send({
      message: error.message || 'Some error occurred while retrieving UMKM with product data.',
    });
  }
};

exports.getAllUmkmWithService = async (req, res) => {
  try {
    const umkms = await Umkm.findAll({
      attributes: ['id', 'Nama_usaha', 'Deskripsi', 'Kategori', 'No_hp', 'latitude', 'longitude'],
      include: [{
        model: Service,
        attributes: ['id', 'Nama', 'Harga', 'Diskon'],
        where: {
          id: { [Op.ne]: null }
        }
      },
      {
        model: User,
        as: 'Pemilik',
        attributes: ['name', 'alamat', 'role']
      }]
    });
    if (umkms.length === 0) {
      res.status(404).send({
        message: 'No UMKM found with service data.',
      });
    } else {
      res.send(umkms);
    }
  } catch (error) {
    res.status(500).send({
      message: error.message || 'Some error occurred while retrieving UMKM with product data.',
    });
  }
};

exports.getUmkmProductById = async (req, res) => {
  try {
    const umkm = await Umkm.findByPk(req.params.id, { 
      attributes: ['id', 'Nama_usaha', 'Deskripsi', 'Kategori', 'No_hp', 'latitude', 'longitude'],
      include:[ 
        {
          model: Product,
          attributes: ['id','Nama', 'Harga', 'photo', 'Diskon']
        },
        {
          model: User,
          as: 'Pemilik',
          attributes: ['name', 'alamat', 'role']
        }
      ] 
    });
    if (!umkm) {
      res.status(404).send({
        message: `UMKM with id ${req.params.id} not found.`,
      });
    } else {
      res.send(umkm);
    }
  } catch (error) {
    res.status(500).send({
      message: error.message || 'Some error occurred while retrieving UMKM.',
    });
  }
};

exports.getUmkmServiceById = async (req, res) => {
  try {
    const umkm = await Umkm.findByPk(req.params.id, { 
      attributes: ['id', 'Nama_usaha', 'Deskripsi', 'Kategori', 'No_hp', 'latitude', 'longitude'],
      include:[ 
        {
          model: Service,
          attributes: ['id','Nama', 'Harga', 'Diskon']
        },
        {
          model: User,
          as: 'Pemilik',
          attributes: ['name', 'alamat', 'role']
        }
      ] 
    });
    if (!umkm) {
      res.status(404).send({
        message: `UMKM with id ${req.params.id} not found.`,
      });
    } else {
      res.send(umkm);
    }
  } catch (error) {
    res.status(500).send({
      message: error.message || 'Some error occurred while retrieving UMKM.',
    });
  }
};

exports.createUmkm = async (req, res) => {
  try {
    const umkms = req.body;

    const createdUmkms = [];

    for (const umkm of umkms) {
      const { id_user, Nama_usaha, Deskripsi, Kategori, No_hp, latitude, longitude } = umkm;

      const user = await User.findByPk(id_user);
      if (!user) {
        return res.status(404).json({ message: 'user not found' });
      }

      const createdUmkm = await Umkm.create({
        id_user,
        Nama_usaha,
        Deskripsi,
        Kategori,
        No_hp,
        latitude,
        longitude,
      });

      createdUmkms.push({
        id: createdUmkm.id,
        user,
        Nama_usaha: createdUmkm.Nama_usaha,
        Deskripsi: createdUmkm.Deskripsi,
        Kategori: createdUmkm.Kategori,
        No_hp: createdUmkm.No_hp,
        latitude: createdUmkm.latitude,
        longitude: createdUmkm.longitude,
      });
    }

    res.status(201).json({
      message: 'Products created successfully',
      umkms: createdUmkms,
    });
  } catch (error) {
    console.error(error);
    res.status(500).json({ message: 'Internal server error' });
  }
};

exports.updateUmkm = async (req, res) => {
  const umkmId = req.params.id;
  const { Nama_usaha, Deskripsi, Kategori, No_hp, latitude, longitude } = req.body;
  try {
    const umkm = await Umkm.findByPk(umkmId);
    if (!umkm) {
      return res.status(404).json({ message: 'umkm not found' });
    }
    const user = await User.findByPk(umkm.id_user);
    if (!user) {
      return res.status(404).json({ message: 'user not found' });
    }
    let updatedUmkm = {};
    updatedUmkm = await umkm.update({
      Nama_usaha, 
      Deskripsi, 
      Kategori, 
      No_hp, 
      latitude, 
      longitude
    });
    res.status(200).json({
      message: 'umkm updated successfully',
      umkm: {
        id: updatedUmkm.id,
        user: user,
        Nama_usaha: updatedUmkm.Nama_usaha, 
        Deskripsi: updatedUmkm.Deskripsi, 
        Kategori: updatedUmkm.Kategori, 
        No_hp: updatedUmkm.No_hp, 
        latitude: updatedUmkm.latitude, 
        longitude: updatedUmkm.longitude
      },
    });
  } catch (error) {
    console.error(error);
    res.status(500).json({ message: 'Internal server error' });
  }
};

exports.deleteUmkm = async (req, res) => {
  const id = req.params.id;

  try {
    // Hapus terlebih dahulu produk yang terkait dengan UMKM
    await Product.destroy({
      where: { id_umkm: id },
    });
      // Hapus juga layanan yang terkait dengan UMKM
    await Service.destroy({
      where: { id_umkm: id },
    });
    // Setelah produk dihapus, hapus UMKM
    const rowsDeleted = await Umkm.destroy({
      where: { id: id },
    });


    if (rowsDeleted === 0) {
      res.status(404).send({
        message: `UMKM with id ${id} not found.`,
      });
    } else {
      res.send({
        message: `UMKM with id ${id} was deleted successfully.`,
      });
    }
  } catch (error) {
    res.status(500).send({
      message: error.message || `Some error occurred while deleting UMKM with id ${id}.`,
    });
  }
};

