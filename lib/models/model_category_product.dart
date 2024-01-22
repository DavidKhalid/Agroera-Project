class CategoryProduct {
  String? name;
  String? image;
  int? price;
  int? quantity;
  String? description;

  CategoryProduct(
      {this.name, this.image, this.price, this.quantity, this.description});
}

var categoryProduct = [
  CategoryProduct(
      name: "Bibit",
      image: "assets/images/bibit.png",
      price: 100000,
      quantity: 1000,
      description: "Ini adalah bibit padi"),
  CategoryProduct(
      name: "Pupuk",
      image: "assets/images/pupuk.png",
      price: 200000,
      quantity: 1000,
      description: "Ini adalah pupuk untuk padi"),
  CategoryProduct(
      name: "Sprayer",
      image: "assets/images/sprayer.png",
      price: 300000,
      quantity: 1000,
      description:
          "Ini dapat digunakan untuk menyemprotkan obat hama untuk padi"),
  CategoryProduct(
      name: "Alat Pertanian",
      image: "assets/images/alatpertanian.png",
      price: 400000,
      quantity: 1000,
      description: "Ini adalah alat-alat yang digunakan pada sektor pertanian"),
  CategoryProduct(
      name: "Poison",
      image: "assets/images/poison.png",
      price: 500000,
      quantity: 1000,
      description:
          "Ini adalah obat yang digunakan untuk memusnahkan hama padi"),
];
