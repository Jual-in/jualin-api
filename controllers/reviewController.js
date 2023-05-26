const Review = require('../models/reviewModels');
const User = require('../models/userModels');
const Product = require('../models/productModels');
const Service = require('../models/serviceModels');
const { Op } = require('sequelize');

exports.getAllReviewProduct = async (req, res) => {
  try {
    const review = await Review.findAll({
      attributes: ['id', 'Rating', 'Comment'],
      include:[
        {
          model: User,
          attributes: ['id_user', 'name'],
        },
        {
          model: Product,
          attributes: ['id', 'Nama', 'Harga'],
          where: {
            id: { [Op.ne]: null }
          }
        },
      ],
    });
    if (review.length === 0) {
      res.status(404).send({
        message: 'No Review found with product data.',
      });
    } else {
      res.send(review);
    }
  } catch (error) {
    res.status(500).send({
      message: error.message || 'Some error occurred while retrieving Review with product data.',
    });
  }
};

exports.getAllReviewService = async (req, res) => {
  try {
    const review = await Review.findAll({
      attributes: ['id', 'Rating', 'Comment'],
      include:[
        {
          model: User,
          attributes: ['id_user', 'name'],
        },
        {
          model: Service,
          attributes: ['id', 'Nama', 'Harga'],
          where: {
            id: { [Op.ne]: null }
          }
        },
      ],
    });
    if (review.length === 0) {
      res.status(404).send({
        message: 'No Review found with Service data.',
      });
    } else {
      res.send(review);
    }
  } catch (error) {
    res.status(500).send({
      message: error.message || 'Some error occurred while retrieving Review with Service data.',
    });
  }
};

exports.createReviewProduct = async (req, res) => {
  try {
    const { id_user, id_product, Rating, Comment } = req.body;
    const user = await User.findByPk(id_user);
    const product = await Product.findByPk(id_product);

    if (!user) {
      return res.status(404).json({ message: 'User not found' });
    }
    if (!product) {
      return res.status(404).json({ message: 'Product not found' });
    }

    const review = await Review.create({
      id_user,
      id_product,
      Rating,
      Comment
    });

    res.status(201).json({
      message: 'Product review created successfully',
      productReview: {
        id: review.id,
        user: user,
        product: product,
        Rating: review.Rating,
        Comment: review.Comment
      },
    });
  } catch (error) {
    console.error(error);
    res.status(500).json({ message: 'Internal server error' });
  }
};

exports.createReviewService = async (req, res) => {
  try {
    const { id_user, id_service, Rating, Comment } = req.body;
    const user = await User.findByPk(id_user);
    const service = await Service.findByPk(id_service);

    if (!user) {
      return res.status(404).json({ message: 'User not found' });
    }
    if (!service) {
      return res.status(404).json({ message: 'Service not found' });
    }

    const review = await Review.create({
      id_user,
      id_service,
      Rating,
      Comment
    });

    res.status(201).json({
      message: 'service review created successfully',
      serviceReview: {
        id: review.id,
        user: user,
        service: service,
        Rating: review.Rating,
        Comment: review.Comment
      },
    });
  } catch (error) {
    console.error(error);
    res.status(500).json({ message: 'Internal server error' });
  }
};

exports.deleteReview = async (req, res) => {
  try {
    const reviewId = req.params.id;
    const review = await Review.findByPk(reviewId);

    if (!review) {
      return res.status(404).json({ message: 'Review not found' });
    }

    await Review.destroy({
      where: {
        id: reviewId
      }
    });

    res.status(200).json({
      message: 'Review deleted successfully',
      deletedReview: review
    });
  } catch (error) {
    console.error(error);
    res.status(500).json({ message: 'Internal server error' });
  }
};