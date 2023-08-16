// import 'dart:io';

// import 'package:csc_picker/csc_picker.dart';
// import 'package:destinaction/main.dart';
// import 'package:destinaction/nav_bar.dart';
// import 'package:destinaction/signin.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:intl_phone_field/phone_number.dart';
// import 'package:page_transition/page_transition.dart';
// import 'package:intl_phone_field/intl_phone_field.dart';

// import 'controller/driving school controller.dart';
// import 'controller/travel agency controller.dart';

// final _submit = GlobalKey<FormState>();

// class ServiceDrivingSchoolDriver extends StatefulWidget {
//   @override
//   _serviceDrivingSchoolStateDriver createState() =>
//       _serviceDrivingSchoolStateDriver();
// }

// class _serviceDrivingSchoolStateDriver extends State<ServiceDrivingSchoolDriver> {
//   TextEditingController _firstname = TextEditingController();
//   TextEditingController _lastname = TextEditingController();
//   DateTime _dob = DateTime(1965, 11, 25);
//   PhoneNumber? _phone;
//   TextEditingController _email = TextEditingController();
//   TextEditingController _cni = TextEditingController();
//   String _country = 'Select nationality';
//   TextEditingController _localisation = TextEditingController();
//   DateTime _dateTeamup = DateTime(
//     DateTime.now().year,
//     DateTime.now().month,
//     DateTime.now().day,
//   );
//   DrivingSchoolController drivingSchoolController = DrivingSchoolController();

//   String _dobString = 'Select Nationality';
//   final _genderList = ['Male', 'Female'];
//   String _gender = 'Male';

//   File? image;
//   GoogleMapController? _googleMapController;

//   // Gender Dropdown Menu
//   DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
//         value: item,
//         child: Text(
//           item,
//           style: TextStyle(),
//         ),
//       );

//   // dob
//   Future<void> _selectDate(BuildContext context) async {
//     final DateTime? picked = await showDatePicker(
//         context: context,
//         initialDate: _dob,
//         firstDate: DateTime(1960),
//         lastDate: DateTime(
//           DateTime.now().year,
//           DateTime.now().month,
//           DateTime.now().day,
//         ));
//     if (picked != null && picked != _dob) {
//       setState(() {
//         _dob = picked;
//       });
//     }
//   }

//   // dateTeamup
//   Future<void> _selectDate1(BuildContext context) async {
//     final DateTime? picked = await showDatePicker(
//         context: context,
//         initialDate: _dateTeamup,
//         firstDate: DateTime(1960),
//         lastDate: DateTime(
//           DateTime.now().year,
//           DateTime.now().month,
//           DateTime.now().day,
//         ));
//     if (picked != null && picked != _dateTeamup) {
//       setState(() {
//         this._dateTeamup = picked;
//       });
//     }
//   }

//   // Location
//   // Future<Position> _getCurrentLocation() async{
//   //   bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
//   //   if (!serviceEnabled){
//   //     return Future.error('Location service disabled');
//   //   }

//   //   LocationPermission permission = await Geolocator.checkPermission();
//   // }

//   Future PickImage() async {
//     try {
//       final image = await ImagePicker().pickImage(source: ImageSource.gallery);
//       // final image = await ImagePicker
//       if (image == null) return;

