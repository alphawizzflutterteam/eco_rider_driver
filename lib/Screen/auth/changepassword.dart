
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import '../../Api services/api_services/apiBasehelper.dart';
import '../../Api services/api_services/apiStrings.dart';
import '../../Helper/Colors.dart';
import '../../Helper/loadingwidget.dart';
import '../../Widget/custom_app_button.dart';
import '../../Widget/customeTost.dart';
import 'custumScreen.dart';
import 'loginScreen.dart';




class ChangePassword extends StatefulWidget {

  String ?Mobile;
  ChangePassword({super.key,this.Mobile});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {


  @override
  Widget build(BuildContext context) {
    return

      Scaffold(
        body:

        Stack(
          children: [

            customchangepassword(context,),

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
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),

                      Row(
                        children: [
                          Text('Create Password',style: TextStyle(fontSize: 18,color: AppColors.blackTemp,fontWeight: FontWeight.w500)),
                        ],
                      ),

                      SizedBox(height: 20,),

                      TextFormField(
                        maxLength: 10,
                        controller: passwordC,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          counterText: "",
                          prefixIcon: const Icon(
                            Icons.lock,
                            color: AppColors.blackTemp,
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
                      SizedBox(height: 10,),
                      TextFormField(
                        maxLength: 10,
                        controller: passwordConfirmC,
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
                          }else if (value.toString()!=passwordC.text.toString()) {
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

                            changepassword();

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
            )
          ],
        ),
      );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();


    // otpp=widget.otp.toString();
        ;
  }


  final passwordC = TextEditingController();
  final passwordConfirmC = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;
  var otpp;
  var textotp;
  void changepassword(){
    setState(() {

      isLoading=true;
    });
    var param ={

      'user_phone': widget.Mobile.toString(),
      'password': passwordC.text.toString(),

    };
    apiBaseHelper.postAPICall(createpasswordurl, param).then((getData){

      String msg =getData['message'];
      bool error=getData['status'];

      if(error==true){

        customSnackbar(context,msg.toString());
        setState(() {
          isLoading=false;
        });

        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => LoginPage()),
                (Route<dynamic> route) => false);
      }else
      {


        setState(() {
          isLoading=false;
        });
      }

    });


  }



}