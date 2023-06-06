const { Storage } = require('@google-cloud/storage');
const multer = require('multer');
const path = require('path');
const { v4: uuidv4 } = require('uuid');

const storage = new Storage({
  projectId: 'phonic-monolith-385208',
  keyFilename: './service-account-key.json'
});

const bucket = storage.bucket('storage-api-jualin');

const storageGCS = multer.memoryStorage({
  destination: (req, file, cb) => {
    cb(null, '');
  }
});

const fileFilter = (req, file, cb) => {
  if (file.mimetype === 'image/jpeg' || file.mimetype === 'image/png') {
    cb(null, true);
  } else {
    cb(null, false);
  }
};

const upload = multer({
  storage: storageGCS,
  fileFilter: fileFilter,
  limits: {
    fileSize: 5 * 1024 * 1024 // limit file size to 5MB
  }
});

const uploadFileToGCS = (file) => {
  return new Promise((resolve, reject) => {
    const gcsFileName = uuidv4() + path.extname(file.originalname);
    const fileUpload= bucket.file(gcsFileName);

    const stream = fileUpload.createWriteStream({
      metadata: {
        contentType: file.mimetype
      },
      resumable: false
    });

    stream.on('error', (err) => {
      reject(err);
    });

    stream.on('finish', () => {
      fileUpload.makePublic().then(() => {
        resolve(`https://storage.googleapis.com/${bucket.name}/${gcsFileName}`);
      });
    });

    stream.end(file.buffer);
  });
};

module.exports = { upload, uploadFileToGCS, bucket  };