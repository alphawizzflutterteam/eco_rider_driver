import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../Api services/api_services/apiConstants.dart';
import '../../Helper/Colors.dart';
import '../../Helper/loadingwidget.dart';
import '../auth/custumScreen.dart';

class NotificationScr extends StatefulWidget {
  const NotificationScr({Key? key}) : super(key: key);

  @override
  State<NotificationScr> createState() => _NotificationScrState();
}

class _NotificationScrState extends State<NotificationScr> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getNotifivcation();
  }
  @override
  Widget build(BuildContext context) {
    return   SafeArea(
      child: Scaffold(
        body:


        !isLoading?
        Stack(
          children: [

            customdecorationFORScr(context,"Notifications"),

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
                child: Column(
                  children: [

                    // Padding(
                    //   padding: const EdgeInsets.only(left: 10,right: 10),
                    //   child:
                    //   getNotiList.isEmpty?Container(
                    //
                    //     height: MediaQuery.of(context).size.height/1.6,
                    //     width: MediaQuery.of(context).size.width,
                    //     child: Center(child: Text('Notification Not Found',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),),
                    //   ):
                    //
                    //   Padding(
                    //     padding: const EdgeInsets.only(top: 20),
                    //     child: ListView.builder(
                    //       itemCount: getNotiList.length,
                    //       shrinkWrap: true,
                    //       physics: NeverScrollableScrollPhysics(),
                    //       itemBuilder: (context, index) {
                    //         return Padding(
                    //           padding: const EdgeInsets.only(bottom: 8),
                    //           child: Container(
                    //
                    //             decoration: BoxDecoration(borderRadius: BorderRadius.circular(13),
                    //
                    //                 border: Border.all(color: AppColors.primary,width: 1)
                    //             ),
                    //
                    //
                    //
                    //             child: Padding(
                    //               padding: const EdgeInsets.all(10),
                    //               child: ListTile(title:
                    //               Text("${getNotiList[index].title??""}",style: TextStyle(fontWeight: FontWeight.bold,color: AppColors.blackTemp,fontSize: 13),),
                    //
                    //                 subtitle: Text("${getNotiList[index].message??""}",style: TextStyle(color: AppColors.tabtextColor,fontSize: 10),),
                    //
                    //
                    //               ),
                    //             ),
                    //           ),
                    //         );
                    //
                    //
                    //       },),
                    //   ),
                    // )

                  ],
                ),
              ),
            )
          ],
        ):


        Container(

          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Center(child: LoadingWidget2(context),),
        ),
      ),
    );
  }
  bool isLoading=false;
  var userId;
  // List<NotifivationList> getNotiList=[];
  Future<void> getNotifivcation() async {
    setState(() {
      isLoading=true;
    });

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var  userId =prefs.getString('userId');

    var headers = {
      'Cookie': 'ci_session=6c0fcaf4599389035573c1a4171e5a8fb5c97331'
    };
    var request = http.MultipartRequest('POST', Uri.parse('${baseUrl}api_drivergetAllNotification'));
    request.fields.addAll({
      'driver_id': userId.toString(),
    });
    print(request.url);
    print(request.fields);
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    var result=
    await response.stream.bytesToString();
    var finalresult= jsonDecode(result);

    if(finalresult['status']==true){
      setState(() {

        setState(() {
          // getNotiList=NotificationModel.fromJson(finalresult).data??[];

          isLoading=false;
        });
      });

    }
    else{

      setState(() {
        isLoading=false;
      });
    }



  }
}
