import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:place_picker/entities/location_result.dart';
import 'package:place_picker/widgets/place_picker.dart';

import '../../Helper/Colors.dart';
import '../../Helper/loadingwidget.dart';
import '../../Widget/custom_app_button.dart';
import '../../Widget/customeTost.dart';
import '../bankdetails/bankdetails.dart';
import 'custumScreen.dart';


class AddressSignUpScreen extends StatefulWidget {
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

   AddressSignUpScreen({super.key,this.name,this.email,this.mobile,this.gender,this.experience,this.adharf,this.adharb,this.licenseimage,this.profileimage,this.alcohal,this.password});

  @override
  State<AddressSignUpScreen> createState() => _AddressSignUpScreenState();
}

class _AddressSignUpScreenState extends State<AddressSignUpScreen> {





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:

      Form(
        key: _formKey,
        child: Stack(
          children: [






            customAuthDegine(context,"assets/images/sign up.png"),


            Container(
              margin:
              EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.36),
              height: MediaQuery.of(context).size.height * 0.69,
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: const BoxDecoration(
                color: Color(0xffF6F6F6),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30),),
              ),
              child:



              SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 13,),
                    Row(
                      children: [
                        Text('Sign Up',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                      ],
                    ),
                    SizedBox(height: 13,),
                    Text("There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable.",style: TextStyle(fontSize: 12,),),
                    SizedBox(height: 13,),

                    Row(
                      children: [
                        Text('Address Details',style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
                      ],
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    TextFormField(
                      onTap: () {

                        showPlacePicker();

                      },
                      readOnly: true,
                      controller: addresscontroller,
                      decoration: InputDecoration(

                        prefixIcon: const Icon(
                          Icons.location_on,
                          color: AppColors.tabtextColor,
                        ),
                        hintText: 'Current Address',
                        hintStyle: TextStyle(fontSize: 13),
                        contentPadding: const EdgeInsets.symmetric(vertical: 5),
                        focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                            borderSide:
                            BorderSide(color: AppColors.whiteTemp, width: 2)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                            borderSide:
                            const BorderSide(color: AppColors.whiteTemp, width: 2)),
                        errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                            borderSide:
                            BorderSide(color: AppColors.whiteTemp, width: 2)),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: AppColors.whiteTemp),
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please Enter Address';
                        }

                        return null; // Return null if the input is valid
                      },
                    ),

                    const SizedBox(
                      height: 8,
                    ),

                    TextFormField(
readOnly: true,
                      controller: statecontroller,

                      decoration: InputDecoration(

                        prefixIcon: const Icon(
                          Icons.location_on,
                          color: AppColors.tabtextColor,
                        ),
                        hintText: 'State',
                        hintStyle: TextStyle(fontSize: 13),
                        contentPadding: const EdgeInsets.symmetric(vertical: 5),
                        focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                            borderSide:
                            BorderSide(color: AppColors.whiteTemp, width: 2)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                            borderSide:
                            const BorderSide(color: AppColors.whiteTemp, width: 2)),
                        errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                            borderSide:
                            BorderSide(color: AppColors.whiteTemp, width: 2)),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: AppColors.whiteTemp),
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please Enter State';
                        }
                        return null; // Return null if the input is valid
                      },
                    ),

                    const SizedBox(
                      height: 8,
                    ),
                    TextFormField(
                     readOnly: true,
                      textCapitalization: TextCapitalization.characters,
                      controller: citicontroller,
                      decoration: InputDecoration(

                        prefixIcon: const Icon(
                          Icons.location_on,
                          color: AppColors.tabtextColor,
                        ),
                        hintText: 'City',
                        hintStyle: TextStyle(fontSize: 13),
                        contentPadding: const EdgeInsets.symmetric(vertical: 5),
                        focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                            borderSide:
                            BorderSide(color: AppColors.whiteTemp, width: 2)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                            borderSide:
                            const BorderSide(color: AppColors.whiteTemp, width: 2)),
                        errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                            borderSide:
                            BorderSide(color: AppColors.whiteTemp, width: 2)),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: AppColors.whiteTemp),
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),

                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please Enter City';
                        }

                        return null; // Return null if the input is valid
                      },
                    ),



                    const SizedBox(
                      height: 8,
                    ),
                    TextFormField(
readOnly: true,
                      controller: pincodecontroller,

                      decoration: InputDecoration(
                        prefixIcon: const Icon(
                          Icons.location_on,
                          color: AppColors.tabtextColor,
                        ),
                        hintText: 'Pin Code',
                        hintStyle: TextStyle(fontSize: 13),
                        contentPadding: const EdgeInsets.symmetric(vertical: 5),
                        focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                            borderSide:
                            BorderSide(color: AppColors.whiteTemp, width: 2)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                            borderSide:
                            const BorderSide(color: AppColors.whiteTemp, width: 2)),
                        errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                            borderSide:
                            BorderSide(color: AppColors.whiteTemp, width: 2)),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: AppColors.whiteTemp),
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),

                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please Enter Pincode';
                        }


                        return null; // Return null if the input is valid
                      },
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    TextFormField(

                      controller: regioncontroller,

                      decoration: InputDecoration(
                        prefixIcon: const Icon(
                          Icons.location_on,
                          color: AppColors.tabtextColor,
                        ),
                        hintText: 'Region',
                        hintStyle: TextStyle(fontSize: 13),
                        contentPadding: const EdgeInsets.symmetric(vertical: 5),
                        focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                            borderSide:
                            BorderSide(color: AppColors.whiteTemp, width: 2)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                            borderSide:
                            const BorderSide(color: AppColors.whiteTemp, width: 2)),
                        errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                            borderSide:
                            BorderSide(color: AppColors.whiteTemp, width: 2)),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: AppColors.whiteTemp),
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),

                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please Enter Region';
                        }


                        return null; // Return null if the input is valid
                      },
                    ),






                    const SizedBox(
                      height: 50,
                    ),



                    InkWell(

                      onTap: () {
                        if(_formKey.currentState!.validate()) {
                          setState(() {
                            isLoading = true;
                          });
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) =>
                                BankDetailsScr(name: widget.name.toString(),
                                  email: widget.email.toString(),
                                  mobile: widget.mobile.toString(),
                                  gender: widget.gender.toString(),
                                  experience: widget.experience.toString(),
                                  adharf: widget.adharf.toString(),
                                  adharb: widget.adharf.toString(),
                                  licenseimage: widget.licenseimage.toString(),
                                  profileimage: widget.profileimage.toString(),
                                  password: widget.password.toString(),
                                  alcohal: widget.alcohal.toString(),
                                  address: addresscontroller.text.toString(),
                                  state: statecontroller.text.toString(),
                                  city: citicontroller.text.toString(),
                                  pincode: pincodecontroller.text.toString(),
                                  region: regioncontroller.text.toString(),),));

                          setState(() {
                            isLoading = false;
                          });
                        }
                      },
                      child:
                      !isLoading?
                      CustomButton(textt: "Next",):

                      LoadingWidget(context),
                    ),

                    SizedBox(height: 100,)

                  ],
                ),
              ),



            )
          ],
        ),
      ),
    );
  }

  bool isLoading=false;


  final _formKey = GlobalKey<FormState>();
  TextEditingController statecontroller = TextEditingController();
  TextEditingController pincodecontroller = TextEditingController();
  TextEditingController citicontroller = TextEditingController();
  TextEditingController addresscontroller = TextEditingController();
  TextEditingController regioncontroller = TextEditingController();

  void showPlacePicker() async {
    LocationResult result = await Navigator.of(context).push(
        MaterialPageRoute(
            builder: (context) =>
                PlacePicker(


                    "AIzaSyDPsdTq-a4AHYHSNvQsdAlZgWvRu11T9pM"))

    );

    // Check if the user picked a place
    if (result != null) {
      setState(() {
       addresscontroller.text='${result.formattedAddress}';
        print(addresscontroller.text);
      });
      setState(() {
        lat="${result.latLng!.latitude}";
        print(lat);

        lang="${result.latLng!.longitude}";
        print(lang);
        citicontroller.text= result.city!.name.toString();
        statecontroller.text = result.administrativeAreaLevel1!.name.toString();
        pincodecontroller.text = result.postalCode.toString();

        print(citicontroller.text);
      });
    }
  }
  String _getAreaFromAddress(String formattedAddress) {
    List<String> addressComponents = formattedAddress.split(', ');

    String area = addressComponents.firstWhere(
          (element) => element.endsWith('Area'),
      orElse: () => 'N/A',
    );

    return area;
  }
  var lat;
  var lang;


}