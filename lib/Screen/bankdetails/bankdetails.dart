import 'dart:io';

import 'package:eco_rider_driver/Api%20services/api_services/apiBasehelper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../Api services/api_services/apiStrings.dart';
import '../../Helper/Colors.dart';
import '../../Helper/loadingwidget.dart';
import '../../Widget/custom_app_button.dart';
import '../../Widget/customeTost.dart';
import '../auth/custumScreen.dart';
import '../auth/loginScreen.dart';

class BankDetailsScr extends StatefulWidget {
  String ?name;
  String ?email;
  String ?mobile;
  String ?gender;
  String ?experience;
  String ?adharf;
  String ?adharb;
  String ?profileimage;
  String ?licenseimage;
  String ?password;
  String ?alcohal;
  String ?address;
  String ?state;
  String ?city;
  String ?pincode;
  String ?region;
   BankDetailsScr({super.key,this.name,this.email,this.mobile,this.gender,this.experience,this.adharf,this.adharb,this.licenseimage,this.profileimage,this.password,this.alcohal,this.address,this.state,this.city,this.pincode,this.region});

  @override
  State<BankDetailsScr> createState() => _BankDetailsScrState();
}

class _BankDetailsScrState extends State<BankDetailsScr> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Stack(
          children: [
            customAuthDegine(context, "assets/images/sign up.png"),
            Container(
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.36),
              height: MediaQuery.of(context).size.height * 0.69,
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: const BoxDecoration(
                color: Color(0xffF6F6F6),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 13,
                    ),
                    Row(
                      children: [
                        Text(
                          'Sign Up',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 13,
                    ),
                    const Text(
                      "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable.",
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                    SizedBox(
                      height: 13,
                    ),
                    const Row(
                      children: [
                        Text(
                          'Bank Details',
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    TextFormField(
                      controller: banknameC,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(
                          Icons.food_bank_rounded,
                          color: AppColors.tabtextColor,
                        ),
                        hintText: 'Bank Name',
                        hintStyle: TextStyle(fontSize: 13),
                        contentPadding: const EdgeInsets.symmetric(vertical: 5),
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
                          borderSide: BorderSide(color: AppColors.whiteTemp),
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please Enter Bank Name';
                        }

                        return null; // Return null if the input is valid
                      },
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      controller: accountNumberC,
                      maxLength: 25,
                      decoration: InputDecoration(
                        counterText: "",
                        prefixIcon: const Icon(
                          Icons.food_bank_rounded,
                          color: AppColors.tabtextColor,
                        ),
                        hintText: 'Account Number',
                        hintStyle: TextStyle(fontSize: 13),
                        contentPadding: const EdgeInsets.symmetric(vertical: 5),
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
                          borderSide: BorderSide(color: AppColors.whiteTemp),
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please Enter Account Number';
                        }
                        return null; // Return null if the input is valid
                      },
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    TextFormField(
                      maxLength: 18,
                      textCapitalization: TextCapitalization.characters,
                      controller: ifscC,
                      decoration: InputDecoration(
                        counterText: "",
                        prefixIcon: const Icon(
                          Icons.food_bank_rounded,
                          color: AppColors.tabtextColor,
                        ),
                        hintText: 'IFSC Code',
                        hintStyle: TextStyle(fontSize: 13),
                        contentPadding: const EdgeInsets.symmetric(vertical: 5),
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
                          borderSide: BorderSide(color: AppColors.whiteTemp),
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please Enter IFSC Code';
                        }

                        return null; // Return null if the input is valid
                      },
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    TextFormField(
                      maxLength: 18,
                      controller: upiIdC,
                      decoration: InputDecoration(
                        counterText: "",
                        prefixIcon: const Icon(
                          Icons.food_bank_rounded,
                          color: AppColors.tabtextColor,
                        ),
                        hintText: 'UPI Id',
                        hintStyle: TextStyle(fontSize: 13),
                        contentPadding: const EdgeInsets.symmetric(vertical: 5),
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
                          borderSide: BorderSide(color: AppColors.whiteTemp),
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please Enter UPI Id';
                        } else if (!value.contains("@")) {
                          return 'Please Enter Valid UPI ID';
                        }

                        return null; // Return null if the input is valid
                      },
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    InkWell(
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          signUp();
                        }
                      },
                      child: !isLoading
                          ? CustomButton(
                              textt: "Signup",
                            )
                          : LoadingWidget(context),
                    ),

                    SizedBox(
                      height: 100,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }


  void signUp(){
setState(() {
  isLoading=true;
});
var param={

  'user_fullname': widget.name.toString(),
  'user_phone':  widget.mobile.toString(),
  'user_email':  widget.email.toString(),
  'gender':  widget.gender.toString(),
  'driving_exp':  widget.experience.toString(),
  'password': widget.password.toString(),
  'driver_console_alcohal':  widget.alcohal.toString(),
  'current_address':  widget.address.toString(),
  'region':  widget.region.toString(),
  'state':  widget.state.toString(),
  'city':  widget.city.toString(),
  'pin_code':  widget.pincode.toString(),
  'bank_name':  banknameC.text.toString(),
  'account_number':  accountNumberC.toString(),
  'ifsc_code': ifscC.text.toString(),
  'upi_id': upiIdC.text.toString(),
  'longitude': '${long.toString()}',
  'latitude': '${lat.toString()}',

  'driving_licence_photo': ''
};
List<Map<String, dynamic>> imagefile =[
  {
   "key": "user_image",
    "filePath":"${widget.profileimage.toString()}"

  },
  {
    "key": "aadhar_card_f",
    "filePath":"${widget.adharf.toString()}"

  },
  {
    "key": "aadhar_card_b",
    "filePath":"${widget.adharb.toString()}"

  },
  {
    "key": "driving_licence_photo",
    "filePath":"${widget.licenseimage.toString()}"

  },
];
apiBaseHelper.postMultipartAPICall(signupurl, param,imagefile).then((getData){

  bool error=getData['status'];
String?msg=getData['message'];
if(error==true){
  customSnackbar(context, msg.toString());

  setState(() {
    isLoading = false;
  });

  Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => LoginPage()),
          (Route<dynamic> route) => false);

}else{
  customSnackbar(context, msg.toString());

  setState(() {
    isLoading = false;
  });


}


}
);

  }


  bool isLoading = false;
  final _formKey = GlobalKey<FormState>();

  final banknameC = TextEditingController();
  final accountNumberC = TextEditingController();
  final ifscC = TextEditingController();
  final upiIdC = TextEditingController();


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
      print("LOCATION===" +currentLocation.toString());
      //updateDriverLocation();

    } else if (status.isPermanentlyDenied) {


      openAppSettings();
    }



  }
  @override
  void initState() {
    // TODO: implement initState

    getUserCurrentLocation();
  }
}
