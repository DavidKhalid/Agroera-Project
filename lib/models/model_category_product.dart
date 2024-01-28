class CategoryProduct {
  String? categoryname;
  String? image;
  String? price;
  int? quantity;
  String? description;
  dynamic? product;

  CategoryProduct(
      {this.categoryname,
      this.image,
      this.price,
      this.quantity,
      this.description,
      this.product});
}

var categoryProduct = [
  CategoryProduct(
      categoryname: "Bibit",
      image: "assets/images/bibit.png",
      price: "100.000",
      quantity: 1000,
      product: [
        {
          "Product Name :": "Bibit 1",
          "Harga": "100.000",
          "Kuantitas": "10000",
          "image": "https://picsum.photos/id/1/200/300"
        },
        {
          "Product Name :": "Bibit 2",
          "Harga": "200.000",
          "Kuantitas": "20000",
          "image": "https://picsum.photos/id/2/200/300"
        },
        {
          "Product Name :": "Bibit 3",
          "Harga": "300.000",
          "Kuantitas": "30000",
          "image": "https://picsum.photos/id/3/200/300"
        },
      ],
      description: "Ini adalah bibit padi"),
  CategoryProduct(
      categoryname: "Pupuk",
      image: "assets/images/pupuk.png",
      price: "200.000",
      quantity: 1000,
      description: "Ini adalah pupuk untuk padi"),
  CategoryProduct(
      categoryname: "Sprayer",
      image: "assets/images/sprayer.png",
      price: "300.000",
      quantity: 1000,
      description:
          "Ini dapat digunakan untuk menyemprotkan obat hama untuk padi"),
  CategoryProduct(
      categoryname: "Alat Pertanian",
      image: "assets/images/alatpertanian.png",
      price: "400.000",
      quantity: 1000,
      description: "Ini adalah alat-alat yang digunakan pada sektor pertanian"),
  CategoryProduct(
      categoryname: "Racun Hama",
      image: "assets/images/poison.png",
      price: "500.000",
      quantity: 1000,
      description:
          "Ini adalah obat yang digunakan untuk memusnahkan hama padi"),
  CategoryProduct(
      categoryname: "Racun Hama",
      image: "assets/images/poison.png",
      price: "500.000",
      quantity: 1000,
      description:
          "Ini adalah obat yang digunakan untuk memusnahkan hama padi"),
  CategoryProduct(
      categoryname: "Racun Hama",
      image: "assets/images/poison.png",
      price: "500.000",
      quantity: 1000,
      description:
          "Ini adalah obat yang digunakan untuk memusnahkan hama padi"),
  CategoryProduct(
      categoryname: "Racun Hama",
      image: "assets/images/poison.png",
      price: "500.000",
      quantity: 1000,
      description:
          "Ini adalah obat yang digunakan untuk memusnahkan hama padi"),
  CategoryProduct(
      categoryname: "Racun Hama",
      image: "assets/images/poison.png",
      price: "500.000",
      quantity: 1000,
      description:
          "Ini adalah obat yang digunakan untuk memusnahkan hama padi"),
  CategoryProduct(
      categoryname: "Racun Hama",
      image: "assets/images/poison.png",
      price: "500.000",
      quantity: 1000,
      description:
          "Ini adalah obat yang digunakan untuk memusnahkan hama padi"),
  CategoryProduct(
      categoryname: "Racun Hama",
      image: "assets/images/poison.png",
      price: "500.000",
      quantity: 1000,
      description:
          "Ini adalah obat yang digunakan untuk memusnahkan hama padi"),
  CategoryProduct(
      categoryname: "Racun Hama",
      image: "assets/images/poison.png",
      price: "500.000",
      quantity: 1000,
      description:
          "Ini adalah obat yang digunakan untuk memusnahkan hama padi"),
];