//       final imageTemporary = File(image.path);
//       this.image = imageTemporary;
//     } on PlatformException catch (e) {
//       print('ERROR: ${e.message}');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       drawer: Drawer(
//         child: NavBar(),
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(bottomRight: Radius.circular(50), )),
//       ),
//         appBar: AppBar(
//         title: Padding(
//             padding: const EdgeInsets.only(left: 20),
//             child: Text(
//                     'DESTIN@CTION',
//                     style: TextStyle(
//                       fontSize: 40,
//                         color: Colors.black,
//                       fontFamily: 'Genos',
//                     ),
//                   ),
//           )
//       ),
//         body: SingleChildScrollView(
//           child: Stack(
//             children: <Widget>[
//               // Data
//               Padding(
//                 padding: EdgeInsets.only(left: 35, right: 35, top: 60),
//                 child: Column(children: [
//                   Container(
//                       width: MediaQuery.of(context).size.width,
//                       padding: EdgeInsets.only(left: 25, right: 25, top: 50),
//                       decoration: BoxDecoration(
//                         color: appColor,
//                         borderRadius: BorderRadius.all(Radius.circular(21)),
//                       ),
//                       child: Column(
//                         children: [
//                           Container(
//                             padding: EdgeInsets.only(top: 29),
//                             height: 100,
//                             width: 250,
//                             decoration: BoxDecoration(
//                                 borderRadius:
//                                     BorderRadius.all(Radius.circular(20)),
//                                 border: Border.all(width: 2),
//                                 image: DecorationImage(
//                                   image: AssetImage('images/driving_school.png'),
//                                   fit: BoxFit.fitWidth,
//                                 )),
//                           ),
//                           // fields
//                           Container(
//                               padding:
//                                   EdgeInsets.only(top: 30, left: 10, right: 10),
//                               child: Form(
//                                 key: _submit,
//                                 child: Column(
//                                   children: [
//                                     // firstname text
//                                     Container(
//                                       padding:
//                                           EdgeInsets.only(left: 5, bottom: 5),
//                                       alignment: Alignment.topLeft,
//                                       child: Text(
//                                         'Firstname',
//                                         textAlign: TextAlign.start,
//                                         style: TextStyle(
//                                             fontFamily: 'IBMPlexMono',
//                                             fontSize: 18,
//                                             color: Colors.white),
//                                       ),
//                                     ),
//                                     // firstname field
//                                     Container(
//                                       height: 40,
//                                       decoration: BoxDecoration(
//                                         borderRadius: BorderRadius.all(
//                                             Radius.circular(10)),
//                                         color: Colors.white,
//                                       ),
//                                       child: TextFormField(
//                                         controller: _firstname,
//                                         decoration: InputDecoration(
//                                             contentPadding:
//                                                 EdgeInsets.only(left: 10),
//                                             hintText: 'DESTI',
//                                             enabledBorder: OutlineInputBorder(
//                                               borderSide: BorderSide(),
//                                               borderRadius: BorderRadius.all(
//                                                   Radius.circular(10)),
//                                             )),
//                                         validator: (value) {
//                                           if (value == null || value.isEmpty) {
//                                             return 'Required field Empty';
//                                           }
//                                           return null;
//                                         },
//                                       ),
//                                     ),
//                                     // lastname text
//                                     Container(
//                                       padding: EdgeInsets.only(
//                                           top: 10, left: 5, bottom: 5),
//                                       alignment: Alignment.topLeft,
//                                       child: Text(
//                                         'Lastname',
//                                         textAlign: TextAlign.start,
//                                         style: TextStyle(
//                                             fontFamily: 'IBMPlexMono',
//                                             fontSize: 18,
//                                             color: Colors.white),
//                                       ),
//                                     ),
//                                     // lastname field
//                                     Container(
//                                       height: 40,
//                                       decoration: BoxDecoration(
//                                         borderRadius: BorderRadius.all(
//                                             Radius.circular(10)),
//                                         color: Colors.white,
//                                       ),
//                                       child: TextFormField(
//                                         controller: _lastname,
//                                         decoration: InputDecoration(
//                                             contentPadding:
//                                                 EdgeInsets.only(left: 10),
//                                             hintText: 'Action',
//                                             enabledBorder: OutlineInputBorder(
//                                               borderSide: BorderSide(),
//                                               borderRadius: BorderRadius.all(
//                                                   Radius.circular(10)),
//                                             )),
//                                         validator: (value) {
//                                           if (value == null || value.isEmpty) {
//                                             return 'Required field Empty';
//                                           }
//                                           return null;
//                                         },
//                                       ),
//                                     ),
//                                     // date of birth & gender
//                                     Container(
//                                       padding: EdgeInsets.only(
//                                           top: 10, left: 5, bottom: 15),
//                                       alignment: Alignment.topLeft,
//                                       child: Row(
//                                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                         children: [
//                                           //dob
//                                           Column(
//                                             crossAxisAlignment: CrossAxisAlignment.start,
//                                             children: [
//                                               Text(
//                                                 'Date Of Birth',
//                                                 textAlign: TextAlign.start,
//                                                 style: TextStyle(
//                                                     fontFamily: 'IBMPlexMono',
//                                                     fontSize: 17,
//                                                     color: Colors.white),
//                                               ),
//                                               Container(
//                                                 width: MediaQuery.of(context).size.width /3,
//                                                 child: ElevatedButton(
//                                                   onPressed: () => {
//                                                     _selectDate(context),
//                                                   },
//                                                   child: Padding(
//                                                     padding: EdgeInsets.all(10),
//                                                     child: Text(
//                                                       _dob.day.toString() +
//                                                           '/' +
//                                                           _dob.month
//                                                               .toString() +
//                                                           '/' +
//                                                           _dob.year.toString(),
//                                                       style: TextStyle(
//                                                         fontSize: 15,
//                                                         color: Color.fromARGB(
//                                                             255, 12, 12, 12),
//                                                         // decoration: TextDecoration()
//                                                       ),
//                                                     ),
//                                                   ),
//                                                   style: ButtonStyle(
//                                                     // minimumSize: Size.fromWidth(4),
//                                                     shape: MaterialStateProperty.all<
//                                                             RoundedRectangleBorder>(
//                                                         RoundedRectangleBorder(
//                                                             borderRadius:
//                                                                 BorderRadius
//                                                                     .circular(
//                                                                         10),
//                                                             side: BorderSide(
//                                                                 color: Colors
//                                                                     .black))),
//                                                   ),
//                                                 ),
//                                               ),
//                                             ],
//                                           ),
//                                           // gender
//                                           // Padding(
//                                           //   padding: EdgeInsets.only(left: MediaQuery.of(context).size.width /11),
//                                              Column(
//                                               mainAxisAlignment: MainAxisAlignment.end,
//                                               children: [
//                                                 // text
//                                                 Container(
//                                                   width: MediaQuery.of(context).size.width / 5,
//                                                   padding: EdgeInsets.only(bottom: 5),
//                                                   child: Text(
//                                                     'Gender',
//                                                     textAlign: TextAlign.start,
//                                                     style: TextStyle(
//                                                         fontFamily:
//                                                             'IBMPlexMono',
//                                                         fontSize: 18,
//                                                         color: Colors.white),
//                                                   ),
//                                                 ),
//                                                 Container(
//                                                     height: 35,
//                                                     width:
//                                                         MediaQuery.of(context).size.width /5,
//                                                     decoration: BoxDecoration(
//                                                       borderRadius:
//                                                           BorderRadius.all(
//                                                               Radius.circular(
//                                                                   10)),
//                                                       border: Border.all(
//                                                           color: Colors.black,
//                                                           width: 1.5),
//                                                     ),
//                                                     child: DropdownButton<String>(
//                                                         alignment:Alignment.center,
//                                                         value: _gender,
//                                                         onChanged: (dynamic
//                                                                 newValue) =>
//                                                             setState(() =>
//                                                                 this._gender =
//                                                                     newValue),
//                                                         items: _genderList.map(buildMenuItem).toList())),
//                                                 Container(
//                                                   height: 5,
//                                                 )
//                                               ],
//                                             ),
                                          
