import 'package:agroera_project/admin/datacustomer/datacustomer.dart';
import 'package:agroera_project/admin/dataseller/dataseller.dart';
import 'package:agroera_project/admin/mainpage_admin/mainpage_admin.dart';
import 'package:agroera_project/customer/cart_page_customer/cart_page_customer.dart';
import 'package:agroera_project/customer/deliverypage_status_customer/deliverypage_status_customer.dart';
import 'package:agroera_project/customer/detailproduct_page_customer/detailproduct_page_customer.dart';
import 'package:agroera_project/customer/payment_page_customer/payment_page_customer.dart';
import 'package:agroera_project/customer/product_for_customer.dart/product_for_customer.dart';
import 'package:agroera_project/landing_page/landing_page.dart';
import 'package:agroera_project/customer/login_page_customer/login_page_customer.dart';
import 'package:agroera_project/customer/main_page_customer.dart/main_page_customer.dart';
import 'package:agroera_project/customer/signup_page_customer.dart/signup_page_customer.dart';
import 'package:agroera_project/models/model_category_product.dart';
import 'package:agroera_project/seller/addproduct_seller/addpage_productseller.dart';
import 'package:agroera_project/seller/createpage_store_seller/createpage_store_seller.dart';
import 'package:agroera_project/seller/detail_orderhistory_seller/detail_orderhistory_seller.dart';
import 'package:agroera_project/seller/login_page_seller/login_page_seller.dart';
import 'package:agroera_project/seller/mainpage_seller/main_page_seller.dart';
import 'package:agroera_project/seller/signup_page_seller/signup_page_seller.dart';
import 'package:agroera_project/services/auth_services.dart';
import 'package:agroera_project/splash_screen/splash_screen.dart';
import 'package:agroera_project/utils/loadingview.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(AgroEraApp());
}

class AgroEraApp extends StatelessWidget {
  final AuthServices _authServices = AuthServices();
  AgroEraApp({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
        stream: _authServices.streamAuthStatus,
        builder: (context, snapshot) {
          print(snapshot);
          if (snapshot.connectionState == ConnectionState.active) {
            print("this is ${snapshot.data}");
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              initialRoute: snapshot.data == null
                  ? SplashScreen().toString()
                  : MainPageCustomer().toString(),
              routes: {
                "SplashScreen": (context) => SplashScreen(),
                "LandingPage": (context) => LandingPage(),
                "LoginPageCustomer": (context) => LoginPageCustomer(),
                "SignupPageCustomer": (context) => SignupPageCustomer(),
                "MainPageCustomer": (context) => MainPageCustomer(),
                "ProductForCustomer": (context) => ProductForCustomer(),
                "DetailProductPageCustomer": (context) =>
                    DetailProductPageCustomer(categoryP: CategoryProduct()),
                "CartPageCustomer": (context) => CartPageCustomer(),
                "PaymentPageCustomer": (context) => PaymentPageCustomer(),
                "DeliveryPageStatusCustomer": (context) =>
                    DeliveryPageStatusCustomer(),
                "AdminPage": (context) => AdminPage(),
                "DataCustomer": (context) => DataCustomer(),
                "DataSeller": (context) => DataSeller(),
                "SignupPageSeller": (context) => SignupPageSeller(),
                "LoginPageSeller": (context) => LoginPageSeller(),
                "MainPageSeller": (context) => MainPageSeller(),
                "CreatePageStoreSeller": (context) => CreatePageStoreSeller(),
                "ProductSellerPage": (context) => ProductSellerPage(),
                "DetailOrderHistorySeller": (context) =>
                    DetailOrderHistorySeller(),
              },
            );
          } else {
            return LoadingView();
          }
        });
  }
}
