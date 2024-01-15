import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../Api services/api_services/apiConstants.dart';
import '../../Helper/Colors.dart';

import '../../Helper/loadingwidget.dart';
import '../auth/custumScreen.dart';
import 'package:http/http.dart' as http;

class SupportScr extends StatefulWidget {
  const SupportScr({Key? key}) : super(key: key);

  @override
  State<SupportScr> createState() => _SupportScrState();
}

class _SupportScrState extends State<SupportScr> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getSupport();
  }
  @override
  Widget build(BuildContext context) {
    return   SafeArea(
      child: Scaffold(
        body:


        !isLoading?
        Stack(
          children: [

            customdecorationFORScr(context,"Customer Support"),

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
                  padding: const EdgeInsets.only(left: 20,right: 20,top: 20),
                  child: Column(
                    children: [

                      Container(
                        width: 150,
                        height: 150,
                        decoration: BoxDecoration(

                          // shape: BoxShape.circle,


                            image: DecorationImage(image: AssetImage('assets/images/supportIcon.png'),
                                fit: BoxFit.fill
                            )

                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Center(
                        child: Text(
                          'How Can We Help You?',
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500,color: AppColors.supportColor),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),

                      Center(
                        child: Text(
                          'Lorem Ipsum is simply dummy text of the',
                          style: TextStyle(fontSize: 15,color: AppColors.faqanswerColor),
                        ),
                      ),

                      Center(
                        child: Text(
                          'printing and typesetting industry.',

                          style: TextStyle(fontSize: 15,color: AppColors.faqanswerColor),                    ),
                      ),

                      SizedBox(
                        height: 10,
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.support_agent,size: 20,color: AppColors.secondary,),
                          SizedBox(width: 5,),
                          InkWell(
                            onTap: () {
                              _makePhoneCall("tel:${mobilee.toString()}");
                            },
                            child: Text(
                              '+ ${mobilee??""}',
                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400,color: AppColors.supportColor),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 5,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.email,size: 20,color: AppColors.secondary,),
                          SizedBox(width: 5,),
                          InkWell(
                            onTap: () {

                              _sendEmail(emaill);
                            },
                            child: Text(
                              '${emaill??""}',
                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400,color: AppColors.supportColor),
                            ),
                          ),
                        ],
                      ),

                      SizedBox(
                        height: 20,
                      ),
                      SizedBox(height: 30,)
                    ],
                  ),
                ),
              ),
            )
          ],
        ):




        Container(
            height: MediaQuery.of(context).size.height/2,
            child: Center(child: LoadingWidget2(context))),


      ),
    );
  }


  bool isLoading=false;
  var emaill;
  var mobilee;


  Future<void> getSupport() async {


    setState(() {
      isLoading=true;
    });

    var headers = {
      'Cookie': 'ci_session=6c0fcaf4599389035573c1a4171e5a8fb5c97331'
    };
    var request = http.MultipartRequest('POST', Uri.parse('${baseUrl}apiCustomerSupport'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var result=
      await response.stream.bytesToString();
      var finalresult= jsonDecode(result);

      if(finalresult['status']==true){

        setState(() {
          mobilee=finalresult['data']['user_number'];
          emaill=finalresult['data']['email'];
          isLoading=false;
        });
      }
      else{

        setState(() {
          isLoading=false;
        });

      }
    }
    else {
      print(response.reasonPhrase);
    }
  }
  _makePhoneCall(String phoneNumber) async {
    if (await canLaunch(phoneNumber)) {
      await launch(phoneNumber);
    } else {
      throw 'Could not launch $phoneNumber';
    }
  }
  _sendEmail(String emailAddress) async {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: emailAddress,
    );

    if (await canLaunch(emailLaunchUri.toString())) {
      await launch(emailLaunchUri.toString());
    } else {
      throw 'Could not launch $emailAddress';
    }
  }

}
