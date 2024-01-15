import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../Helper/Colors.dart';
import '../notification/notification.dart';

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



Widget customdwithoutBackScr (BuildContext context,String titlee){
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

