const { DataTypes } = require('sequelize');
const sequelize = require('../db/index');
const User = require('./userModels');
const Product = require('./productModels');
const Service = require('./serviceModels');

const Review = sequelize.define('review', {
  id: {
    type: DataTypes.INTEGER,
    primaryKey: true,
    autoIncrement: true
  },
  id_user: {
    type: DataTypes.INTEGER,
    allowNull: false,
    references: {
      model: User,
      key: 'id_user'
    }
  },
  id_product: {
    type: DataTypes.INTEGER,
    allowNull: true,
    references: {
      model: Product,
      key: 'id'
    }
  },
  id_service: {
    type: DataTypes.INTEGER,
    allowNull: true,
    references: {
      model: Product,
      key: 'id'
    }
  },
  Rating: {
    type: DataTypes.INTEGER,
    allowNull: false
  },
  Comment: {
    type: DataTypes.STRING,
    allowNull: false
  }
});

Product.hasMany(Review, { foreignKey: 'id_product' });
Service.hasMany(Review, { foreignKey: 'id_service' });
Review.belongsTo(User, { foreignKey: 'id_user' });
Review.belongsTo(Product, { foreignKey: 'id_product' });
Review.belongsTo(Service, { foreignKey: 'id_service' });

module.exports = Review;