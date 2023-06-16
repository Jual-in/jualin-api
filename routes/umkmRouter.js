const express = require("express");
const router = express.Router();
const umkmController = require("../controllers/umkmController");
const auth = require("../middleware/auth");

router.get("/nearby", umkmController.nearbyUmkm);
router.get('/rekomendasi', umkmController.recommend);

router.get("/", auth.auth, umkmController.getAllUmkm);
router.get("/:id", auth.auth, umkmController.getUmkmById);
router.get("/:id/product", auth.auth, umkmController.getProductByUmkmId);
router.get("/:id/service", auth.auth, umkmController.getServiceByUmkmId);

router.get(
  "/umkmproduct/allProduct",
  auth.auth,
  umkmController.getAllUmkmWithProduct
);
router.get(
  "/umkmproduct/allService",
  auth.auth,
  umkmController.getAllUmkmWithService
);

router.post(
  "/create/users/:userid",
  auth.authSellers,
  umkmController.createUmkm
);
router.put("/update/users/:id", auth.authSellers, umkmController.updateUmkm);
router.delete("/delete/:id", auth.authSellers, umkmController.deleteUmkm);

module.exports = router;
