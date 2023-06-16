const Umkm = require('../models/umkmModels');
const User  = require('../models/userModels');
const Product = require('../models/productModels');
const Service = require('../models/serviceModels');
const { Op } = require('sequelize');
const natural = require('natural');

exports.recommend = async (req, res) => {
  const category = req.query.category;
  const user_category = category.split(',');

  try {
    const umkm = await Umkm.findAll({
      where: {
        Kategori: {
          [Op.in]: user_category,
        },
      },
      attributes: ['id', 'Nama_usaha', 'Deskripsi', 'Kategori', 'No_hp', 'latitude', 'longitude']
    });

    const nama_usaha = umkm.map((row) => {
      const { Nama_usaha, ...rest } = row.dataValues;
      return {
        Nama_usaha,
        ...rest
      };
    });

    // Converting the place name into vectors and used bigram
    const tfidf = new natural.TfIdf();
    nama_usaha.forEach((doc) => {
      tfidf.addDocument(doc.Nama_usaha);
    });

    const tfidf_matrix = nama_usaha.map((doc) => {
      const vals = {};
      tfidf.listTerms(doc.Nama_usaha.toLowerCase()).forEach((term) => {
        vals[term.term] = tfidf.tfidf(term.term, doc.Nama_usaha.toLowerCase());
      });
      return vals;
    });

    // Calculating the similarity measures based on Cosine Similarity
    const cosineSimilarity = (vec1, vec2) => {
      let dotProduct = 0.0;
      let norm1 = 0.0;
      let norm2 = 0.0;

      for (const key in vec1) {
        if (vec1.hasOwnProperty(key) && vec2.hasOwnProperty(key)) {
          dotProduct += vec1[key] * vec2[key];
          norm1 += vec1[key] * vec1[key];
          norm2 += vec2[key] * vec2[key];
        }
      }

      return dotProduct / (Math.sqrt(norm1) * Math.sqrt(norm2));
    };

    const sg = [];
    nama_usaha.forEach((doc1, i) => {
      const vals = [];
      nama_usaha.forEach((doc2, j) => {
        if (i === j) {
          vals.push(1);
        } else {
          vals.push(cosineSimilarity(tfidf_matrix[i], tfidf_matrix[j]));
        }
      });
      sg.push(vals);
    });

    const sig = sg.map((row, index) => [index, row[0]]);
    sig.sort((a, b) => b[1] - a[1]);
    const produk_indices = sig.slice(0, 20).map((row) => row[0]);

    const recommendation_umkm = produk_indices.map((index) => {
      const row = nama_usaha[index];
      const { id, Nama_usaha, ...rest } = row;
      return {
        id,
        Nama_usaha,
        ...rest
      };
    });

    res.json(recommendation_umkm);
  } catch (error) {
    res.status(500).send({
      message: error.message || 'Some error occurred while recommending UMKM.',
    });
  }
};

exports.nearbyUmkm = async (req, res) => {
  const { latitude, longitude } = req.query;

  // console.log(latitude, longitude);

  try {
    const nerby_umkm = await Umkm.getNearest(latitude, longitude);
    res.send(nerby_umkm);
  } catch (error) {
    res.status(500).send({
      message: error.message || "Some error occurred while retrieving UMKM.",
    });
  }
};

exports.getAllUmkm = async (req, res) => {
  try {
    const umkm = await Umkm.findAll({
      attributes: [
        "id",
        "Nama_usaha",
        "Deskripsi",
        "Kategori",
        "No_hp",
        "latitude",
        "longitude",
      ],
      include: [
        {
          model: User,
          as: "Pemilik",
          attributes: ["name", "alamat", "role"],
        },
      ],
    });

    res.send(umkm);
  } catch (error) {
    res.status(500).send({
      message: error.message || "Some error occurred while retrieving UMKM.",
    });
  }
};

exports.getUmkmById = async (req, res) => {
  const { id } = req.params;

  try {
    const umkm = await Umkm.findByPk(id, {
      attributes: [
        "id",
        "Nama_usaha",
        "Deskripsi",
        "Kategori",
        "No_hp",
        "latitude",
        "longitude",
      ],
    });

    if (!umkm) {
      return res.status(404).send({ message: "Umkm not found" });
    }

    res.send(umkm);
  } catch (error) {
    res.status(500).send({
      message: error.message || "Some error occurred while retrieving Umkm.",
    });
  }
};

exports.getAllUmkmWithProduct = async (req, res) => {
  try {
    const umkms = await Umkm.findAll({
      attributes: [
        "id",
        "Nama_usaha",
        "Deskripsi",
        "Kategori",
        "No_hp",
        "latitude",
        "longitude",
      ],
      include: [
        {
          model: Product,
          attributes: ["id", "Nama", "Harga", "Diskon", "photo"],
          where: {
            id: { [Op.ne]: null },
          },
        },
        {
          model: User,
          as: "Pemilik",
          attributes: ["name", "alamat", "role"],
        },
      ],
    });
    if (umkms.length === 0) {
      res.status(404).send({
        message: "No UMKM found with product data.",
      });
    } else {
      res.send(umkms);
    }
  } catch (error) {
    res.status(500).send({
      message:
        error.message ||
        "Some error occurred while retrieving UMKM with product data.",
    });
  }
};

