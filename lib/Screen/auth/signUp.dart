import 'dart:io';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:eco_rider_driver/Screen/auth/signupaddress.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:image_picker/image_picker.dart';

import '../../Helper/Colors.dart';
import '../../Helper/loadingwidget.dart';
import '../../Widget/custom_app_button.dart';
import '../../Widget/customeTost.dart';
import 'custumScreen.dart';

class SignUpScr extends StatefulWidget {
  const SignUpScr({super.key});

  @override
  State<SignUpScr> createState() => _SignUpScrState();
}

class _SignUpScrState extends State<SignUpScr> {
  final nameC = TextEditingController();
  final ecperienceC = TextEditingController();
  final emailC = TextEditingController();
  final passwordC = TextEditingController();
  final confirmPasswordC = TextEditingController();
  final _formKey = GlobalKey<FormState>();

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
                    Text(
                      "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable.",
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),

                    SizedBox(
                      height: 25,
                    ),
                    TextFormField(
                      controller: nameC,
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
                          return 'Please Enter Name';
                        }

                        return null; // Return null if the input is valid
                      },
                    ),

                    const SizedBox(
                      height: 8,
                    ),

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
                          return 'Please Enter Email';
                        } else if (!value.contains('@') ||
                            !value.contains(".com")) {
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
                          return 'Please Enter Mobile Number';
                        } else if (value.length < 10) {
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
                        borderRadius: BorderRadius.circular(
                            MediaQuery.of(context).size.width / 2),
                        border:
                            Border.all(width: 2, color: AppColors.whiteTemp),
                      ),
                      child: Container(
                        child: Row(
                          children: [
                            SizedBox(
                              width: 10,
                            ),
                            Icon(
                              Icons.map,
                              color: AppColors.tabtextColor,
                            ),
                            DropdownButtonHideUnderline(
                              child: DropdownButton2(
                                hint: SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width / 1.7,
                                  child: Text(
                                    'Select Gender',
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    style: TextStyle(
                                        color: AppColors.tabtextColor,
                                        fontSize: 13),
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

                    !uploadadhar
                        ? InkWell(
                            onTap: () {
                              setState(() {
                                uploadadhar = true;
                              });
                            },
                            child:

                            Container(
                              height: 50,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                    MediaQuery.of(context).size.width / 2),
                                border: Border.all(
                                    width: 2, color: AppColors.whiteTemp),
                              ),
                              child: Container(
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Icon(
                                      Icons.add_card,
                                      color: AppColors.tabtextColor,
                                    ),
                                    SizedBox(
                                      width: 13,
                                    ),
                                    Text(
                                      'Upload Aadhar',
                                      style: TextStyle(
                                          fontSize: 13,
                                          color: AppColors.faqanswerColor),
                                    ),
                                    Spacer(),
                                    Icon(
                                      Icons.file_upload_outlined,
                                      color: AppColors.tabtextColor,
                                      size: 22,
                                    ),
                                    SizedBox(
                                      width: 13,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          )
                        : Column(
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
                                                ? Image.asset(
                                                    'assets/images/adhar.png',
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
                                              ? Image.asset(
                                                  'assets/images/adhar.png',
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

                    !drivingLicence
                        ? InkWell(
                            onTap: () {
                              setState(() {
                                drivingLicence = true;
                              });

                              // pickImage(ImageSource.camera,"profile");
                            },
                            child:
                            Container(
                              height: 50,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                    MediaQuery.of(context).size.width / 2),
                                border: Border.all(
                                    width: 2, color: AppColors.whiteTemp),
                              ),
                              child: Container(
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Icon(
                                      Icons.add_card,
                                      color: AppColors.tabtextColor,
                                    ),
                                    SizedBox(
                                      width: 13,
                                    ),
                                    Text(
                                      'Upload Driving Licence',
                                      style: TextStyle(
                                          fontSize: 13,
                                          color: AppColors.faqanswerColor),
                                    ),
                                    Spacer(),
                                    Icon(
                                      Icons.file_upload_outlined,
                                      color: AppColors.tabtextColor,
                                      size: 22,
                                    ),
                                    SizedBox(
                                      width: 13,
                                    )
                                  ],
                                ),
                              ),
                            ),

                          )
                        : Column(
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
                                                ? Image.asset(
                                                    'assets/images/d.png',
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

                    !upIsselfie
                        ? InkWell(
                            onTap: () {
                              setState(() {
                                upIsselfie = true;
                              });

                              // pickImage(ImageSource.camera,"profile");
                            },
                            child: Container(
                              height: 50,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                    MediaQuery.of(context).size.width / 2),
                                border: Border.all(
                                    width: 2, color: AppColors.whiteTemp),
                              ),
                              child: Container(
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Icon(
                                      Icons.person,
                                      color: AppColors.tabtextColor,
                                    ),
                                    SizedBox(
                                      width: 13,
                                    ),
                                    Text(
                                      'Click Selfi',
                                      style: TextStyle(
                                          fontSize: 13,
                                          color: AppColors.faqanswerColor),
                                    ),
                                    Spacer(),
                                    Icon(
                                      Icons.camera_alt_outlined,
                                      color: AppColors.tabtextColor,
                                      size: 22,
                                    ),
                                    SizedBox(
                                      width: 13,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          )
                        : Column(
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
                                                ? Image.asset(
                                                    'assets/images/p.png',
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
                      obscureText: _obscureText1,
                      controller: passwordC,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          icon: Icon(_obscureText1 ? Icons.visibility : Icons.visibility_off,color: AppColors.primary,size:16 ,),
                          onPressed: () {
                            setState(() {
                              _obscureText1 = !_obscureText1;
                            });
                          },
                        ),
                        prefixIcon: const Icon(
                          Icons.lock,
                          color: AppColors.tabtextColor,
                        ),

                        hintText: 'Password',

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
                          return 'Please Enter Password';
                        }
                        return null; // Return null if the input is valid
                      },


                    ),


                    const SizedBox(
                      height: 8,
                    ),
                    TextFormField(
                      obscureText: _obscureText,
                      controller: confirmPasswordC,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          icon: Icon(_obscureText ? Icons.visibility : Icons.visibility_off,color: AppColors.primary,size:16 ,),
                          onPressed: () {
                            setState(() {
                              _obscureText = !_obscureText;
                            });
                          },
                        ),
                        prefixIcon: const Icon(
                          Icons.lock,
                          color: AppColors.tabtextColor,
                        ),

                        hintText: 'Confirm Password',

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
                          return 'Please Enter Password';
                        }
                        else if (value.toString()!=passwordC.text.toString()) {
                          return 'Confirm Password is Not Match';
                        }
                        return null; // Return null if the input is valid
                      },


                    ),
                    const SizedBox(
                      height: 8,
                    ),

                    Row(
                      children: [
                        Text(
                          'Driver Console Alcohol',
                          style: TextStyle(
                              color: AppColors.tabtextColor,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),

                    const SizedBox(
                      height: 8,
                    ),

                    Row(
                      children: [],
                    ),

                    SizedBox(
                      height: 3,
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              alcchohal = "Yes";
                            });
                          },
                          child: Row(
                            children: [
                              Text(
                                'Yes',
                                style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.tabtextColor),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Container(
                                height: 25,
                                width: 25,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(3),
                                  border: Border.all(
                                      color: AppColors.primary, width: 1),
                                ),
                                child: Center(
                                    child: alcchohal == "Yes"
                                        ? Icon(
                                            Icons.check,
                                            color: AppColors.primary,
                                          )
                                        : SizedBox()),
                              )
                            ],
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              alcchohal = "No";
                            });
                          },
                          child: Row(
                            children: [
                              Text(
                                'No',
                                style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.tabtextColor),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Container(
                                height: 25,
                                width: 25,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(3),
                                  border: Border.all(
                                      color: AppColors.primary, width: 1),
                                ),
                                child: Center(
                                    child: alcchohal == "No"
                                        ? Icon(
                                            Icons.check,
                                            color: AppColors.primary,
                                          )
                                        : SizedBox()),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        SizedBox(
                          width: 30,
                        ),
                      ],
                    ),



                    const SizedBox(
                      height: 50,
                    ),

                    InkWell(
                      onTap: () {
                        if (_formKey.currentState!.validate()) {




                          if (_selectvehiclecat == null) {
                            customSnackbar(context, "Please Select Gender");
                          } else
                          if (ecperienceC.text == null) {
                            customSnackbar(context, "Please Enter Experience");
                          } else
                          if (adharfronImg == null) {
                            customSnackbar(context, "Please Upload Aadhar Front Image");
                          }else
                          if (adharbackImg == null) {
                            customSnackbar(context, "Please Upload Aadhar Front Image");
                          }else
                          if (licenceImg == null) {
                            customSnackbar(context, "Please Upload License Image");
                          }

                          else
                          if (userImg == null) {
                            customSnackbar(context, "Please Upload Profile Image");
                          }
                          else
                          if (alcchohal == null) {
                            customSnackbar(context, "Please Select Console Alcohol");
                          }

                          else{


                            setState(() {
                              isLoading = true;
                            });

                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => AddressSignUpScreen(
                                    name: nameC.text,
                                    email: emailC.text,
                                    mobile: mobilecontroller.text.toString(),
                                    gender: _selectvehiclecat.toString(),
                                    experience: ecperienceC.text,
                                    adharf: adharfronImg!.path,
                                    adharb: adharbackImg!.path,
                                    licenseimage: licenceImg!.path,
                                    profileimage: userImg!.path,
                                    password: passwordC.text.toString(),
                                    alcohal: alcchohal.toString(),
                                  ),
                                ));

                            setState(() {
                              isLoading = false;
                            });
                          }






                        }
                      },
                      child: !isLoading
                          ? CustomButton(
                              textt: "Next",
                            )
                          : LoadingWidget(context),
                    ),
                    SizedBox(
                      height: 50,
                    ),

                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Already have an account?",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            " Log In",
                            style: TextStyle(
                                color: AppColors.primary,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
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
bool _obscureText=false;
bool _obscureText1=false;
  TextEditingController mobilecontroller = TextEditingController();
  bool isLoading = false;

  String? _selectvehiclecat;
  List selectvehicle_List = ['Male', 'Female'];
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

  bool uploadadhar = false;
  bool upIsselfie = false;
  bool drivingLicence = false;
  var alcchohal;
}
