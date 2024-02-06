import 'dart:convert';
import 'dart:ffi';

import 'package:eco_rider_driver/Api%20services/api_services/apiConstants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Helper/Colors.dart';
import '../notification/notification.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;


Widget customAuthDegine (BuildContext context, String imagePath,){
  return

    Stack(children: [
    Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20)),
        gradient: LinearGradient(
          colors: [AppColors.primary, AppColors.secondary],
          // Define the colors
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Column(
        children: [
          Padding(
            padding:  EdgeInsets.only(top:MediaQuery.of(context).size.height/12),
            child:

                Container(
                    height: 150,
                    width: 150,
                    child: Image.asset("${imagePath.toString()}", scale: 1)),


          ),
        ],
      ),
    ),
    Container(
      // padding:  EdgeInsets.only(top: MediaQuery.of(context).size.height/3.18),
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).size.height/2.9,),

      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            // Top-left corner radius
            topRight: Radius.circular(30),
            // Bottom-right corner with no rounding
          ),
        ),
      ),
    ),
  ],);
}
Widget customAuthDegineforForget (BuildContext context,){
  return

    Stack(children: [
      Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20)),
          gradient: LinearGradient(
            colors: [AppColors.primary, AppColors.secondary],
            // Define the colors
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(right: 20,left: 20,top: 20),
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height/19,),
             Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
               
               
               InkWell(
                   onTap: () {

                     Navigator.pop(context);
                   },
                   child: Icon(Icons.arrow_back_ios,color: AppColors.whiteTemp,size: 20,)),
               
               Text("Forgot Password",style: TextStyle(fontSize: 20,color: AppColors.whiteTemp,fontWeight: FontWeight.w500),),
               SizedBox()
             ],),
              SizedBox(height: 15,),
              Text("There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable.",style: TextStyle(fontSize: 12,color: AppColors.whiteTemp),)
            ],
          ),
        ),
      ),
      Container(
        // padding:  EdgeInsets.only(top: MediaQuery.of(context).size.height/3.18),
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).size.height/3.6,),

        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              // Top-left corner radius
              topRight: Radius.circular(30),
              // Bottom-right corner with no rounding
            ),
          ),
        ),
      ),
    ],);
}

Widget customAuthDegineforverifie (BuildContext context,){
  return


    Stack(children: [
      Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20)),
          gradient: LinearGradient(
            colors: [AppColors.primary, AppColors.secondary],
            // Define the colors
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(right: 20,left: 20,top: 20),
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height/19,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [


                  InkWell(
                      onTap: () {

                        Navigator.pop(context);
                      },
                      child: Icon(Icons.arrow_back_ios,color: AppColors.whiteTemp,size: 20,)),

                  Text("Verification",style: TextStyle(fontSize: 20,color: AppColors.whiteTemp,fontWeight: FontWeight.w500),),
                  SizedBox()
                ],),
              SizedBox(height: 15,),
              Text("There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable.",style: TextStyle(fontSize: 12,color: AppColors.whiteTemp),)
            ],
          ),
        ),
      ),
      Container(
        // padding:  EdgeInsets.only(top: MediaQuery.of(context).size.height/3.18),
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).size.height/3.6,),

        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              // Top-left corner radius
              topRight: Radius.circular(30),
              // Bottom-right corner with no rounding
            ),
          ),
        ),
      ),
    ],);
}
Widget customchangepassword (BuildContext context,){
  return

    Stack(children: [
      Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20)),
          gradient: LinearGradient(
            colors: [AppColors.primary, AppColors.secondary],
            // Define the colors
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(right: 20,left: 20,top: 20),
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height/19,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [


                  InkWell(
                      onTap: () {

                        Navigator.pop(context);
                      },
                      child: Icon(Icons.arrow_back_ios,color: AppColors.whiteTemp,size: 20,)),

                  Text("Create Password",style: TextStyle(fontSize: 20,color: AppColors.whiteTemp,fontWeight: FontWeight.w500),),
                  SizedBox()
                ],),
              SizedBox(height: 15,),
              Text("There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable.",style: TextStyle(fontSize: 12,color: AppColors.whiteTemp),)
            ],
          ),
        ),
      ),
      Container(
        // padding:  EdgeInsets.only(top: MediaQuery.of(context).size.height/3.18),
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).size.height/3.6,),

        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              // Top-left corner radius
              topRight: Radius.circular(30),
              // Bottom-right corner with no rounding
            ),
          ),
        ),
      ),
    ],);
}


