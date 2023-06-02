const { DataTypes } = require('sequelize');
const sequelize = require('../db/index');
const User = require('./userModels');

const Umkm = sequelize.define('umkm', {
  id: {
    type: DataTypes.INTEGER,
    primaryKey: true,
    autoIncrement: true,
  },
  id_user: {
    type: DataTypes.INTEGER,
    allowNull: false,
    references: {
      model: User,
      key: 'id_user'
    }
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

User.hasMany(Umkm, { foreignKey: 'id_user' });
Umkm.belongsTo(User, { foreignKey: 'id_user', as: 'Pemilik' });

module.exports = Umkm;