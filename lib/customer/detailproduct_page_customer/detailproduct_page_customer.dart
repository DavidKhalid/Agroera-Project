import 'package:agroera_project/models/model_category_product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import '../cart_page_customer/cart_page_customer.dart';

bool isFavorite = false;

class DetailProductPageCustomer extends StatefulWidget {
  final CategoryProduct categoryP;
  //  final List<Map<String, String>> products;

  static const nameRoutes = "DetailProductPageCustomer";
  const DetailProductPageCustomer({super.key, required this.categoryP});

  @override
  State<DetailProductPageCustomer> createState() =>
      _DetailProductPageCustomerState();
}

class _DetailProductPageCustomerState extends State<DetailProductPageCustomer> {
  @override
  Widget build(BuildContext context) {
    // final categoryproduct =
    //     ModalRoute.of(context)!.settings.arguments as CategoryProduct;
    final mediaqueryHeight = MediaQuery.of(context).size.height;
    final mediaqueryWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Icon(
            FeatherIcons.arrowLeftCircle,
            color: Colors.green.shade800,
            size: 30,
          ),
        ),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: SizedBox(
          height: mediaqueryHeight,
          width: mediaqueryWidth,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              //_arrowBack(context),
              _contentImage(mediaqueryHeight, mediaqueryWidth),
              _favoritebutton(),
              _productname(),
              _price(),
              _description(),
              const Divider(
                indent: 20,
                endIndent: 20,
                color: Colors.black,
              ),
              _fillDescription(mediaqueryHeight, mediaqueryWidth, context)
            ],
          ),
        ),
      )),
    );
  }

  Expanded _favoritebutton() {
    return Expanded(
      flex: 0,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: IconButton(
            onPressed: () {
              setState(() {
                isFavorite = !isFavorite;
              });
            },
            icon: Icon(
              isFavorite ? Icons.favorite : Icons.favorite_border_outlined,
              size: 30,
              color: Colors.red,
            )),
      ),
    );
  }

  Expanded _fillDescription(
      double mediaqueryHeight, double mediaqueryWidth, BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamed(CartPageCustomer.nameRoutes);
        },
        child: Container(
          margin: const EdgeInsets.only(left: 20, right: 20, top: 0),
          height: mediaqueryHeight,
          width: mediaqueryWidth,
          decoration: BoxDecoration(
              //color: Colors.amber.shade500,
              ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _textfilldescription(),
              _buttoncart_andiconshoppingbag(mediaqueryHeight, mediaqueryWidth),
              SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }

  Expanded _buttoncart_andiconshoppingbag(
      double mediaqueryHeight, double mediaqueryWidth) {
    return Expanded(
      child: Container(
        height: mediaqueryHeight,
        width: mediaqueryWidth,
        decoration: BoxDecoration(
          color: Colors.green.shade800,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.green.shade800, width: 2),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(FeatherIcons.shoppingBag, color: Colors.white),
            Container(
              margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
              height: mediaqueryHeight,
              width: mediaqueryWidth / 2,
              child: Center(
                child: Text(
                  "ADD TO CART",
                  style: GoogleFonts.roboto(
                      fontSize: 18,
                      color: Colors.green.shade800,
                      fontWeight: FontWeight.w900),
                ),
              ),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
            ),
          ],
        ),
      ),
    );
  }

  Expanded _textfilldescription() {
    return Expanded(
      child: Text(
        textAlign: TextAlign.justify,
        overflow: TextOverflow.ellipsis,
        maxLines: 3,
        widget.categoryP.description.toString(),
        style: GoogleFonts.alegreya(fontWeight: FontWeight.w500, fontSize: 16),
      ),
    );
  }

  Row _description() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 20, top: 15),
            child: Text(
              "Description",
              style: GoogleFonts.alegreya(
                  fontSize: 20, fontWeight: FontWeight.w700),
            ),
          ),
        )
      ],
    );
  }

  Row _price() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 20, top: 4),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Price",
                  style: GoogleFonts.alegreya(
                      fontSize: 20, fontWeight: FontWeight.w800),
                ),
                Text(
                  overflow: TextOverflow.ellipsis,
                  widget.categoryP.price.toString(),
                  style: GoogleFonts.alegreya(
                      fontSize: 16, fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Row _productname() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              widget.categoryP.categoryname.toString(),
              style: GoogleFonts.alegreya(
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                  color: Colors.black),
            ),
          ),
        ),
      ],
    );
  }

  Expanded _contentImage(double mediaqueryHeight, double mediaqueryWidth) {
    return Expanded(
      flex: 4,
      child: Container(
        margin: const EdgeInsets.only(left: 20, top: 10, right: 20),
        height: mediaqueryHeight / 2.3,
        width: mediaqueryWidth,
        decoration: BoxDecoration(
          color: Colors.grey.shade400,
          image: DecorationImage(
              image: AssetImage(widget.categoryP.image.toString()),
              fit: BoxFit.cover),
          borderRadius: BorderRadius.circular(25),
        ),
      ),
    );
  }

  // Row _arrowBack(BuildContext context) {
  //   return Row(
  //     children: [
  //       Expanded(
  //         child: Container(
  //           margin: const EdgeInsets.only(left: 20),
  //           child: IconButton(
  //               alignment: Alignment.bottomLeft,
  //               onPressed: () {
  //                 Navigator.of(context).pop();
  //               },
  //               icon: const Icon(FeatherIcons.arrowLeftCircle)),
  //         ),
  //       ),
  //     ],
  //   );
  // }
}