Widget customAuthDegineforprofle (BuildContext context,){
  return

    Stack(children: [
      Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20)),
          color: AppColors.primary
  ),
        child: Padding(
          padding: const EdgeInsets.only(right: 20,left: 20,top: 20),
          child: Column(
            children: [
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [


                  InkWell(
                      onTap: () {

                        Navigator.pop(context);
                      },
                      child: Icon(Icons.arrow_back_ios,color: AppColors.whiteTemp,size: 20,)),

                  Text("My Profile",style: TextStyle(fontSize: 20,color: AppColors.whiteTemp,fontWeight: FontWeight.w500),),
                  SizedBox()
                ],),
              ],
          ),
        ),
      ),
      Container(
        // padding:  EdgeInsets.only(top: MediaQuery.of(context).size.height/3.18),
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).size.height/4.9,),

        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              // Top-left corner radius
              topRight: Radius.circular(30),
              // Bottom-right corner with no rounding
            ),
          ),
        ),
      ),
    ],);
}

Widget customdecorationFORScr (BuildContext context,String titlee){
  return

    Stack(children: [
      Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20)),
          gradient: LinearGradient(
            colors: [AppColors.primary, AppColors.secondary],
            // Define the colors
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(right: 20,left: 20,top: 20),
          child:

          Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height/55,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [


                  InkWell(
                      onTap: () {

                        Navigator.pop(context);
                      },
                      child: Icon(Icons.arrow_back_ios,color: AppColors.whiteTemp,size: 20,)),

                  Text("${titlee}",style: TextStyle(fontSize: 20,color: AppColors.whiteTemp,fontWeight: FontWeight.w500),),
                  SizedBox()
                ],),
               ],
          ),
        ),
      ),
      Container(
        // padding:  EdgeInsets.only(top: MediaQuery.of(context).size.height/3.18),
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).size.height/7.5,),

        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              // Top-left corner radius
              topRight: Radius.circular(30),
              // Bottom-right corner with no rounding
            ),
          ),
        ),
      ),
    ],);
}

Widget customdwithoutBackScr(BuildContext context,String titlee,){

  return

    Stack(children: [
      Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20)),
          gradient: LinearGradient(
            colors: [AppColors.primary, AppColors.secondary],
            // Define the colors
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(right: 20,left: 20,top: 20),
          child:

          Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height/55,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [


                  SizedBox(),

                  Text("${titlee}",style: TextStyle(fontSize: 20,color: AppColors.whiteTemp,fontWeight: FontWeight.w500),),
                  // SizedBox()
             SizedBox(width: 20,)

                ],),
            ],
          ),
        ),
      ),
      Container(
        // padding:  EdgeInsets.only(top: MediaQuery.of(context).size.height/3.18),
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).size.height/7.5,),

        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              // Top-left corner radius
              topRight: Radius.circular(30),
              // Bottom-right corner with no rounding
            ),
          ),
        ),
      ),
    ],);
}

var _switchValue =true;

