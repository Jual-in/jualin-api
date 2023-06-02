const Service = require('../models/serviceModels');
const Umkm = require('../models/umkmModels');
const Review = require('../models/reviewModels')

// Controller function to get all products
exports.getAllService = async (req, res) => {
  try {
    const service = await Service.findAll({
      attributes: ['id', 'Nama', 'Harga', 'Diskon'],
      include: {
        model: Umkm,
        attributes: ['id', 'id_user', 'Nama_usaha']
      }
    });
    res.json(service);
  } catch (error) {
    console.error(error);
    res.status(500).json({ message: 'Internal server error' });
  }
};

exports.getServiceById = async (req, res) => {
  const serviceId = req.params.id;
  try {
    const service = await Service.findByPk(serviceId, {
      attributes: ['id', 'Nama', 'Harga', 'Diskon'],
      include: {
        model: Umkm,
        attributes: ['id', 'id_user', 'Nama_usaha']
      }
    });
    if (!service) {
      return res.status(404).json({ message: 'Service not found' });
    }
    res.json(service);
  } catch (error) {
    console.error(error);
    res.status(500).json({ message: 'Internal server error' });
  }
};

exports.getServiceByIdwithReview = async (req, res) => {
  try {
    const service = await Service.findOne({
      where: { id: req.params.id },
      attributes: ['id', 'Nama', 'Harga', 'Diskon'],
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
    if (!service) {
      return res.status(404).json({ message: 'Service not found' });
    }
    res.json(service);
  } catch (error) {
    console.error(error);
    res.status(500).json({ message: 'Internal server error' });
  }
};

exports.createService = async (req, res) => {
  try {
    const { id_umkm, Nama, Harga, Diskon } = req.body;
    const umkm = await Umkm.findByPk(id_umkm);
    
    if (!umkm) {
      return res.status(404).json({ message: 'UMKM not found' });
    }

    const service = await Service.create({
      id_umkm,
      Nama,
      Harga,
      Diskon
    });

    res.status(201).json({
      message: 'Product created successfully',
      product: {
        id: service.id,
        umkm: umkm,
        Nama: service.Nama,
        Harga: service.Harga,
        Diskon: service.Diskon
      },
    });
  } catch (error) {
    console.error(error);
    res.status(500).json({ message: 'Internal server error' });
  }
};

exports.updateService = async (req, res) => {
  const serviceId = req.params.id;
  const { Nama, Harga, Diskon } = req.body;
  try {
    const service = await Service.findByPk(serviceId);
    if (!service) {
      return res.status(404).json({ message: 'Service not found' });
    }
    const umkm = await Umkm.findByPk(service.id_umkm);
    if (!umkm) {
      return res.status(404).json({ message: 'UMKM not found' });
    }
    let updatedService = {};
    updatedService = await service.update({
      Nama,
      Harga,
      Diskon
    });
    res.status(200).json({
      message: 'Service updated successfully',
      service: {
        id_service: updatedService.id_service,
        umkm: umkm,
        Nama: updatedService.Nama,
        Harga: updatedService.Harga,
        Diskon: updatedService.Diskon
      },
    });
  } catch (error) {
    console.error(error);
    res.status(500).json({ message: 'Internal server error' });
  }
};

exports.deleteService = async (req, res) => {
  const serviceId = req.params.id;
  try {
    const service = await Service.findByPk(serviceId);

    if (!service) {
      return res.status(404).json({ message: 'Service not found' });
    }

    await service.destroy();
    res.status(200).json({ message: 'Service deleted successfully' });
  } catch (error) {
    console.error(error);
    res.status(500).json({ message: 'Internal server error' });
  }
};
