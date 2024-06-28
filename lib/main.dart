import 'package:agroera_project/admin/datacustomer/datacustomer.dart';
import 'package:agroera_project/admin/dataseller/dataseller.dart';
import 'package:agroera_project/admin/mainpage_admin/mainpage_admin.dart';
import 'package:agroera_project/customer/cart_page_customer/cart_page_customer.dart';
import 'package:agroera_project/customer/purchasepage_status_customer/purchasepage_status_customer.dart';
import 'package:agroera_project/customer/detailproduct_page_customer/detailproduct_page_alatpertanian.dart';
import 'package:agroera_project/customer/detailproduct_page_customer/detailproduct_page_bibit.dart';
import 'package:agroera_project/customer/detailproduct_page_customer/detailproduct_page_pupuk.dart';
import 'package:agroera_project/customer/detailproduct_page_customer/detailproduct_page_racunhama.dart';
import 'package:agroera_project/customer/detailproduct_page_customer/detailproduct_page_sprayer.dart';
import 'package:agroera_project/customer/payment_page_customer/payment_page_customer.dart';
import 'package:agroera_project/customer/product_for_customer.dart/product_for_customer_bibit%20copy.dart';
import 'package:agroera_project/customer/product_for_customer.dart/product_for_customer_pupuk%20copy.dart';
import 'package:agroera_project/customer/product_for_customer.dart/product_for_customer_alatpertanian.dart';
import 'package:agroera_project/customer/product_for_customer.dart/product_for_customer_racunhama.dart';
import 'package:agroera_project/customer/product_for_customer.dart/product_for_customer_sprayer%20copy%202.dart';
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
import 'package:agroera_project/services/auth_services_customer.dart';
import 'package:agroera_project/splash_screen/splash_screen.dart';
import 'package:agroera_project/utils/loadingview.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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
  Future<String?> _getUserRole(String uid) async {
    print("Checking role for UID: $uid");
    DocumentSnapshot userDoc;
    userDoc =
        await FirebaseFirestore.instance.collection('customers').doc(uid).get();
    if (userDoc.exists) {
      print("user found in customers${userDoc.exists}");
      return 'customers';
    }

    userDoc =
        await FirebaseFirestore.instance.collection('sellers').doc(uid).get();
    if (userDoc.exists) {
      print("user found in sellers ${userDoc.exists}");
      return 'sellers';
    }

    userDoc =
        await FirebaseFirestore.instance.collection('admin').doc(uid).get();
    if (userDoc.exists) {
      print("user found in admin ${userDoc.exists}");
      return 'admin';
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
        stream: _authServices.streamAuthStatus,
        builder: (context, snapshot) {
          print(snapshot.data);
          if (snapshot.connectionState == ConnectionState.active) {
            if (snapshot.data != null) {
              print("User is authenticated: ${snapshot.data!.uid}");
              return FutureBuilder(
                  future: _getUserRole(snapshot.data!.uid),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return LoadingView();
                    } else if (snapshot.hasError) {
                      print("${snapshot.hasError}");
                      return Center(
                        child: Text("Error : ${snapshot.error}"),
                      );
                    } else if (snapshot.hasData) {
                      //return sesuatu ketika hasdata bernilai True. Code dibawah
                      // akan dijalankan
                      try {
                        String? role = snapshot.data;
                        if (role == "customers") {
                          return MaterialApp(
                            debugShowCheckedModeBanner: false,
                            home: MainPageCustomer(),
                            routes: {
                              "MainPageCustomer": (context) =>
                                  MainPageCustomer(),
                              "SplashScreen": (context) => SplashScreen(),
                              "LandingPage": (context) => LandingPage(),
                              "LoginPageCustomer": (context) =>
                                  LoginPageCustomer(),
                              "SignupPageCustomer": (context) =>
                                  SignupPageCustomer(),
                              "MainPageCustomer": (context) =>
                                  MainPageCustomer(),
                              "ProductForCustomerBibit": (context) =>
                                  ProductForCustomerBibit(category: "Bibit"),
                              "ProductForCustomerPupuk": (context) =>
                                  ProductForCustomerPupuk(category: "Pupuk"),
                              "ProductForCustomerSprayer": (context) =>
                                  ProductForCustomerSprayer(
                                      category: "Sprayer"),
                              "ProductForCustomerAlatPertanian": (context) =>
                                  ProductForCustomerAlatPertanian(
                                      category: "Alat Pertanian"),
                              "ProductForCustomerRacunHama": (context) =>
                                  ProductForCustomerRacunHama(
                                      category: "Racun Hama"),
                              "DetailProductPagePupuk": (context) =>
                                  DetailProductPagePupuk(category: "Pupuk"),
                              "DetailProductPageBibit": (context) =>
                                  DetailProductPageBibit(category: "Bibit"),
                              "DetailProductPageSprayer": (context) =>
                                  DetailProductPageSprayer(category: "Sprayer"),
                              "DetailProductPageAlatPertanian": (context) =>
                                  DetailProductPageAlatPertanian(
                                      category: "Alat Pertanian"),
                              "DetailProductPageRacunHama": (context) =>
                                  DetailProductPageRacunHama(
                                      category: "Racun Hama"),
                              "CartPageCustomer": (context) =>
                                  CartPageCustomer(),
                              "PaymentPageCustomer": (context) =>
                                  PaymentPageCustomer(),
                              "DeliveryPageStatusCustomer": (context) =>
                                  DeliveryPageStatusCustomer(),
                            },
                          );
                        } else if (role == "sellers") {
                          return MaterialApp(
                            debugShowCheckedModeBanner: false,
                            home: MainPageSeller(),
                            routes: {
                              "DataSeller": (context) => DataSeller(),
                              "SignupPageSeller": (context) =>
                                  SignupPageSeller(),
                              "LoginPageSeller": (context) => LoginPageSeller(),
                              "MainPageSeller": (context) => MainPageSeller(),
                              "CreatePageStoreSeller": (context) =>
                                  CreatePageStoreSeller(),
                              "ProductSellerPage": (context) =>
                                  ProductSellerPage(),
                              "DetailOrderHistorySeller": (context) =>
                                  DetailOrderHistorySeller(),
                            },
                          );
                        } else if (role == "admin") {
                          return MaterialApp(
                            debugShowCheckedModeBanner: false,
                            home: AdminPage(),
                            routes: {
                              "AdminPage": (context) => AdminPage(),
                              "DataCustomer": (context) => DataCustomer(),
                              "DataSeller": (context) => DataSeller(),
                            },
                          );
                        } else {
                          return MaterialApp(
                            debugShowCheckedModeBanner: false,
                            home: SplashScreen(),
                            routes: {
                              "SplashScreen": (context) => SplashScreen(),
                              "LandingPage": (context) => LandingPage(),
                              "LoginPageCustomer": (context) =>
                                  LoginPageCustomer(),
                              "SignupPageCustomer": (context) =>
                                  SignupPageCustomer(),
                            },
                          );
                        }
                      } catch (e) {
                        print(e);
                        return Center(
                          child: Text("Terjadi kesalahan"),
                        );
                      }
                    } else {
                      return Center(
                        child: Text("User role not found"),
                      );
                    }
                  });
            } else {
              print("No authenticated user found");
              // return Center(
              //   child: Text("No authenticated user found"),
              // );
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                home: SplashScreen(),
                routes: {
                  "SplashScreen": (context) => SplashScreen(),
                  "LandingPage": (context) => LandingPage(),
                  "LoginPageCustomer": (context) => LoginPageCustomer(),
                  "SignupPageCustomer": (context) => SignupPageCustomer(),
                  "LoginPageSeller": (context) => LoginPageSeller(),
                  "MainPageSeller": (context) => MainPageSeller(),
                  "AdminPage": (context) => AdminPage(),
                },
              );
            }
          } else {
            return LoadingView();
          }
        });
  }
}
