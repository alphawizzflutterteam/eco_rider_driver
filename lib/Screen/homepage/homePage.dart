import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../Api services/api_services/apiBasehelper.dart';
import '../../Api services/api_services/apiStrings.dart';
import '../../Helper/Colors.dart';
import '../../Helper/loadingwidget.dart';
import '../../Model/bookingModel.dart';
import '../../Widget/customeTost.dart';
import '../auth/custumScreen.dart';
import 'package:intl/intl.dart';

import '../complete booking/bookingdetails.dart';


class HomeScr extends StatefulWidget {
  const HomeScr({Key? key}) : super(key: key);

  @override
  State<HomeScr> createState() => _HomeScrState();
}

class _HomeScrState extends State<HomeScr> {
  @override
  Widget build(BuildContext context) {
    return


      RefreshIndicator(
        color: AppColors.primary,
        onRefresh: () async {
          getactive();
          getdeliveries();
        },
        child: ListView.builder(
          itemCount: 1,
          itemBuilder: (context, index) {
            return


              !isLoading ?


              Stack(
                children: [

                  customdwithoutBackScr11(context, "Booking",getActive??true),

                  Container(
                    margin:
                    EdgeInsets.only(top: MediaQuery
                        .of(context)
                        .size
                        .height * 0.15),

                    height: MediaQuery
                        .of(context)
                        .size
                        .height,
                    width: MediaQuery
                        .of(context)
                        .size
                        .width,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: const BoxDecoration(
                      color: Color(0xffF6F6F6),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),),
                    ),

                    child: SingleChildScrollView(
                      child: Column(children: [


                        const SizedBox(
                          height: 20,
                        ),

                        Row(
                          children: [
                            Text('Bookings', style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.w500),),
                          ],
                        ),

                        const SizedBox(
                          height: 20,
                        ),


                        todayDeliverList.isEmpty ?
                        Container(

                          height: MediaQuery
                              .of(context)
                              .size
                              .height / 2,
                          width: MediaQuery
                              .of(context)
                              .size
                              .width,
                          child: Center(child: Text('Booking Not Found'),),
                        )

                            :

                        Container(
                          height: MediaQuery
                              .of(context)
                              .size
                              .height / 1.5,
                          child: ListView.builder(
                            shrinkWrap: true,
                            physics: AlwaysScrollableScrollPhysics(),
                            itemCount: todayDeliverList.length ?? 0,
                            itemBuilder: (context, index) {
                              return


                                Padding(
                                  padding: const EdgeInsets.only(bottom: 20),
                                  child: InkWell(
                                    onTap: () {
                                  if(todayDeliverList[index]
                                      .deleteStatus!="0") {

                                    Navigator.push(context, MaterialPageRoute(builder: (context) =>
                                        BookingDetails(compleateDeliver: todayDeliverList[index],driverId:userId.toString() ),));
                                  }

                                    },
                                    child: Card(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12.0),
                                      ),
                                      child: Container(
                                        // height: 300,
                                        child:


                                        Padding(
                                          padding: const EdgeInsets.all(15),
                                          child: Column(
                                              mainAxisAlignment: MainAxisAlignment
                                                  .spaceEvenly,
                                              children: [



                                                SizedBox(height: 20,),
                                                Row(
                                                  children: [

                                                    Container(height: 90,
                                                      width: 80,
                                                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),

                                                          image: DecorationImage(image: NetworkImage('${todayDeliverList[index].userImage}'),fit: BoxFit.fill)
                                                      ),
                                                    ),

                                                    Spacer(),

                                                    Column(children: [

                                                      InkWell(
                                                        onTap: () {

                                                          _launchPhoneApp(todayDeliverList[index].mobile);
                                                        },
                                                        child: Container(height: 30,

                                                          width: 30,

                                                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),

                                                              image: DecorationImage(image: AssetImage('assets/images/phone-call.png'),fit: BoxFit.fill)
                                                          ),

                                                        ),
                                                      ),

                                                      SizedBox(height: 10,),
                                                      InkWell(
                                                        onTap: () {

                                                          _launchEmailApp("${todayDeliverList[index].userEmail}");

                                                        },
                                                        child: Container(height: 30,

                                                          width: 30,

                                                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),

                                                              image: DecorationImage(image: AssetImage('assets/images/gmail.png'),fit: BoxFit.fill)
                                                          ),

                                                        ),
                                                      ),


                                                    ],)
                                                  ],


                                                ),
                                                // CircleAvatar(
                                                //   radius: 35,
                                                //   backgroundColor: AppColors.primary,
                                                //   child: CircleAvatar(radius: 32,
                                                //
                                                //
                                                //   backgroundImage:NetworkImage("${todayDeliverList[index]
                                                //       .userImage}") ,
                                                //   ),
                                                //
                                                // ),
                                                //

                                                SizedBox(height: 20,),

                                                Row(
                                                  children: [


                                                    Text('Booking Id - ',
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          fontWeight: FontWeight
                                                              .w500),),
                                                    Spacer(),

                                                    Text(
                                                      '${todayDeliverList[index]
                                                          .bookingId}',
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          fontWeight: FontWeight
                                                              .w500),),
                                                  ],
                                                ), SizedBox(height: 5,),

                                                Row(
                                                  children: [
                                                    Text('Owner Name - ',
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          fontWeight: FontWeight
                                                              .w500),),
                                                    Spacer(),

                                                    Text(
                                                      '${todayDeliverList[index]
                                                          .username}',
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          fontWeight: FontWeight
                                                              .w500),),

                                                  ],
                                                ), SizedBox(height: 5,),

                                                Row(
                                                  children: [
                                                    Text('Pickup Address - ',
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          fontWeight: FontWeight
                                                              .w500),),
                                                    Spacer(),

                                                    SizedBox(
                                                      width: MediaQuery.of(context).size.width/2.5,
                                                      child: Text(
                                                        '${todayDeliverList[index]
                                                            .pickupAddress}',
                                                        style: TextStyle(
                                                            fontSize: 15,
                                                            fontWeight: FontWeight
                                                                .w500),overflow: TextOverflow.ellipsis,maxLines: 3,),
                                                    ),

                                                  ],
                                                ),
                                                SizedBox(height: 5,),

                                                Row(
                                                  children: [
                                                    Text('Drop Address - ',
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          fontWeight: FontWeight
                                                              .w500),),
                                                    Spacer(),

                                                    SizedBox(
                                                      width: MediaQuery.of(context).size.width/2.5,
                                                      child: Text(
                                                        '${todayDeliverList[index]
                                                            .dropAddress}',
                                                        style: TextStyle(
                                                            fontSize: 15,
                                                            fontWeight: FontWeight
                                                                .w500),overflow: TextOverflow.ellipsis,maxLines: 3,),
                                                    ),

                                                  ],
                                                ),



                                                const SizedBox(
                                                  height: 5,
                                                ),


                                                Row(
                                                  children: [
                                                    const Text(
                                                      'Reporting Time - ',
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          fontWeight:
                                                          FontWeight
                                                              .w500),
                                                    ),
                                                    const Spacer(),
                                                    Text(
                                                      '${todayDeliverList[index].reportingTime}',
                                                      style: const TextStyle(
                                                          fontSize: 15,
                                                          fontWeight:
                                                          FontWeight
                                                              .w500),
                                                    ),
                                                  ],
                                                ),

                                                // const SizedBox(
                                                //   height: 5,
                                                // ),
                                                //
                                                //
                                                // Row(
                                                //   children: [
                                                //     const Text(
                                                //       'In City/Out City - ',
                                                //       style: TextStyle(
                                                //           fontSize: 15,
                                                //           fontWeight:
                                                //           FontWeight
                                                //               .w500),
                                                //     ),
                                                //     const Spacer(),
                                                //     Text(
                                                //       '${todayDeliverList[index].inOutCity}',
                                                //       style: const TextStyle(
                                                //           fontSize: 15,
                                                //           fontWeight:
                                                //           FontWeight
                                                //               .w500),
                                                //     ),
                                                //   ],
                                                // ),
                                                //
                                                // const SizedBox(
                                                //   height: 5,
                                                // ),
                                                // Row(
                                                //   children: [
                                                //     const Text(
                                                //       'One Way/Two Way - ',
                                                //       style: TextStyle(
                                                //           fontSize: 15,
                                                //           fontWeight:
                                                //           FontWeight
                                                //               .w500),
                                                //     ),
                                                //     const Spacer(),
                                                //     Text(
                                                //       '${todayDeliverList[index].oneTowWay}',
                                                //       style: const TextStyle(
                                                //           fontSize: 15,
                                                //           fontWeight:
                                                //           FontWeight
                                                //               .w500),
                                                //     ),
                                                //   ],
                                                // ),
                                                // SizedBox(height: 5,),
                                                //
                                                // Row(
                                                //   children: [
                                                //     Text('Booking Date',
                                                //       style: TextStyle(
                                                //           fontSize: 15,
                                                //           fontWeight: FontWeight
                                                //               .w500),),
                                                //     Spacer(),
                                                //
                                                //     Text(
                                                //       '${todayDeliverList[index]
                                                //           .pickupDate}',
                                                //       style: TextStyle(
                                                //           fontSize: 15,
                                                //           fontWeight: FontWeight
                                                //               .w500),),
                                                //   ],
                                                // ),
                                                //
                                                // SizedBox(height: 5,),
                                                //
                                                // Row(
                                                //   children: [
                                                //     Text('Booking Time',
                                                //       style: TextStyle(
                                                //           fontSize: 15,
                                                //           fontWeight: FontWeight
                                                //               .w500),),
                                                //     Spacer(),
                                                //
                                                //     Text(
                                                //       '${todayDeliverList[index]
                                                //           .pickupTime}',
                                                //       style: TextStyle(
                                                //           fontSize: 15,
                                                //           fontWeight: FontWeight
                                                //               .w500),),
                                                //   ],
                                                // ),
                                                SizedBox(height: 5,),


                                                Row(
                                                  children: [
                                                    Text('Total Amount - ',
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          fontWeight: FontWeight
                                                              .w500),),
                                                    Spacer(),

                                                    Text(
                                                      'RS ${todayDeliverList[index]
                                                          .amount}/-',
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          fontWeight: FontWeight
                                                              .w500),),
                                                  ],
                                                ),

                                                SizedBox(height: 5,),

                                                todayDeliverList[index]
                                                    .deleteStatus == "1" ?
                                                // InkWell(
                                                //   onTap: () {
                                                //
                                                //   },
                                                //   child:
                                                //
                                                //
                                                //   Row(
                                                //     children: [
                                                //       Text('Booking Status - ',
                                                //         style: TextStyle(
                                                //             fontSize: 15,
                                                //             fontWeight: FontWeight
                                                //                 .w500),),
                                                //       Spacer(),
                                                //
                                                //       Text(
                                                //         'Accepted',
                                                //         style: TextStyle(
                                                //             fontSize: 15,
                                                //             fontWeight: FontWeight
                                                //                 .w500),),
                                                //     ],
                                                //   ),
                                                // )
                                                  SizedBox.shrink()
                                                    :

                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment
                                                      .spaceBetween,
                                                  children: [


                                                    InkWell(
                                                      onTap: () {

                                                        // _showMyDialog(
                                                        //     todayDeliverList[index]
                                                        //         .bookingId ?? "",false
                                                        // );
                                                        accept(todayDeliverList[index].bookingId??"");


                                                      },
                                                      child: Container(height: 40,

                                                        decoration: BoxDecoration(
                                                            borderRadius: BorderRadius
                                                                .circular(8),

                                                            color: Colors.green
                                                        ),
                                                        width: MediaQuery
                                                            .of(context)
                                                            .size
                                                            .width / 2.7,
                                                        child: Center(
                                                          child: Text('Accept'),),
                                                      ),
                                                    ),
                                                    SizedBox(height: 5,),
                                                    InkWell(
                                                      onTap: () {
                                                        reject(
                                                            todayDeliverList[index]
                                                                .bookingId ?? "");
                                                        getdeliveries();
                                                      },
                                                      child: Container(height: 40,
                                                        decoration: BoxDecoration(
                                                            borderRadius: BorderRadius
                                                                .circular(8),

                                                            color: Colors.red),
                                                        width: MediaQuery
                                                            .of(context)
                                                            .size
                                                            .width / 2.7,
                                                        child: Center(
                                                          child: Text('Reject'),),
                                                      ),
                                                    ),

                                                  ],
                                                ),
                                                todayDeliverList[index]
                                                    .deleteStatus == "1" ?
                                                InkWell(
                                                  onTap: () {


                                                  },
                                                  child: Column(
                                                    children: [
                                                      SizedBox(height: 5,),
                                                      Container(height: 40,
                                                        decoration: BoxDecoration(
                                                            borderRadius: BorderRadius
                                                                .circular(8),

                                                            color: Colors.green),
                                                        width: MediaQuery
                                                            .of(context)
                                                            .size
                                                            .width,
                                                        child: Center(
                                                          child: Text('Accepted'),),
                                                      ),
                                                    ],
                                                  ),
                                                ):SizedBox.shrink(),

                                              ]),
                                        )
                                        ,),

                                    ),
                                  ),
                                );
                            },),
                        )
                      ],
                      ),
                    ),
                  ),


                ],

              )
                  :

              Container(

                height: MediaQuery
                    .of(context)
                    .size
                    .height,
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                child: Center(child: LoadingWidget2(context),),
              );
          },),
      );
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _startTimer();
    getactive();
    getdeliveries();

  }

  bool? getActive;
