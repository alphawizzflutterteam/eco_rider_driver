import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Api services/api_services/apiBasehelper.dart';
import '../../Api services/api_services/apiStrings.dart';
import '../../Helper/Colors.dart';
import '../../Helper/loadingwidget.dart';
import '../../Model/bookingModel.dart';
import '../../Widget/customeTost.dart';
import '../auth/custumScreen.dart';
import 'package:intl/intl.dart';


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
          getdeliveries();
        },
        child: ListView.builder(
          itemCount: 1,
          itemBuilder: (context, index) {
            return


              !isLoading ?


              Stack(
                children: [

                  customdwithoutBackScr(context, "Booking"),

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


                                InkWell(
                                  onTap: () {


                                  },
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    child: Container(
                                      height: 300,
                                      child:


                                      Padding(
                                        padding: const EdgeInsets.all(15),
                                        child: Column(
                                            mainAxisAlignment: MainAxisAlignment
                                                .spaceEvenly,
                                            children: [


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
                                                  Text('Pickup - ',
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        fontWeight: FontWeight
                                                            .w500),),
                                                  Spacer(),

                                                  Text(
                                                    '${todayDeliverList[index]
                                                        .cityName}',
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        fontWeight: FontWeight
                                                            .w500),),

                                                ],
                                              ), SizedBox(height: 5,),

                                              Row(
                                                children: [
                                                  Text('Booking Type - ',
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        fontWeight: FontWeight
                                                            .w500),),
                                                  Spacer(),

                                                  Text(
                                                    '${todayDeliverList[index]
                                                        .area}',
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        fontWeight: FontWeight
                                                            .w500),),
                                                ],
                                              ),

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
                                              InkWell(
                                                onTap: () {

                                                },
                                                child:


                                                Row(
                                                  children: [
                                                    Text('Booking Status - ',
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          fontWeight: FontWeight
                                                              .w500),),
                                                    Spacer(),

                                                    Text(
                                                      'Accepted',
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          fontWeight: FontWeight
                                                              .w500),),
                                                  ],
                                                ),
                                              ) :

                                              Row(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .spaceBetween,
                                                children: [


                                                  InkWell(
                                                    onTap: () {

                                                      _showMyDialog(
                                                          todayDeliverList[index]
                                                              .bookingId ?? "",false
                                                      );



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
                                                  _showMyDialog(
                                                      todayDeliverList[index]
                                                          .bookingId ?? "",true
                                                  );
                                                },
                                                child: Container(height: 40,
                                                  decoration: BoxDecoration(
                                                      borderRadius: BorderRadius
                                                          .circular(8),

                                                      color: Colors.green),
                                                  width: MediaQuery
                                                      .of(context)
                                                      .size
                                                      .width,
                                                  child: Center(
                                                    child: Text('Press here For Complete This Order'),),
                                                ),
                                              ):SizedBox.shrink(),

                                            ]),
                                      )
                                      ,),

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


    getdeliveries();
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
                                  child: const Text("Accept Booking"),
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
      'reporting_time': dattimecontroller.text.toString(),
    };
    apiBaseHelper.postAPICall(getBookingAcceptUrl, param).then((getData) {
      bool error = getData['status'];
      String msg = getData['message'];

      if (error == true) {
        customSnackbar(context, msg.toString());

        dattimecontroller.clear();
        Navigator.pop(context);
        getdeliveries();
        setState(() {

        });
      }
      else{
        customSnackbar(context, msg.toString());
        Navigator.pop(context);
        setState(() {

        });

      }
    });
  }

  final formKey = GlobalKey<FormState>();
  TextEditingController dattimecontroller = TextEditingController();
  TextEditingController otpcontroller = TextEditingController();

  DateTime selectedDate = DateTime.now();

  Future<void> sselectDate(BuildContext context,) async {
    // final DateTime? picked = await showDatePicker(
    //
    //   context: context,
    //   initialDate: DateTime.now(),
    //   firstDate: DateTime.now(),
    //   lastDate: DateTime(2100),
    // );
    // if (picked != null && picked != selectedDate)
    //   selectedDate = picked;


    dattimecontroller.text =
        DateFormat("yyyy-MM-dd HH:mm:ss").format(DateTime.now());
    print("==================${dattimecontroller.text}");
    setState(() {

    });



  }
}
