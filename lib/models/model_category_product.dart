class CategoryProduct {
  String? categoryname;
  String? image;

  CategoryProduct({
    this.categoryname,
    this.image,
  });
}

var categoryProduct = [
  CategoryProduct(
    categoryname: "Bibit",
    image: "assets/images/bibit.png",
  ),
  CategoryProduct(
    categoryname: "Pupuk",
    image: "assets/images/pupuk.png",
  ),
  CategoryProduct(
    categoryname: "Sprayer",
    image: "assets/images/sprayer.png",
  ),
  CategoryProduct(
    categoryname: "Alat Pertanian",
    image: "assets/images/alatpertanian.png",
  ),
  CategoryProduct(
    categoryname: "Racun Hama",
    image: "assets/images/poison.png",
  ),
];