//                                         ],
//                                       ),
//                                     ),
//                                     // email field
//                                     Container(
//                                       height: 40,
//                                       decoration: BoxDecoration(
//                                         borderRadius: BorderRadius.all(
//                                             Radius.circular(10)),
//                                         color: Colors.white,
//                                       ),
//                                       child: TextFormField(
//                                         controller: _email,
//                                         decoration: InputDecoration(
//                                             contentPadding: EdgeInsets.only(
//                                                 left: 10, bottom: 15),
//                                             hintText: 'Email',
//                                             enabledBorder: OutlineInputBorder(
//                                               borderSide: BorderSide(),
//                                               borderRadius: BorderRadius.all(
//                                                   Radius.circular(10)),
//                                             )),
//                                         validator: (value) {
//                                           if (value == null || value.isEmpty) {
//                                             return 'Required field Empty';
//                                           } else
//                                             return null;
//                                         },
//                                       ),
//                                     ),
//                                     Container(
//                                       height: 15,
//                                     ),
//                                     // Phone No field
//                                     Container(
//                                       height: 45,
//                                       child: IntlPhoneField(
//                                         decoration: const InputDecoration(
//                                           contentPadding:
//                                               const EdgeInsets.only(left: 10),
//                                           counter: Offstage(),
//                                           labelText: 'Mobile Number',
//                                           border: OutlineInputBorder(
//                                             borderSide: BorderSide(),
//                                             borderRadius: BorderRadius.all(
//                                                 Radius.circular(10)),
//                                           ),
//                                         ),
//                                         initialCountryCode: 'CM',
//                                         showDropdownIcon: true,
//                                         dropdownIconPosition:
//                                             IconPosition.trailing,
//                                         onChanged: (phone) {
//                                           print(_genderList);
//                                           print(phone.completeNumber);
//                                           _phone = phone;
//                                         },
//                                       ),
//                                     ),
//                                     // Nationality
//                                     SizedBox(
//                                       // width: MediaQuery.of(context).size.width /1.52,
//                                       child: Container(
//                                           decoration: BoxDecoration(
//                                             borderRadius: BorderRadius.all(
//                                                 Radius.circular(10)),
//                                             color: appColor,
//                                           ),
//                                           child: CSCPicker(
//                                             onCountryChanged: ((value) =>
//                                                 setState(() {
//                                                   _country = value;
//                                                 })),
//                                             countryDropdownLabel: _country,
//                                             showCities: false,
//                                             showStates: false,
//                                           )),
//                                     ),
//                                     Container(height: 2),
//                                     // CNI
//                                     Container(
//                                       height: 40,
//                                       decoration: BoxDecoration(
//                                         borderRadius: BorderRadius.all(
//                                             Radius.circular(10)),
//                                         color: Colors.white,
//                                       ),
//                                       child: TextFormField(
//                                         controller: _cni,
//                                         decoration: InputDecoration(
//                                             contentPadding: EdgeInsets.only(
//                                                 left: 10, bottom: 15),
//                                             hintText: 'CNI No',
//                                             enabledBorder: OutlineInputBorder(
//                                               borderSide: BorderSide(),
//                                               borderRadius: BorderRadius.all(
//                                                   Radius.circular(10)),
//                                             )),
//                                         validator: (value) {
//                                           if (value == null || value.isEmpty) {
//                                             return 'Required field Empty';
//                                           } else
//                                             return null;
//                                         },
//                                       ),
//                                     ),
//                                     Container(height: 15),
//                                     // Localisation
//                                     Container(
//                                       height: 40,
//                                       decoration: BoxDecoration(
//                                         borderRadius: BorderRadius.all(
//                                             Radius.circular(10)),
//                                         color: Colors.white,
//                                       ),
//                                       child: TextFormField(
//                                         controller: _localisation,
//                                         decoration: InputDecoration(
//                                             contentPadding: EdgeInsets.only(
//                                                 left: 10, bottom: 15),
//                                             hintText: 'Localization',
//                                             enabledBorder: OutlineInputBorder(
//                                               borderSide: BorderSide(),
//                                               borderRadius: BorderRadius.all(
//                                                   Radius.circular(10)),
//                                             )),
//                                         validator: (value) {
//                                           if (value == null || value.isEmpty) {
//                                             return 'Required field Empty';
//                                           } else
//                                             return null;
//                                         },
//                                       ),
//                                     ),
//                                     // Driving Lisence
//                                     Container(
//                                       height: 15,
//                                     ),
//                                     // Release date
//                                     Row(
//                                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                       children: [
//                                         // Release date
//                                         Column(
//                                           crossAxisAlignment: CrossAxisAlignment.start,
//                                           children: [
//                                             Text(
//                                               'Release Date',
//                                               textAlign: TextAlign.start,
//                                               style: TextStyle(
//                                                   fontFamily: 'IBMPlexMono',
//                                                   fontSize: 17,
//                                                   color: Colors.white),
//                                             ),
//                                             Container(
//                                               width: MediaQuery.of(context).size.width /3.5,
//                                               child: ElevatedButton(
//                                                 onPressed: () => {
//                                                   _selectDate1(context),
//                                                 },
//                                                 child: Padding(
//                                                   padding: EdgeInsets.all(5),
//                                                   child: Text(
//                                                     _dateTeamup.day.toString() +
//                                                         '/' +
//                                                         _dateTeamup.month
//                                                             .toString() +
//                                                         '/' +
//                                                         _dateTeamup.year
//                                                             .toString(),
//                                                     style: TextStyle(
//                                                       fontSize: 15,
//                                                       color: Color.fromARGB(
//                                                           255, 12, 12, 12),
//                                                       // decoration: TextDecoration()
//                                                     ),
//                                                   ),
//                                                 ),
//                                                 style: ButtonStyle(
//                                                   // minimumSize: Size.fromWidth(4),
//                                                   shape: MaterialStateProperty
//                                                       .all<RoundedRectangleBorder>(
//                                                           RoundedRectangleBorder(
//                                                               borderRadius:
//                                                                   BorderRadius
//                                                                       .circular(
//                                                                           10),
//                                                               side: BorderSide(
//                                                                   color: Colors
//                                                                       .black))),
//                                                 ),
//                                               ),
//                                             ),
//                                           ],
//                                         ),
//                                         // pic
//                                         Column(
//                                           crossAxisAlignment:
//                                               CrossAxisAlignment.start,
//                                           children: [
//                                             Text(
//                                               'Driver pic',
//                                               textAlign: TextAlign.start,
//                                               style: TextStyle(
//                                                   fontFamily: 'IBMPlexMono',
//                                                   fontSize: 17,
//                                                   color: Colors.white),
//                                             ),
//                                             Container(
//                                               width: MediaQuery.of(context).size.width /3.8,
//                                               child: ElevatedButton(
//                                                 onPressed: () => {
//                                                   PickImage(),
//                                                 },
//                                                 child: Padding(
//                                                   padding: EdgeInsets.all(10),
//                                                   child: Text(
//                                                     'Select',
//                                                     textAlign: TextAlign.start,
//                                                     style: TextStyle(
//                                                         fontFamily: 'IBMPlexMono'),
//                                                   ),
//                                                 ),
//                                                 style: ButtonStyle(
//                                                   // minimumSize: Size.fromWidth(4),
//                                                   shape: MaterialStateProperty.all<RoundedRectangleBorder>(
//                                                           RoundedRectangleBorder(
//                                                               borderRadius: BorderRadius.circular(10),
//                                                               side: BorderSide(color: Colors.black))),
//                                                 ),
//                                               ),
//                                             ),
//                                           ],
//                                         ),
//                                       ],
//                                     ),

