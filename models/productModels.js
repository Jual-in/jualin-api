const { DataTypes } = require('sequelize');
const sequelize = require('../db/index');
const Umkm = require('../models/umkmModels');

const Product = sequelize.define('product', {
  id: {
    type: DataTypes.INTEGER,
    primaryKey: true,
    autoIncrement: true
  },
  id_umkm: {
    type: DataTypes.INTEGER,
    allowNull: false,
    references: {
      model: Umkm,
      key: 'id'
    }
  },
  Nama: {
    type: DataTypes.STRING,
    allowNull: false
  },
  Harga: {
    type: DataTypes.INTEGER,
    allowNull: false
  },
  Diskon: {
    type: DataTypes.INTEGER,
    allowNull: false
  },
  Photo: {
    type: DataTypes.STRING
  }
});

Umkm.hasMany(Product, { foreignKey: 'id_umkm' });
Product.belongsTo(Umkm, { foreignKey: 'id_umkm' });

module.exports = Product;