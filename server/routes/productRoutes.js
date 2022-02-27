const express = require("express");
const {
  createProduct,
  allProducts,
  updateProduct,
  getProduct,
  deleteProduct,
} = require("../controllers/productController");
// const { protect } = require("../middlewares/authMiddleware");

const router = express.Router();

router.route("/").post(createProduct).get(
  // protect,
  allProducts
);
router.route("/:id").post(updateProduct).get(getProduct).delete(deleteProduct);
// router.post("/login", authUser);

module.exports = router;
