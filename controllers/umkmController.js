const Umkm = require('../models/umkmModels');
const Product = require('../models/productModels');
const Service = require('../models/serviceModels');
const { Op } = require('sequelize');

exports.getAllUmkm = async (req, res) => {
  try {
    const umkm = await Umkm.findAll({ 
      attributes: ['id', 'Nama_pemilik', 'Nama_usaha', 'Deskripsi', 'Kategori', 'Alamat', 'No_hp', 'latitude', 'longitude'] 
    });
    res.send(umkm);
  } catch (error) {
    res.status(500).send({
      message: error.message || 'Some error occurred while retrieving UMKM.',
    });
  }
};

exports.getUmkmById = async (req, res) => {
  try {
    const umkm = await Umkm.findByPk(req.params.id, { 
      attributes: ['id', 'Nama_pemilik', 'Nama_usaha', 'Deskripsi', 'Kategori', 'Alamat', 'No_hp', 'latitude', 'longitude'] 
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

exports.getAllUmkmWithProduct = async (req, res) => {
  try {
    const umkms = await Umkm.findAll({
      attributes: ['id', 'Nama_pemilik', 'Nama_usaha', 'Deskripsi', 'Kategori', 'Alamat', 'No_hp', 'latitude', 'longitude'],
      include: {
        model: Product,
        attributes: ['id', 'Nama', 'Harga', 'Diskon','photo'],
        where: {
          id: { [Op.ne]: null }
        }
      }
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
      attributes: ['id', 'Nama_pemilik', 'Nama_usaha', 'Deskripsi', 'Kategori', 'Alamat', 'No_hp', 'latitude', 'longitude'],
      include: {
        model: Service,
        attributes: ['id', 'Nama', 'Harga', 'Diskon'],
        where: {
          id: { [Op.ne]: null }
        }
      }
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
      attributes: ['id', 'Nama_pemilik', 'Nama_usaha', 'Deskripsi', 'Kategori', 'Alamat', 'No_hp', 'latitude', 'longitude'],
      include: 
        {
          model: Product,
          attributes: ['id','Nama', 'Harga', 'photo', 'Diskon']
        } 
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
      attributes: ['id', 'Nama_pemilik', 'Nama_usaha', 'Deskripsi', 'Kategori', 'Alamat', 'No_hp', 'latitude', 'longitude'],
      include: 
        {
          model: Service,
          attributes: ['id','Nama', 'Harga', 'Diskon']
        } 
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
    let umkms = req.body;
    if (!Array.isArray(umkms)) {
      umkms = [umkms];
    }
    const newUmkms = await Umkm.bulkCreate(umkms);
    res.send({ message: 'Umkms created successfully', data: newUmkms });
  } catch (error) {
    res.status(500).send({
      message: error.message || 'Some error occurred while creating the Umkms.',
    });
  }
};

exports.updateUmkm = async (req, res) => {
  const id = req.params.id;

  const umkm = req.body;

  try {
    const [rowsUpdated] = await Umkm.update(umkm, {
      where: { id: id },
    });
    if (rowsUpdated === 0) {
      res.status(404).send({
        message: `UMKM with id ${id} not found.`,
      });
    } else {
      res.send({
        message: `UMKM with id ${id} was updated successfully.`,
      });
    }
  } catch (error) {
    res.status(500).send({
      message: error.message || `Some error occurred while updating UMKM with id ${id}.`,
    });
  }
};

exports.deleteUmkm = async (req, res) => {
  const id = req.params.id;

  try {
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
