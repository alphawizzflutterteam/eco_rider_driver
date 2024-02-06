import 'dart:convert';
import 'dart:io';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:eco_rider_driver/Helper/extension.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:place_picker/entities/location_result.dart';
import 'package:place_picker/widgets/place_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Api services/api_services/apiBasehelper.dart';
import '../../Api services/api_services/apiConstants.dart';
import '../../Api services/api_services/apiStrings.dart';
import '../../Helper/Colors.dart';
import '../../Helper/loadingwidget.dart';
import '../../Widget/custom_app_button.dart';
import '../../Widget/customeTost.dart';
import '../auth/custumScreen.dart';
import '../dashboard/dashboardScreen.dart';

class UpdateProfile extends StatefulWidget {
  const UpdateProfile({Key? key}) : super(key: key);

  @override
  State<UpdateProfile> createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getuserdata();
  }
  @override
  Widget build(BuildContext context) {
    return   SafeArea(
      child: Scaffold(
        bottomSheet:   Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(

                onTap: () {


                  //
                  // if(_selectvehiclecat==null){
                  //   customSnackbar(context,"Please Select Vehicle Category".toString() );
                  //   // getNotifivcation();
                  //
                  // }
                  // else if(selectcartypr==null){
                  //   customSnackbar(context,"Please Select Car Type".toString() );
                  //
                  // }
                  // else if(_selectecity==null){
                  //   customSnackbar(context,"Please Select City".toString() );
                  //
                  // }
                  // else if(selectCityCommaSaparated==null){
                  //   customSnackbar(context,"Please Select In City/Out City".toString() );
                  //
                  // }
                  //
                  // else if(fromdate==null){
                  //   customSnackbar(context,"Please Select From Date".toString() );
                  //
                  // }
                  // else if(todate==null){
                  //   customSnackbar(context,"Please Select To Date".toString() );
                  //
                  // }
                  // else if(selecthour==null){
                  //   customSnackbar(context,"Please Select Duration Selection".toString() );
                  //
                  // }
                  //
                  // else if(enterDurationController.text.isEmpty){
                  //   customSnackbar(context,"Please Enter How Many Duration".toString() );
                  //
                  // }else{
                  //   driverbooking();
                  //
                  // }

                  updateProfile();

                },
                child:

                CustomButton(textt: "Update Profile",)


              ),
            ],
          ),
        ),
        body:


            !isLoading?
        Stack(
          children: [

            customdecorationFORScr(context,"Update Profile"),

            Container(
              margin:
              EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.15),
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Color(0xffF6F6F6),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30), topRight: Radius.circular(30)),
              ),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(left: 15,right: 15),
                  child: Column(
                    children: [


                      SizedBox(height: 20,),


                      SizedBox(height: 20,),
                      TextFormField(

                        controller: ownernameController,
                        decoration: InputDecoration(

                          prefixIcon: const Icon(
                            Icons.person,
                            color: AppColors.tabtextColor,
                          ),

                          hintText: 'Name',

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
                            return 'Please Enter Name';
                          }
                          return null; // Return null if the input is valid
                        },


                      ),
                      SizedBox(height: 8,),
                      TextFormField(
                        controller: emailC,
                        decoration: InputDecoration(

                          prefixIcon: const Icon(
                            Icons.email,
                            color: AppColors.tabtextColor,
                          ),
                          hintText: 'Email',
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
                            return 'Please Enter Email';
                          }
                          else if (!value.contains('@')||!value.contains(".com")) {
                            return 'Please Enter Valid Email';
                          }
                          return null; // Return null if the input is valid
                        },
                      ),

                      const SizedBox(
                        height: 8,
                      ),
                      TextFormField(
                        maxLength: 10,
                        controller: mobilecontroller,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          counterText: "",
                          prefixIcon: const Icon(
                            Icons.call,
                            color: AppColors.tabtextColor,
                          ),
                          hintText: 'Mobile Number',
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
                            return 'Please Enter Mobile Number';
                          }
                          else if (value.length<10) {
                            return 'Please Enter Valid Mobile Number';
                          }
                          return null; // Return null if the input is valid
                        },
                      ),



                      const SizedBox(
                        height: 8,
                      ),




                      Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width/2),
                          border: Border.all(
                              width: 2, color: AppColors.whiteTemp),
                        ),
                        child:


                        Container(


                          child: Row(
                            children: [
                              SizedBox(width: 10,),
                              Icon(Icons.map,color: AppColors.tabtextColor,),
                              DropdownButtonHideUnderline(

                                child:

                                DropdownButton2(


                                  hint: SizedBox(
                                    width: MediaQuery.of(context).size.width/1.7,
                                    child: Text(
                                      'Select Gender',
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                      style:
                                      TextStyle(color: AppColors.tabtextColor,fontSize: 13),
                                    ),
                                  ), // Not necessary for Option 1
                                  value: _selectvehiclecat,
                                  onChanged: (newValue) {
                                    setState(() {
                                      _selectvehiclecat = newValue.toString();


                                    });
                                  },
                                  items: selectvehicle_List.map((location) {
                                    return DropdownMenuItem(
                                      child: new Text(location),
                                      value: location,
                                    );
                                  }).toList(),
                                ),


                              ),
                            ],
                          ),
                        ),
                      ),



                      SizedBox(
                        height: 8,
                      ),

                      TextFormField(
                        controller: ecperienceC,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(
                            Icons.data_exploration_rounded,
                            color: AppColors.tabtextColor,
                          ),
                          hintText: 'Total Driving Experience',
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
                            return 'Please Enter Driving Experience';
                          }
                          return null; // Return null if the input is valid
                        },
                      ),

                      const SizedBox(
                        height: 8,
                      ),

                      Column(
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          InkWell(
                            onTap: () {
                              showAlertDialog(context, 'aadharfront');
                            },
                            child: Row(
                              children: [
                                Container(
                                  height: 80,
                                  width: 100,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(
                                        width: 1,
                                        color: AppColors.tabtextColor),
                                  ),



                                  child: Center(
                                    child: Padding(
                                        padding: const EdgeInsets.all(10),
                                        child: adharfronImg == null
                                            ? Image.network(
                                          "${adharf??""}",
                                          height: 150.0,
                                          width: 100.0,
                                        )
                                            : Image.file(adharfronImg!)),
                                  ),
                                ),
                                Spacer(),
                                Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context)
                                          .size
                                          .width /
                                          2.2,
                                      height: 40,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.circular(5),
                                          color: AppColors.primary),
                                      child: Center(
                                        child: Text(
                                          'Upload Aadhar Card',
                                          style: TextStyle(
                                              color: AppColors.tabtextColor,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          '  Front Image',
                                          style: TextStyle(
                                              color: AppColors.tabtextColor,
                                              fontSize: 10),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          InkWell(
                            onTap: () {
                              showAlertDialog(context, 'aadharback');
                            },
                            child: Row(
                              children: [
                                Container(
                                  height: 80,
                                  width: 100,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(
                                        width: 1,
                                        color: AppColors.tabtextColor),
                                  ),
                                  child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: adharbackImg == null
                                          ? Image.network(
                                        '${adharb??""}',
                                        height: 150.0,
                                        width: 100.0,
                                      )
                                          : Image.file(adharbackImg!),
                                    ),
                                  ),
                                ),
                                Spacer(),
                                Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context)
                                          .size
                                          .width /
                                          2.2,
                                      height: 40,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.circular(5),
                                          color: AppColors.primary),
                                      child: Center(
                                        child: Text(
                                          'Upload Aadhar Card',
                                          style: TextStyle(
                                              color: AppColors.tabtextColor,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          '  Back Image',
                                          style: TextStyle(
                                              color: AppColors.tabtextColor,
                                              fontSize: 10),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                        ],
                      ),

                      const SizedBox(
                        height: 8,
                      ),

                      Column(
                        children: [
                          InkWell(
                            onTap: () {

                              showAlertDialog(context, 'license');
                            },
                            child: Row(
                              children: [
                                Container(
                                  height: 80,
                                  width: 100,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(
                                        width: 1,
                                        color: AppColors.tabtextColor),
                                  ),
                                  child: Center(
                                    child: Padding(
                                        padding: const EdgeInsets.all(10),
                                        child: licenceImg == null
                                            ? Image.network(
                                          '${licenceImage}',
                                          height: 150.0,
                                          width: 100.0,
                                        )
                                            : Image.file(licenceImg!)),
                                  ),
                                ),
                                Spacer(),
                                Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context)
                                          .size
                                          .width /
                                          2.2,
                                      height: 40,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.circular(5),
                                          color: AppColors.primary),
                                      child: Center(
                                        child: Text(
                                          'Upload Driving License Image',
                                          style: TextStyle(
                                              color: AppColors.tabtextColor,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(
                        height: 8,
                      ),

                    Column(
                        children: [
                          InkWell(
                            onTap: () {

                              pickImage(ImageSource.camera, 'profile');
                            },
                            child: Row(
                              children: [
                                Container(
                                  height: 80,
                                  width: 100,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(
                                        width: 1,
                                        color: AppColors.tabtextColor),
                                  ),
                                  child: Center(
                                    child: Padding(
                                        padding: const EdgeInsets.all(10),
                                        child: userImg == null
                                            ? Image.network(
                                          '${imagepath}',
                                          height: 150.0,
                                          width: 100.0,
                                        )
                                            : Image.file(userImg!)),
                                  ),
                                ),
                                Spacer(),
                                Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context)
                                          .size
                                          .width /
                                          2.2,
                                      height: 40,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.circular(5),
                                          color: AppColors.primary),
                                      child: Center(
                                        child: Text(
                                          'Upload Profile Image',
                                          style: TextStyle(
                                              color: AppColors.tabtextColor,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                    ),

                                  ],
                                ),
                              ],
                            ),
                          ),




                        ],
                      ),



                      SizedBox(height: 8,),
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

                      SizedBox(height: 8,),


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

                      SizedBox(height: 100,),






                    ]
                      ),
                )


              ),
            )
          ],
        ):


            Container(
                height: MediaQuery.of(context).size.height/1.4,
                child: Center(child: LoadingWidget2(context))),
      ),
    );
  }


  bool isLoading=false;
  var getdataa;
  var imagepath;
  var adharf;
  var adharb;
  var licenceImage;
  String? _selectvehiclecat;
  List selectvehicle_List=['Male','Female'];
  final emailC = TextEditingController();
  TextEditingController ownernameController=TextEditingController();
  TextEditingController mobilecontroller =TextEditingController();
  getuserdata() async {
    setState(() {
      isLoading=true;
    });
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var  userId =prefs.getString('userId');

    var param ={

      'driver_id': userId.toString(),

    };

    apiBaseHelper.postAPICall(getprofileurl,param).then((getDta){

      bool error =getDta['status'];
      String msg =getDta['message'];
      if(error==true){
        print("===my technic==== api===${getDta['data']['gender']}===============");
        String getGender = "${getDta['data']['gender']}";
        String capitalizedA = "${getGender[0].toUpperCase()}${getGender.substring(1)}";

        setState(() {
print("===my technic=====convert==${capitalizedA}===============");
            _selectvehiclecat=capitalizedA.toString();
          ownernameController.text=getDta['data']['user_name'].toString();
          emailC.text=getDta['data']['email'].toString();
          mobilecontroller.text=getDta['data']['phone'].toString();
          imagepath=getDta['data']['user_image1'].toString();
ecperienceC.text=getDta['data']['driving_exp'].toString();
ecperienceC.text=getDta['data']['driving_exp'].toString();
addresscontroller.text=getDta['data']['address'].toString();
statecontroller.text=getDta['data']['state'].toString();
citicontroller.text=getDta['data']['city'].toString();
pincodecontroller.text=getDta['data']['pin_code'].toString();
regioncontroller.text=getDta['data']['region'].toString();
banknameC.text=getDta['data']['bank_name'].toString();
accountNumberC.text=getDta['data']['account_number'].toString();
ifscC.text=getDta['data']['ifsc_code'].toString();
upiIdC.text=getDta['data']['upi_id'].toString();
          licenceImage=getDta['data']['driving_licence_photo1'].toString();
          adharf=getDta['data']['aadhar_card_f1'].toString();
          adharb=getDta['data']['aadhar_card_b1'].toString();
          lat=getDta['data']['latitude'].toString();
          lang=getDta['data']['longitude'].toString();

          setState(() {
            isLoading=false;
          });
        });
      }
      else{

        setState(() {
          isLoading=false;
        });
      }


    },);


  }

