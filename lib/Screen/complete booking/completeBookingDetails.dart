import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../Api services/api_services/apiBasehelper.dart';
import '../../Api services/api_services/apiStrings.dart';
import '../../Helper/Colors.dart';
import '../../Model/completebookingModel.dart';
import '../../Widget/customeTost.dart';
import '../auth/custumScreen.dart';

class BookingggDetails extends StatefulWidget {
  CompleateDeliverList?compleateDeliver;
  BookingggDetails({Key? key,this.compleateDeliver}) : super(key: key);

  @override
  State<BookingggDetails> createState() => _BookingggDetailsState();
}

class _BookingggDetailsState extends State<BookingggDetails> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: Stack(children: [



        customdwithoutBackScr(context, "Bookings Details"),

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
              child:

              Padding(
                padding: const EdgeInsets.all(15),
                child:

                Column(
                    mainAxisAlignment:
                    MainAxisAlignment
                        .spaceEvenly,
                    children: [
                      SizedBox(height: 20,),

                      Row(
                        children: [

                          Container(height: 90,
                            width: 80,
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),

                                image: DecorationImage(image: NetworkImage('${widget.compleateDeliver?.userImage??""}'),fit: BoxFit.fill)
                            ),
                          ),

                          Spacer(),

                          Column(children: [

                            InkWell(
                              onTap: () {

                                _launchPhoneApp(widget.compleateDeliver?.mobile??"");
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

                                _launchEmailApp("${widget.compleateDeliver?.email??""}");

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
                      SizedBox(height: 20,),
                      Row(
                        children: [


                          const Text(
                            'Booking Id - ',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight:
                                FontWeight
                                    .w500),
                          ),
                          const Spacer(),
                          Text(
                            '${widget.compleateDeliver?.bookingId??""}',
                            style: const TextStyle(
                                fontSize: 15,
                                fontWeight:
                                FontWeight
                                    .w500),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          const Text(
                            'Owner Name - ',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight:
                                FontWeight
                                    .w500),
                          ),
                          const Spacer(),
                          Text(
                            '${widget.compleateDeliver?.username??""}',
                            style: const TextStyle(
                                fontSize: 15,
                                fontWeight:
                                FontWeight
                                    .w500),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          const Text(
                            'Mobile - ',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight:
                                FontWeight
                                    .w500),
                          ),
                          const Spacer(),
                          Text(
                            '${widget.compleateDeliver?.mobile??""}',
                            style: const TextStyle(
                                fontSize: 15,
                                fontWeight:
                                FontWeight
                                    .w500),
                          ),
                        ],
                      ),

                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          const Text(
                            'Email - ',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight:
                                FontWeight
                                    .w500),
                          ),
                          const Spacer(),
                          Text(
                            '${widget.compleateDeliver?.email??""}',
                            style: const TextStyle(
                                fontSize: 15,
                                fontWeight:
                                FontWeight
                                    .w500),
                          ),
                        ],
                      ),

                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          const Text(
                            'Pickup Location - ',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight:
                                FontWeight
                                    .w500),
                          ),
                          const Spacer(),
                          SizedBox(
                            width: MediaQuery.of(context).size.width/2.5,
                            child: Text(
                              '${widget.compleateDeliver?.pickupAddress??""}',
                              style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight:
                                  FontWeight
                                      .w500),overflow: TextOverflow.ellipsis,maxLines: 3,
                            ),
                          ),
                        ],
                      ),


                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          const Text(
                            'Dop Location - ',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight:
                                FontWeight
                                    .w500),
                          ),
                          const Spacer(),
                          SizedBox(
                            width: MediaQuery.of(context).size.width/2.5,
                            child: Text(
                              '${widget.compleateDeliver?.dropAddress??""}',
                              style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight:
                                  FontWeight
                                      .w500),overflow: TextOverflow.ellipsis,maxLines: 3,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          const Text(
                            'In City/Out City - ',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight:
                                FontWeight
                                    .w500),
                          ),
                          const Spacer(),
                          Text(
                            '${widget.compleateDeliver?.inOutCity??""}',
                            style: const TextStyle(
                                fontSize: 15,
                                fontWeight:
                                FontWeight
                                    .w500),
                          ),
                        ],
                      ),

                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          const Text(
                            'One Way/Two Way - ',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight:
                                FontWeight
                                    .w500),
                          ),
                          const Spacer(),
                          Text(
                            '${widget.compleateDeliver?.oneTowWay??""}',
                            style: const TextStyle(
                                fontSize: 15,
                                fontWeight:
                                FontWeight
                                    .w500),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          const Text(
                            'Booking Date - ',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight:
                                FontWeight
                                    .w500),
                          ),
                          const Spacer(),
                          Text(
                            '${widget.compleateDeliver?.pickupDate??""}',
                            style: const TextStyle(
                                fontSize: 15,
                                fontWeight:
                                FontWeight
                                    .w500),
                          ),
                        ],
                      ),

                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          const Text(
                            'Booking Time - ',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight:
                                FontWeight
                                    .w500),
                          ),
                          const Spacer(),
                          Text(
                            '${widget.compleateDeliver?.pickupTime??""}',
                            style: const TextStyle(
                                fontSize: 15,
                                fontWeight:
                                FontWeight
                                    .w500),
                          ),
                        ],
                      ),

                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          const Text(
                            'Total Amount - ',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight:
                                FontWeight
                                    .w500),
                          ),
                          const Spacer(),
                          Text(
                            'RS ${widget.compleateDeliver?.amount??""}/-',
                            style: const TextStyle(
                                fontSize: 15,
                                fontWeight:
                                FontWeight
                                    .w500),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          const Text(
                            'Payment Type - ',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight:
                                FontWeight
                                    .w500),
                          ),
                          const Spacer(),
                          Text(
                            '${widget.compleateDeliver?.transaction??""}',
                            style: const TextStyle(
                                fontSize: 15,
                                fontWeight:
                                FontWeight
                                    .w500),
                          ),
                        ],
                      ),
                    ]),
              )
          ),
        ),
      ]),


    ));
  }
  final formKey = GlobalKey<FormState>();
  TextEditingController dattimecontroller = TextEditingController();
  TextEditingController otpcontroller = TextEditingController();

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


                                  Text("Complete Booking"),
                                  onPressed: () {
                                    if (formKey.currentState!
                                        .validate()) {

                                      if(iscompleteBooking==true){

                                        complete(bookingId);
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

  bool isLoading=false;
  Future<void> complete(String bookingId) async {
    setState(() {
      isLoading=true;
    });

    var userId;

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    userId = prefs.getString('userId');
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
        Navigator.pop(context);
        setState(() {
          isLoading=false;
        });

        setState(() {

        });
      }else{
        Navigator.pop(context);

      }
    });
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

}