Widget customdwithoutBackScr11 (BuildContext context,String titlee,bool val){

  _switchValue=val;



  return

    Stack(children: [
      Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20)),
          gradient: LinearGradient(
            colors: [AppColors.primary, AppColors.secondary],
            // Define the colors
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(right: 20,left: 20,top: 20),
          child:

          Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height/55,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [


                 SizedBox(),

                  Text("${titlee}",style: TextStyle(fontSize: 20,color: AppColors.whiteTemp,fontWeight: FontWeight.w500),),
                  // SizedBox()
StatefulBuilder(builder: (context, setState) {
  return  CupertinoSwitch(

      value: _switchValue?true:false,
      onChanged: (value) {
        if(value==true){


setState(() {
  print("===my technic=======${value}===============");
  _switchValue = value;
  activeDeactive(value);
},);

        }else{
          setState(() {
            print("===my technic=======${value}===============");
            _switchValue = value;

            activeDeactive(value);


          },);
        }}
  );
},)

                ],),
            ],
          ),
        ),
      ),
      Container(
        // padding:  EdgeInsets.only(top: MediaQuery.of(context).size.height/3.18),
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).size.height/7.5,),

        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              // Top-left corner radius
              topRight: Radius.circular(30),
              // Bottom-right corner with no rounding
            ),
          ),
        ),
      ),
    ],);
}

Widget customdecorationhomeScreen (BuildContext context,String titlee){
  return

    Stack(children: [
      Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20)),
          gradient: LinearGradient(
            colors: [AppColors.primary, AppColors.secondary],
            // Define the colors
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(right: 20,left: 20,top: 20),
          child:

          Column(
            children: [

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [


                  SizedBox(width: 20,),

                  Text("${titlee}",style: TextStyle(fontSize: 20,color: AppColors.whiteTemp,fontWeight: FontWeight.w500),),
                  InkWell(

                      onTap: () {


                        Navigator.push(context, MaterialPageRoute(builder: (context) => NotificationScr(),));
                      },
                      child: Image.asset('assets/images/notification.png',scale: 1.5,))
                ],),
            ],
          ),
        ),
      ),
      Container(
        // padding:  EdgeInsets.only(top: MediaQuery.of(context).size.height/3.18),
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).size.height/9,),

        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              // Top-left corner radius
              topRight: Radius.circular(30),
              // Bottom-right corner with no rounding
            ),
          ),
        ),
      ),
    ],);


}

Widget orderdetailsCustom (BuildContext context,String titlee){
  return

    Stack(children: [
      Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20)),
          gradient: LinearGradient(
            colors: [AppColors.primary, AppColors.secondary],
            // Define the colors
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(right: 20,left: 20,top: 20),
          child:

          Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height/55,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [


                  InkWell(
                      onTap: () {

                        Navigator.pop(context);
                      },
                      child: Icon(Icons.arrow_back_ios,color: AppColors.whiteTemp,size: 20,)),

                  Text("${titlee}",style: TextStyle(fontSize: 20,color: AppColors.whiteTemp,fontWeight: FontWeight.w500),),
                  InkWell(

                      onTap: () {


                        Navigator.push(context, MaterialPageRoute(builder: (context) => NotificationScr(),));
                      },
                      child: Image.asset('assets/images/notification.png',scale: 1.5,))
                ],),
            ],
          ),
        ),
      ),
      Container(
        // padding:  EdgeInsets.only(top: MediaQuery.of(context).size.height/3.18),
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).size.height/7.5,),

        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              // Top-left corner radius
              topRight: Radius.circular(30),
              // Bottom-right corner with no rounding
            ),
          ),
        ),
      ),
    ],);



}

Future<void> activeDeactive(bool val) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
var  userId = prefs.getString('userId');


  var headers = {
    'Cookie': 'ci_session=f336d69cb1c25040438134e6c1797593affc271c'
  };
  var request = http.MultipartRequest('POST', Uri.parse('${baseUrl}update_driver_online'));
  request.fields.addAll({
    'online_ofline': val==true?'1':"2",
    'user_id': userId.toString(),
  });

  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();
print("===my technic=======${request.url}===============");
print("===my technic=======${request.fields}===============");
  if (response.statusCode == 200) {
    var result =await response.stream.bytesToString();
    print("===my technic=======${result}===============");
    var finalResult=jsonDecode(result);
    if(finalResult['status']==true){

      Fluttertoast.showToast(msg: finalResult['message'].toString());
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setBool('IsActive',val,);
    }
  }
  else {
  print(response.reasonPhrase);
  }

}
