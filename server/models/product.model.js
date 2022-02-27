const mongoose = require("mongoose");

const productSchema = mongoose.Schema(
  {
    title: { type: String, required: true },
    description: { type: String, required: true },
    images: { type: String, required: true },
    colors: { type: String, required: true },
    category: {
      type: String,
      required: true,
      default: "Personal Protective Equipment",
    },
    price: { type: Number, required: true, default: 0.0 },
    rating: { type: Number, required: false, default: 0.0 },
    isPopular: { type: Boolean, default: false },
    isFavourite: { type: Boolean, default: false },
    number_in_stock: { type: Number, required: true, default: 0.0 },
  },
  {
    timestamps: true,
  }
);

const Product = mongoose.model("Product", productSchema);

module.exports = Product;