Future<void> getactive() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  getActive= await prefs.getBool('IsActive');
    print("===my technic==getBool=====${getActive}===============");

}

  bool isLoading = false;
  BookingModel?bookingModel;
  List<CompleateDeliver> todayDeliverList = [];
  var userId;

  Future<void> getdeliveries() async {
    setState(() {
      isLoading = true;
    });

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    userId = prefs.getString('userId');
    var param = {

      'user_id': '${userId.toString()}'
      // 'user_id': '15'

    };
    apiBaseHelper.postAPICall(getbookingurl, param).then((getDta) {
      bool error = getDta['status'];
      if (error == true) {
      print("${todayDeliverList.length.toString()}==========get data length");
        setState(() {
          todayDeliverList.clear();
          todayDeliverList = BookingModel
              .fromJson(getDta)
              .data ?? [];
          setState(() {
            isLoading = false;
          });
        });

      print("${todayDeliverList.length.toString()}====22======get data length");

      } else {
        todayDeliverList.clear();
        setState(() {
          isLoading = false;
        });
      }
    });
  }


  Future<void> _showMyDialog(String bookingId,bool iscompleteBooking) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return
          StatefulBuilder(builder: (context, setState) {
            return

              AlertDialog(

                  backgroundColor: Colors.white,
                  actions: [


                    Form(
                      key: formKey,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            SizedBox(height: 10,),

                            SizedBox(
                              height: 10,
                            ),

                            iscompleteBooking==true?
                            TextFormField(
                              onTap: () {



                              },
                             maxLength: 4,
                              controller: otpcontroller,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                prefixIcon: const Icon(
                                  Icons.text_fields,
                                  color: AppColors.tabtextColor,
                                ),
                                counterText: "",
                                hintText: 'Enter OTP',
                                hintStyle: TextStyle(fontSize: 13),
                                contentPadding:
                                const EdgeInsets.symmetric(vertical: 5),
                                focusedErrorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(25),
                                    borderSide: BorderSide(
                                        color: AppColors.whiteTemp, width: 2)),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(25),
                                    borderSide: const BorderSide(
                                        color: AppColors.whiteTemp, width: 2)),
                                errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(25),
                                    borderSide: BorderSide(
                                        color: AppColors.whiteTemp, width: 2)),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                  BorderSide(color: AppColors.whiteTemp),
                                  borderRadius: BorderRadius.circular(25),
                                ),
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please Enter OTP';
                                }
                                return null; // Return null if the input is valid
                              },
                            )
                                :
                            TextFormField(
                              onTap: () {
                                sselectDate(context);
                                // sselectDate(context);

                              },
                              readOnly: true,
                              controller: dattimecontroller,
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                prefixIcon: const Icon(
                                  Icons.calendar_month,
                                  color: AppColors.tabtextColor,
                                ),
                                hintText: 'Select Reporting DateTime',
                                hintStyle: TextStyle(fontSize: 13),
                                contentPadding:
                                const EdgeInsets.symmetric(vertical: 5),
                                focusedErrorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(25),
                                    borderSide: BorderSide(
                                        color: AppColors.whiteTemp, width: 2)),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(25),
                                    borderSide: const BorderSide(
                                        color: AppColors.whiteTemp, width: 2)),
                                errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(25),
                                    borderSide: BorderSide(
                                        color: AppColors.whiteTemp, width: 2)),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                  BorderSide(color: AppColors.whiteTemp),
                                  borderRadius: BorderRadius.circular(25),
                                ),
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please Select Reporting DateTime';
                                }
                                return null; // Return null if the input is valid
                              },
                            ),

                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceEvenly,
                              children: [
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      primary:
                                      AppColors.primary),
                                  child: const Text("Back"),
                                  onPressed: () async {
                                    Navigator.pop(context);
                                  },
                                ),
                                ElevatedButton(

                                  style: ElevatedButton.styleFrom(
                                      primary:
                                      AppColors.primary),
                                  child:


                                  Text( iscompleteBooking==true?"Complete Booking":"Accept Booking"),
                                  onPressed: () {
                                    if (formKey.currentState!
                                        .validate()) {

                                      if(iscompleteBooking==true){

                                        complete(bookingId);
                                      }
                                      else{
                                        accept(bookingId);

                                      }
                                    }
                                  },
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ]
              );
          },);
      },
    );
  }

  void reject(String bookingId) {
    var param = {
      'booking_id': bookingId.toUpperCase(),

    };
    apiBaseHelper.postAPICall(rejectUrl, param).then((getData) {
      bool error = getData['status'];
      String msg = getData['message'];

      if (error == true) {
        customSnackbar(context, msg.toString());
        getdeliveries();
        setState(() {

        });
      }
    });
  }


  void complete(String bookingId) {
    var param = {
      'booking_id': bookingId.toString(),
      'driver_id': userId.toString(),
      'otp': otpcontroller.text.toString(),

    };
    apiBaseHelper.postAPICall(getcompleteBookingUrl, param).then((getData) {
      bool error = getData['status'];
      String msg = getData['message'];

      if (error == true) {
        customSnackbar(context, msg.toString());

        Navigator.pop(context);
        getdeliveries();
        setState(() {

        });
      }else{
        Navigator.pop(context);

      }
    });
  }

  Future<void> accept(String bookingId) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    userId = prefs.getString('userId');

    var param = {
      'booking_id': bookingId.toString(),
      'driver_id': userId.toString(),
      // 'reporting_time': dattimecontroller.text.toString(),
    };
    apiBaseHelper.postAPICall(getBookingAcceptUrl, param).then((getData) {
      bool error = getData['status'];
      String msg = getData['message'];

      if (error == true) {
        customSnackbar(context, msg.toString());

         getdeliveries();
        setState(() {

        });
      }
      else{

        setState(() {

        });

      }
    });
  }

  final formKey = GlobalKey<FormState>();
  TextEditingController dattimecontroller = TextEditingController();
  TextEditingController otpcontroller = TextEditingController();


  var selectdateee;
  var selectTimeee;
  var datetimeselect;

  Future<void> selectTimeEE(BuildContext context,) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      builder: (BuildContext? context, Widget? child) {
        return MediaQuery(
          data: MediaQuery.of(context!).copyWith(alwaysUse24HourFormat: false),
          child: child!,
        );
      },
    );

    if (picked != null) {

      selectTimeee = formatTime(picked);
      print("===my technic=======${selectTimeee}===============");

      setState(() {
        dattimecontroller.text="${selectdateee}/${selectTimeee}";
      });


    }
  }

  String formatTime(TimeOfDay time) {
    int hour = time.hourOfPeriod ?? 0;
    int minute = time.minute ?? 0;
    String period = time.period == DayPeriod.am ? 'AM' : 'PM';

    return '$hour:${minute.toString().padLeft(2, '0')} $period';
  }

  DateTime selectedDate = DateTime.now();
  Future<void> sselectDate(BuildContext context,) async {

    final DateTime? picked = await showDatePicker(

      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != selectedDate)

      selectedDate = picked;
    selectdateee =
          DateFormat('yyyy-MM-dd').format(selectedDate);
      print("==================${selectdateee}");
      setState(() {

      });
// Navigator.pop(context);
    selectTimeEE(context);
  }

  _launchPhoneApp(var num) async {
    final url = 'tel:$num';
    if (await launch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _launchEmailApp(var mailId) async {
    final Uri uri = Uri(
      scheme: 'mailto',
      path: mailId,

    );

    final String url = uri.toString();

    if (await launch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
  // @override
  // void dispose() {
  //   // TODO: implement dispose
  //   super.dispose();
  //   getdeliveries();
  // }

  CollectionReference humanCollection =
  FirebaseFirestore.instance.collection("driverlocation");

  Future<void> updateDriverLocation() async {
    print("location store function Start===========");

    humanCollection.doc('$userId').set({
      'lat': currentLocation?.latitude,
      'long': currentLocation?.longitude,
    }, SetOptions(merge: true));

    print("location store success===========");
  }

  var lat;
  var long;

  Position? currentLocation;

  Future getUserCurrentLocation() async {
    var status = await Permission.location.request();
    if (status.isDenied) {
    } else if (status.isGranted) {
      await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high)
          .then((position) {
        if (mounted)
          setState(() {
            currentLocation = position;
            lat = currentLocation?.latitude;
            long = currentLocation?.longitude;
          });
      });
      updateDriverLocation();
      // addData();
    } else if (status.isPermanentlyDenied) {
      openAppSettings();
    }
  }

  late Timer _timer;

  void _startTimer() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    userId = prefs.getString('userId');
    _timer = Timer.periodic(Duration(seconds: 5), (timer) async {
      await getUserCurrentLocation();
    });
  }

  @override
  void dispose() {
    _timer.cancel();

    super.dispose();
  }

}
