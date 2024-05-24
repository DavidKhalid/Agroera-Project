// SafeArea(
//             child: Stack(
//               children: [
//                 _imageprofile(mediaqueryHeight, mediaqueryWidth),
//                 Column(
//                   children: [
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Padding(
//                           padding: const EdgeInsets.only(top: 100, left: 20),
//                           child: Text(
//                             "username",
//                             style: GoogleFonts.roboto(
//                                 fontSize: 16,
//                                 color: Colors.black,
//                                 fontWeight: FontWeight.w500),
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.only(top: 100, right: 20),
//                           child: Text(
//                             "Alberto",
//                             style: GoogleFonts.roboto(
//                                 fontSize: 16,
//                                 color: Colors.black,
//                                 fontWeight: FontWeight.w500),
//                           ),
//                         ),
//                       ],
//                     ),
//                     Row(
//                       // crossAxisAlignment: CrossAxisAlignment.start,
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         //
//                         Padding(
//                           padding: const EdgeInsets.only(top: 50, left: 20),
//                           child: Text(
//                             "Email",
//                             style: GoogleFonts.roboto(
//                                 fontSize: 16,
//                                 color: Colors.black,
//                                 fontWeight: FontWeight.w500),
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.only(top: 50, right: 20),
//                           child: Text(
//                             "example@gmail.com",
//                             style: GoogleFonts.roboto(
//                                 fontSize: 16,
//                                 color: Colors.black,
//                                 fontWeight: FontWeight.w500),
//                           ),
//                         ),
//                       ],
//                     ),
//                     SizedBox(
//                       height: 500,
//                     ),
//                     GestureDetector(
//                       onTap: () {
//                         _authServices.logOut(context);
//                         // Navigator.of(context)
//                         //     .pushNamed(LoginPageCustomer.nameRoutes);
//                       },
//                       child: Container(
//                         height: 50,
//                         width: 200,
//                         decoration: BoxDecoration(
//                             color: Colors.green.shade800,
//                             borderRadius: BorderRadius.circular(20)),
//                         child: Center(
//                           child: Text(
//                             "Logout",
//                             style: GoogleFonts.roboto(
//                                 fontSize: 20,
//                                 fontWeight: FontWeight.w900,
//                                 color: Colors.white),
//                           ),
//                         ),
//                       ),
//                     )
//                   ],
//                 )
//               ],
//             ),
//           );