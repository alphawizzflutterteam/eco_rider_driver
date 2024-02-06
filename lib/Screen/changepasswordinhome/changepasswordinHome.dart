import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Api services/api_services/apiBasehelper.dart';
import '../../Api services/api_services/apiStrings.dart';
import '../../Helper/Colors.dart';
import '../../Helper/loadingwidget.dart';
import '../../Widget/custom_app_button.dart';
import '../auth/custumScreen.dart';

class ChangePasswordinHome extends StatefulWidget {
  const ChangePasswordinHome({Key? key}) : super(key: key);

  @override
  State<ChangePasswordinHome> createState() => _ChangePasswordinHomeState();
}

class _ChangePasswordinHomeState extends State<ChangePasswordinHome> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return   SafeArea(
      child: Scaffold(
        body:

        Stack(
          children: [

            customdecorationFORScr(context,"Change Password"),

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
                  padding: const EdgeInsets.all(20),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [


                        SizedBox(
                          height: 20,
                        ),

                        Row(
                          children: [
                            Text('Change Password',style: TextStyle(fontSize: 18,color: AppColors.blackTemp,fontWeight: FontWeight.w500)),
                          ],
                        ),

                        SizedBox(height: 20,),

                        TextFormField(
                          maxLength: 10,
                          controller: oldPasswordcontroller,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            counterText: "",
                            prefixIcon: const Icon(
                              Icons.lock,
                              color: AppColors.blackTemp,
                            ),
                            hintText: 'Old Password',
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
                              return 'Please Enter Old Password';
                            }

                            return null; // Return null if the input is valid
                          },
                        ),
                        SizedBox(height: 10,),


                        TextFormField(
                          maxLength: 10,
                          controller: newPasswordController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            counterText: "",
                            prefixIcon: const Icon(
                              Icons.lock,
                              color: AppColors.blackTemp,
                            ),
                            hintText: 'New Password',
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
                              return 'Please Enter New Password';
                            }

                            return null; // Return null if the input is valid
                          },
                        ),
                        SizedBox(height: 10,),
                        TextFormField(
                          maxLength: 10,
                          controller: confirmpasswordcontroller,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            counterText: "",
                            prefixIcon: const Icon(
                              Icons.lock,
                              color: AppColors.blackTemp,
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
                              return 'Please Enter Confirm Password';
                            }else if (value.toString()!=newPasswordController.text.toString()) {
                              return 'Confirm Password Not Match';
                            }
                            return null; // Return null if the input is valid
                          },
                        ),
                        SizedBox(
                          height: 70,
                        ),

                        InkWell(

                          onTap: () {


                            if(_formKey.currentState!.validate()){

                              getChangePasswordinHome();

                            }




                          },
                          child:
                          !isLoading?
                          CustomButton(textt: "Submit",):

                          LoadingWidget(context),
                        )

                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
  bool isLoading=false;
  var userId;
  final _formKey = GlobalKey<FormState>();

  Future<void> getChangePasswordinHome() async {
    setState(() {
      isLoading=true;
    });
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    userId =prefs.getString('userId');
    var param={
      'user_id': userId.toString(),
      'old_password': oldPasswordcontroller.text.toString(),
      'new_password': newPasswordController.text.toString(),
    };
    apiBaseHelper.postAPICall(changepassworddurl,param ).then((getDta){

      if(getDta['status']==true){
        Fluttertoast.showToast(msg: "${getDta['message'].toString()}");
        setState(() {
          isLoading=false;
        });
        oldPasswordcontroller.clear();
        newPasswordController.clear();
        confirmpasswordcontroller.clear();

      }
      else{
        Fluttertoast.showToast(msg: "${getDta['message'].toString()}");
        setState(() {
          isLoading=false;
        });

      }


    },);
  }

  TextEditingController oldPasswordcontroller =TextEditingController();
  TextEditingController newPasswordController =TextEditingController();
  TextEditingController confirmpasswordcontroller =TextEditingController();
}
