const mongoose = require("mongoose");

const productSchema = mongoose.Schema(
  {
    title: { type: String, required: true },
    description: { type: String, required: true },
    images: {
      type: Array,
      required: true,
      default:
        "https://images.unsplash.com/photo-1584308666744-24d5c474f2ae?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8bWVkaWNpbmV8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60",
    },
    colors: { type: Array, required: true },
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
