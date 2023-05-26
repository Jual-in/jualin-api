const { DataTypes } = require('sequelize');
const sequelize = require('../db/index');

const Umkm = sequelize.define('umkm', {
  id: {
    type: DataTypes.INTEGER,
    primaryKey: true,
    autoIncrement: true,
  },
  Nama_pemilik: {
    type: DataTypes.STRING,
    allowNull: false,
  },
  Nama_usaha: {
    type: DataTypes.STRING,
    allowNull: false,
  },
  Deskripsi: {
    type: DataTypes.TEXT,
    allowNull: false,
  },
  Kategori: {
    type: DataTypes.STRING,
    allowNull: false,
  },
  Alamat: {
    type: DataTypes.STRING,
    allowNull: false,
  },
  No_hp: {
    type: DataTypes.STRING,
    allowNull: false,
  },
  latitude: {
    type: DataTypes.FLOAT,
    allowNull: true,
  },
  longitude: {
    type: DataTypes.FLOAT,
    allowNull: true,
  },
});

module.exports = Umkm;