List <Map<String, dynamic>> checKImageFile=[];

Future<void>

updateProfile() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var  userId =prefs.getString('userId');
      setState(() {
        isLoading=true;
      });
      var param={


      'driver_id': userId.toString(),
        'user_fullname': ownernameController.text.toString(),
        'user_phone':  mobilecontroller.text.toString(),
        'user_email':  emailC.text.toString(),
        'gender':  _selectvehiclecat.toString(),
        'driving_exp':  ecperienceC.text.toString(),
        'driver_console_alcohal': alcchohal.toString(),
        'current_address': addresscontroller.text.toString(),
        'region':  regioncontroller.text.toString(),
        'state': statecontroller.text.toString(),
        'city':  citicontroller.text.toString(),
        'pin_code':  pincodecontroller.text.toString(),
        'bank_name':  banknameC.text.toString(),
        'account_number':  accountNumberC.text.toString(),
        'ifsc_code': ifscC.text.toString(),
        'upi_id': upiIdC.text.toString(),
        'longitude': '${lang.toString()}',
        'latitude': '${lat.toString()}',
      };

     if(userImg!=null){

       List<Map<String, dynamic>> imagefile=[

         {
           "key": "user_image",
           "filePath":"${userImg!.path}"

         },

       ];

       checKImageFile.addAll(imagefile);
       setState(() {

       });
     }else if(adharfronImg!=null
     ){

       List<Map<String, dynamic>> imagefile=[

         {
           "key": "aadhar_card_f",
           "filePath":"${adharfronImg!.path}"

         },

       ];

       checKImageFile.addAll(imagefile);
       setState(() {

       });


     }
     else if(adharbackImg!=null
     ){

       List<Map<String, dynamic>> imagefile=[

         {
           "key": "aadhar_card_b",
           "filePath":"${adharbackImg!.path}"

         },

       ];

       checKImageFile.addAll(imagefile);
       setState(() {

       });


     }

     else if(licenceImg!=null
     ){

       List<Map<String, dynamic>> imagefile=[

         {
           "key": "driving_licence_photo",
           "filePath":"${licenceImg!.path}"

         },

       ];

       checKImageFile.addAll(imagefile);
       setState(() {

       });


     }

      apiBaseHelper.postMultipartAPICall(userUpdateurl, param,checKImageFile).then((getData){

        bool error=getData['status'];
        String?msg=getData['message'];
        if(error==true){
          customSnackbar(context, msg.toString());

          setState(() {
            isLoading = false;
          });

         Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Dashboard(),));


        }else{

        }


      }
      );

    }


  final ecperienceC = TextEditingController();

  File? adharfronImg;
  File? adharbackImg;
  File? userImg;
  File? licenceImg;

  Future<void> pickImage(ImageSource source, String type) async {
    final pickedFile = await ImagePicker().pickImage(
      source: source,
      maxHeight: 100,
      maxWidth: 100,
      imageQuality: 50, // You can adjust the image quality here
    );

    if (pickedFile != null) {
      setState(() {
        if (type == 'aadharfront') {
          adharfronImg = File(pickedFile.path);
          print(adharfronImg);
        } else if (type == 'aadharback') {
          adharbackImg = File(pickedFile.path);
          print(adharbackImg);
        } else if (type == 'profile') {
          userImg = File(pickedFile.path);
          print('============${userImg!.path}');
        } else if (type == 'license') {
          licenceImg = File(pickedFile.path);
          print('============${licenceImg!.path}');
        }
      });
    }
  }

  showAlertDialog(BuildContext context, String type) {
    AlertDialog alert = AlertDialog(
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 25),
          child: Container(
            height: 250,
            color: Colors.transparent, //could change this to Color(0xFF737373),
            //so you don't have to change MaterialApp canvasColor
            child: Container(
                decoration: new BoxDecoration(
                    color: Colors.white,
                    borderRadius: new BorderRadius.only(
                        topLeft: const Radius.circular(10.0),
                        topRight: const Radius.circular(10.0))),
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 5,
                      width: 150,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(75),
                          color: Colors.grey),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      'Select Any One Option',
                      style: TextStyle(
                          fontSize: 17,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    InkWell(
                      onTap: () {
                        print(type);
                        Navigator.of(context).pop();
                        pickImage(ImageSource.gallery, type);
                      },
                      child: Card(
                        elevation: 5,
                        child: Container(
                          width: 200,
                          height: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8)),
                          child: Center(child: Text('Select From Gallery')),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    InkWell(
                      onTap: () {
                        print(type);
                        Navigator.of(context).pop();
                        pickImage(ImageSource.camera, type);
                      },
                      child: Card(
                        elevation: 5,
                        child: Container(
                          width: 200,
                          height: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8)),
                          child: Center(child: Text('Select From Camera')),
                        ),
                      ),
                    )
                  ],
                )),
          ),
        ),
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }


  var alcchohal;

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
  final banknameC = TextEditingController();
  final accountNumberC = TextEditingController();
  final ifscC = TextEditingController();
  final upiIdC = TextEditingController();


}