//                                     // submit button
//                                     Container(
//                                       width: 150,
//                                       padding: EdgeInsets.only(top: 20),
//                                       child: ElevatedButton(
//                                         onPressed: () async {
//                                           // userController.getAdress();
//                                           if (_submit.currentState!
//                                               .validate()) {
//                                             Map<String, dynamic> data = {
//                                               'firstname': _firstname.text,
//                                               'lastname': _lastname.text,
//                                               'dob': _dob.toString(),
//                                               'gender': _gender,
//                                               'email': _email.text,
//                                               'phone': _phone!.completeNumber,
//                                               'nationality': _country,
//                                               'cni': _cni.text,
//                                               'localisation':
//                                                   _localisation.text,
//                                               'dateTeamUp':
//                                                   _dateTeamup.toString(),
//                                               'image': image.toString()
//                                             };
//                                             print(data);

//                                             var response =
//                                                 await drivingSchoolController.post(
//                                                     '/user/drivingschool/drivers/add',
//                                                     data);
//                                             var status = response[2] +
//                                                 response[3] +
//                                                 response[4] +
//                                                 response[5] +
//                                                 response[6] +
//                                                 response[7];
//                                             var val = "";
//                                             for (int i = 0; i < 12; i++) {
//                                               val = '$val${response[i]}';
//                                             }
//                                             if(usr['username'] == '' || usr['username'] == null){
//                                             // if (val == "Unauthorized"){
//                                               ScaffoldMessenger.of(context)
//                                                   .showSnackBar(const SnackBar(
//                                                       content: Text(
//                                                           'ERROR: You are not login!!!')));
//                                               Navigator.of(context).push(PageTransition(
//                                                 child: Signin(),
//                                                 type: PageTransitionType.rotate,
//                                                 alignment: Alignment.centerLeft,
//                                                 duration: Duration(seconds: 1)
//                                               ));
//                                             }
//                                             else
//                                             if (status == "status") {
//                                               var error = "";
//                                               for (int i = 29;
//                                                   i < response.length - 2;
//                                                   i++) {
//                                                 error = '$error${response[i]}';
//                                               }
//                                               print('ERROR: $error!!');
//                                               ScaffoldMessenger.of(context)
//                                                   .showSnackBar(SnackBar(
//                                                       content: Text(
//                                                           'ERROR: $error!!')));
//                                             } else {
//                                               ScaffoldMessenger.of(context)
//                                                   .showSnackBar(const SnackBar(
//                                                       content: Text(
//                                                           'Driver registered Successful')));
//                                             }
//                                           }
//                                         },
//                                         child: Text('Submit',
//                                             style: TextStyle(
//                                                 fontSize: 25,
//                                                 fontFamily: 'IBMPlexMono')),
//                                         style: ButtonStyle(
//                                             shape: MaterialStateProperty.all<
//                                                 RoundedRectangleBorder>(
//                                           RoundedRectangleBorder(
//                                             borderRadius:
//                                                 BorderRadius.circular(16),
//                                             side:
//                                                 BorderSide(color: Colors.white),
//                                           ),
//                                         )),
//                                       ),
//                                     ),

//                                     Container(
//                                       padding: EdgeInsets.only(top: 20),
//                                       child: TextButton(
//                                           style: ButtonStyle(),
//                                           onPressed: () {},
//                                           child: Text(
//                                             textAlign: TextAlign.left,
//                                             'Checkout other Drivers',
//                                             style: TextStyle(
//                                                 color: Color.fromRGBO(
//                                                     5, 0, 254, 1),
//                                                 fontSize: 17,
//                                                 fontStyle: FontStyle.italic),
//                                           )),
//                                     ),
//                                   ],
//                                 ),
//                               ))
//                         ],
//                       )),
//                   Container(
//                     height: 35,
//                   )
//                 ]),
//               ),
//             ],
//           ),
//         ));
//   }
// }