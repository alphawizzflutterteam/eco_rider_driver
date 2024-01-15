

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../Helper/Colors.dart';
import '../dashboard/dashboardScreen.dart';

class TQscr extends StatefulWidget {
   TQscr({Key? key}) : super(key: key);

  @override
  State<TQscr> createState() => _TQscrState();
}

class _TQscrState extends State<TQscr> {
  @override
  Widget build(BuildContext context) {
    return


    Scaffold(

      body:   SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height/6),
            Image.asset('assets/images/completed.png'),
            const SizedBox(height: 20,),
            const Text("Lorem Ipsum is simply dummy text of the ",style: TextStyle(fontSize: 18,color: AppColors.blackTemp,fontFamily: 'Schyler'),),
            const Text("printing and typesetting industry.",style: TextStyle(fontSize: 18,color: AppColors.blackTemp,fontFamily: 'Schyler'),),
            const Text("Lorem Ipsum has been the industry's",style: TextStyle(fontSize: 18,color: AppColors.blackTemp,fontFamily: 'Schyler'),),
            const Text("standard dummy text ever since",style: TextStyle(fontSize: 18,color: AppColors.blackTemp,fontFamily: 'Schyler'),),
            const SizedBox(height: 20,),


            InkWell(
              onTap: () {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>  Dashboard(),));
                // Navigator.of(context).pushAndRemoveUntil(
                //     MaterialPageRoute(builder: (context) => const Dashboard()),
                //         (Route<dynamic> route) => false);

              },
              child: Container(
                height: 50,
                width: MediaQuery.of(context).size.width / 1.6,
                decoration: BoxDecoration(
                    gradient:  LinearGradient(
                      colors: [AppColors.primary, AppColors.secondary],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                    color: AppColors.secondary,
                    borderRadius: BorderRadius.circular(12)),
                child: const Center(


                  child: Text(
                    'Completed',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: AppColors.whiteTemp,
                        fontSize: 13),
                  ),
                ),
              ),
            ),
          ],
        ),
      )
    );


  }
}
