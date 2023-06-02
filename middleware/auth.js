const bcrypt = require('bcrypt');
const jwt = require('jsonwebtoken');
require('dotenv').config();

const saltRounds = 10;

exports.hashPassword = (password) => {
  return bcrypt.hashSync(password, saltRounds);
};

exports.comparePassword = (password, hash) => {
  return bcrypt.compareSync(password, hash);
};

exports.auth = (req, res, next) => {
  const token = req.header('Authorization');
  if (!token) {
    return res.status(401).json({ message: 'Authorization denied' });
  }

  try {
    const decoded = jwt.verify(token, process.env.JWT_SECRET);
    req.user = decoded.user;
    // console.log(decoded)
    next();
  } catch (err) {
    res.status(401).json({ message: 'Invalid token' });
  }
};

exports.authSellers = (req, res, next) => {
  const token = req.header('Authorization');
  if (!token) {
    return res.status(401).json({ message: 'Authorization denied' });
  }

  try {
    const decoded = jwt.verify(token, process.env.JWT_SECRET);
    req.user = decoded;
    // console.log(decoded)
    if (!req.user || req.user.role !== 'Sellers') {
      return res.status(403).json({ message: 'Access denied' });
    }
    next();
  } catch (err) {
    // console.log(err); // Log the error for debugging purposes
    res.status(401).json({ message: 'Invalid token' });
  }
};

