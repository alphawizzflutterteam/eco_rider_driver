import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Api services/api_services/apiBasehelper.dart';
import '../../Api services/api_services/apiStrings.dart';
import '../../Helper/Colors.dart';
import '../../Helper/loadingwidget.dart';
import '../../Widget/custom_app_button.dart';
import '../../Widget/customeTost.dart';
import '../dashboard/dashboardScreen.dart';
import 'changepassword.dart';
import 'custumScreen.dart';

class VerifyOtp extends StatefulWidget {
  bool? isLogin;
  String? otp;
  String? Mobile;
  VerifyOtp({super.key, this.otp, this.Mobile, this.isLogin});
  @override
  State<VerifyOtp> createState() => _VerifyOtpState();
}

class _VerifyOtpState extends State<VerifyOtp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          customAuthDegineforverifie(
            context,
          ),
          Container(
            margin:
            EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.29),
            height: MediaQuery.of(context).size.height * 0.69,
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              color: Color(0xffF6F6F6),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30)),
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Text('Code has sent to',
                      style: TextStyle(
                          fontSize: 17,
                          color: AppColors.blackTemp,
                          fontWeight: FontWeight.w400)),
                  SizedBox(
                    height: 2,
                  ),
                  Text('+${widget.Mobile.toString()}',
                      style: TextStyle(
                          fontSize: 20,
                          color: AppColors.blackTemp,
                          fontWeight: FontWeight.w400)),
                  Text('OTP: ${otpp.toString()}',
                      style: TextStyle(
                          fontSize: 20,
                          color: AppColors.blackTemp,
                          fontWeight: FontWeight.w400)),
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: PinCodeTextField(
                      keyboardType: TextInputType.phone,

                      onChanged: (value) {
                        textotp = value.toString();
                      },

                      pinTheme: PinTheme(
                        shape: PinCodeFieldShape.box,
                        borderRadius: BorderRadius.circular(15),
                        activeColor: AppColors.blackTemp,
                        inactiveColor: AppColors.blackTemp,
                        selectedColor: AppColors.blackTemp,
                        fieldHeight: 70,
                        fieldWidth: 70,
                      ),
                      //pinBoxRadius:20,
                      appContext: context,
                      length: 4,
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Text("Haven't received the verification code?",
                      style: TextStyle(
                          fontSize: 17,
                          color: AppColors.blackTemp,
                          fontWeight: FontWeight.w400)),
                  SizedBox(
                    height: 5,
                  ),

                       InkWell(
                      onTap: () {
                        sendOtp();
                      },
                      child: Text("Resend",
                          style: TextStyle(
                              fontSize: 17,
                              color: AppColors.blackTemp,
                              fontWeight: FontWeight.bold))),

                  SizedBox(
                    height: 70,
                  ),
                  InkWell(
                      onTap: () {
                        print("========${textotp}========${otpp}=");
                        print(
                            "========${textotp.runtimeType}========${otpp.runtimeType}=");

                        if (textotp == null) {
                          customSnackbar(context, "Plase Fill OTP Fields");
                        } else if (otpp != textotp) {
                          customSnackbar(context, "Plase Fill Correct OTP");
                        } else {
                          if(widget.isLogin==true){
                            verifie();

                          }
                          else{


                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ChangePassword(
                                      Mobile: widget.Mobile.toString()),
                                ));


                          }



                        }
                      },
                      child:

                      !isLoading?
                      CustomButton(
                        textt: "Verify",
                      ) : LoadingWidget(context),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getFCM();
    otpp = widget.otp.toString();
    ;
  }

  bool isLoading = false;
  var otpp;
  var textotp;



  void sendOtp() {
    setState(() {
      isLoading = true;
    });
    var param = {
      "user_phone": widget.Mobile.toString(),
    };
    apiBaseHelper.postAPICall(loginurl, param).then((getData) {
      String msg = getData['message'];
      bool error = getData['status'];

      if (error == true) {
        setState(() {
          otpp = getData['data'].toString();
        });
        customSnackbar(context, msg.toString());
        setState(() {
          isLoading = false;
        });
      } else {
        customSnackbar(context, msg.toString());

        setState(() {
          isLoading = false;
        });
      }
    });
  }


  var fcmToken;
  getFCM() async {
    final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
    try {
      fcmToken = await _firebaseMessaging.getToken() ?? "";
    } on FirebaseException {}
  }
  void verifie() {
    setState(() {
      isLoading = true;
    });
    var param = {
      "user_phone": widget.Mobile.toString(),
      'otp':otpp.toString(),
      'firebaseToken':"${fcmToken.toString()}"
    };
    apiBaseHelper.postAPICall(verifieurl, param).then((getData) async {
      String msg = getData['message'];
      bool error = getData['status'];

      if (error == true) {
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('userId', '${getData['data']['id']}');
        customSnackbar(context, msg.toString());

        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Dashboard(),));
        setState(() {
          isLoading = false;
        });
      } else {
        customSnackbar(context, msg.toString());

        setState(() {
          isLoading = false;
        });
      }
    });
  }


}
