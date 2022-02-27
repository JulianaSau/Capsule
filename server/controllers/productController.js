const asyncHandler = require("express-async-handler");
const Product = require("../models/product.model");

const createProduct = asyncHandler(async (req, res) => {
  const {
    title,
    description,
    images,
    colors,
    price,
    rating,
    isPopular,
    isFavourite,
    number_in_stock,
    category,
  } = req.body;

  if (
    !title ||
    !description ||
    !images ||
    !colors ||
    !price ||
    !number_in_stock ||
    !category
  ) {
    res.status(400);
    throw new Error("Please fill all fields");
  }

  const product = await Product.create({
    title,
    description,
    images,
    colors,
    price,
    rating,
    isPopular,
    isFavourite,
    number_in_stock,
    category,
  });

  if (product) {
    res.status(201).json({
      _id: product._id,
      title: product.title,
    });
  } else {
    res.status(400);
    throw new Error("Failed to create the product");
  }
});

// /api/user?search=janedoe
const allProducts = asyncHandler(async (req, res) => {
  try {
    const products = await Product.find({}, {}, { lean: true });

    res.status(200).json(products);
  } catch (error) {
    res.status(400);
    throw new Error("Failed to get the products");
  }
});

const getProduct = asyncHandler(async (req, res, next) => {
  const id = req.params.id;

  if (!id) {
    console.log("product id parameter not sent with request");
    return res.sendStatus(400);
  }
  try {
    var product = await Product.findOne({ _id: req.params.id });
    if (product) {
      res.status(200).json(product);
    } else {
      return res.status(404).send("cannot find product with that id");
    }
  } catch (error) {
    return res.status(500).send("cannot find product with that id");
  }
});

const deleteProduct = asyncHandler(async (req, res, next) => {
  const id = req.params.id;

  if (!id) {
    console.log("product id parameter not sent with request");
    return res.sendStatus(400);
  }
  try {
    const product = await Product.findByIdAndDelete({ _id: req.params.id });
    if (product) {
      return res.status(201).json({
        message: "Task deleted",
      });
    } else {
      return res.status(400).json({
        message: "Something went wrong when deleting the task",
      });
    }
  } catch (error) {
    res.status(400);
    throw new Error("Failed to delete the product");
  }
});

const updateProduct = asyncHandler(async (req, res, next) => {
  try {
    const product = await Product.findById({ _id: req.params.id });
    if (product) {
      const willBeUpdated = await Product.findByIdAndUpdate(
        { _id: req.params.id },
        req.body,
        { lean: true, new: true }
      );
      if (willBeUpdated) {
        return res.status(201).json({
          message: "Task updated",
        });
      } else {
        return res.status(400).json({
          message: "Something went wrong when updating the task",
        });
      }
    } else {
      return res.status(404).json({
        message: "No record found",
      });
    }
  } catch (error) {
    res.status(400);
    throw new Error("Failed to update the product");
  }
});

module.exports = {
  createProduct,
  allProducts,
  deleteProduct,
  updateProduct,
  getProduct,
};
