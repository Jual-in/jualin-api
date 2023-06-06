const Product = require('../models/productModels');
const Service = require('../models/serviceModels');
const { Op } = require('sequelize');

//Controller function to search product by params
exports.searchProducts = async (req, res) => {
    try {
        const { type } = req.query;
        const products = await Product.findAll({
        where: {
            Nama: {
            [Op.like]: `%${type}%`
            }
        },
        attributes: ['id', 'Nama', 'Harga', 'Diskon', 'Photo', 'id_umkm']
        });

        if (products.length === 0) {
        return res.status(404).json({ message: 'Data product tidak tersedia' });
        }

        res.json(products);
    } catch (error) {
        console.error(error);
        res.status(500).json({ message: 'Internal server error' });
    }
};

exports.searchServices = async (req, res) => {
    try {
        const { type } = req.query;
        const services = await Service.findAll({
        where: {
            Nama: {
            [Op.like]: `%${type}%`
            }
        },
        attributes: ['id', 'Nama', 'Harga', 'Diskon', 'id_umkm']
        });

        if (services.length === 0) {
        return res.status(404).json({ message: 'Data service tidak tersedia' });
        }

        res.json(services);
    } catch (error) {
        console.error(error);
        res.status(500).json({ message: 'Internal server error' });
    }
};