exports.getAllUmkmWithService = async (req, res) => {
  try {
    const umkms = await Umkm.findAll({
      attributes: [
        "id",
        "Nama_usaha",
        "Deskripsi",
        "Kategori",
        "No_hp",
        "latitude",
        "longitude",
      ],
      include: [
        {
          model: Service,
          attributes: ["id", "Nama", "Harga", "Diskon"],
          where: {
            id: { [Op.ne]: null },
          },
        },
        {
          model: User,
          as: "Pemilik",
          attributes: ["name", "alamat", "role"],
        },
      ],
    });
    if (umkms.length === 0) {
      res.status(404).send({
        message: "No UMKM found with service data.",
      });
    } else {
      res.send(umkms);
    }
  } catch (error) {
    res.status(500).send({
      message:
        error.message ||
        "Some error occurred while retrieving UMKM with product data.",
    });
  }
};

exports.getProductByUmkmId = async (req, res) => {
  try {
    const products = await Product.findAll({
      where: {
        id_umkm: {
          [Op.eq]: req.params.id,
        },
      },
    });
    if (!products) {
      res.status(404).send({
        message: `No product associated with UMKM with id ${req.params.id}`,
      });
    } else {
      res.send(products);
    }
  } catch (error) {
    res.status(500).send({
      message: error.message || "Some error occurred while retrieving product.",
    });
  }
};

exports.getServiceByUmkmId = async (req, res) => {
  try {
    const services = await Service.findAll({
      where: {
        id_umkm: {
          [Op.eq]: req.params.id,
        },
      },
    });
    if (!services) {
      res.status(404).send({
        message: `No service associated with UMKM with id ${req.params.id}`,
      });
    } else {
      res.send(services);
    }
  } catch (error) {
    res.status(500).send({
      message: error.message || "Some error occurred while retrieving service.",
    });
  }
};

exports.createUmkm = async (req, res) => {
  try {
    const userId = req.params.userid;
    const { Nama_usaha, Deskripsi, Kategori, No_hp, latitude, longitude } =
      req.body;

    const user = await User.findByPk(userId);
    if (!user) {
      return res.status(404).json({ message: "user not found" });
    }

    const createdUmkm = await Umkm.create({
      id_user: userId,
      Nama_usaha,
      Deskripsi,
      Kategori,
      No_hp,
      latitude,
      longitude,
    });

    res.status(201).json({
      message: "UMKM created successfully",
      umkm: {
        id: createdUmkm.id,
        user,
        Nama_usaha: createdUmkm.Nama_usaha,
        Deskripsi: createdUmkm.Deskripsi,
        Kategori: createdUmkm.Kategori,
        No_hp: createdUmkm.No_hp,
        latitude: createdUmkm.latitude,
        longitude: createdUmkm.longitude,
      },
    });
  } catch (error) {
    console.error(error);
    res.status(500).json({ message: "Internal server error" });
  }
};

exports.updateUmkm = async (req, res) => {
  const userId = req.params.id;
  const { Nama_usaha, Deskripsi, Kategori, No_hp, latitude, longitude } =
    req.body;
  try {
    const user = await User.findByPk(userId);
    if (!user) {
      return res.status(404).json({ message: "user not found" });
    }
    const umkm = await Umkm.findOne({ where: { id_user: userId } });
    if (!umkm) {
      return res.status(404).json({ message: "umkm not found" });
    }
    let updatedUmkm = {};
    updatedUmkm = await umkm.update({
      Nama_usaha,
      Deskripsi,
      Kategori,
      No_hp,
      latitude,
      longitude,
    });
    res.status(200).json({
      message: "umkm updated successfully",
      umkm: {
        id: updatedUmkm.id,
        user: user,
        Nama_usaha: updatedUmkm.Nama_usaha,
        Deskripsi: updatedUmkm.Deskripsi,
        Kategori: updatedUmkm.Kategori,
        No_hp: updatedUmkm.No_hp,
        latitude: updatedUmkm.latitude,
        longitude: updatedUmkm.longitude,
      },
    });
  } catch (error) {
    console.error(error);
    res.status(500).json({ message: "Internal server error" });
  }
};

exports.deleteUmkm = async (req, res) => {
  const id = req.params.id;

  try {
    // Hapus terlebih dahulu produk yang terkait dengan UMKM
    await Product.destroy({
      where: { id_umkm: id },
    });
    // Hapus juga layanan yang terkait dengan UMKM
    await Service.destroy({
      where: { id_umkm: id },
    });
    // Setelah produk dihapus, hapus UMKM
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
      message:
        error.message ||
        `Some error occurred while deleting UMKM with id ${id}.`,
    });
  }
};

