import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Screen/auth/loginScreen.dart';
import '../Screen/dashboard/dashboardScreen.dart';
import 'Colors.dart';
import 'loadingwidget.dart';
class Internetcheck extends StatefulWidget {
  const Internetcheck({super.key});

  @override
  State<Internetcheck> createState() => _InternetcheckState();
}

class _InternetcheckState extends State<Internetcheck> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(


        body:


        RefreshIndicator(
          color: AppColors.primary,
          onRefresh: () async{
            internetConnection();


          },
          child: ListView.builder(


            itemCount: 1,
            itemBuilder: (context, index) {

              return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,

                  children: [
                    SizedBox(height: 50,),
                    Text(
                      'OOPS!',
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        // Set the text color to white
                      ),
                    ),
                    SizedBox(height: 10,),

                    ShaderMask(
                      shaderCallback: (Rect bounds) {
                        return LinearGradient(
                          colors: [Colors.pink,Colors.red, Colors.blue],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ).createShader(bounds);
                      },
                      child: Text(
                        'No Internet Connection',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          // Set the text color to white
                        ),
                      ),
                    ),



                    SizedBox(height: 50,),
                    Image.asset('assets/images/internet.png'),
                    SizedBox(height: 5,),
                    Text(
                      'Please Turn On Internet Connection',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        // Set the text color to white
                      ),
                    ),
                    SizedBox(height: 50,),


                    InkWell(

                      onTap: () {
                        setState(() {
                          isloading=true;
                        });

                        internetConnection();
                      },
                      child: Container(height: 40,width: 200,
                          decoration: BoxDecoration(

                              gradient: LinearGradient(
                                colors: [AppColors.primary, AppColors.secondary],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                              ),
                              borderRadius: BorderRadius.circular(8)),
                          child: Center(child:

                          !isloading?
                          Text('Refresh Page',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)

                          :LoadingWidget(context)

                          )
                      ),
                    )




                  ]);
            },
          ),
        )



    );
  }

  var userId;
  void internetConnection() async {


    try {
      final result = await InternetAddress.lookup('example.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {

        Future.delayed(Duration(seconds: 3),() {
          sessionmanage();
        },);




      }
    } on SocketException catch (_) {

        Future.delayed(Duration(seconds: 3),() {
          setState(() {
          isloading=false;
        });

        },);


    }
  }
  void sessionmanage(){

    Future.delayed(Duration(seconds: 3),() async {

      final SharedPreferences prefs = await SharedPreferences.getInstance();
      userId=prefs.getString('userId');
      print(userId);
      print(userId.runtimeType);

      if(userId==null) {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage(),));
        // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Dashboard(),));
      }
      else{

        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Dashboard(),));


      }

    },);



  }
  bool isloading=false;
}
