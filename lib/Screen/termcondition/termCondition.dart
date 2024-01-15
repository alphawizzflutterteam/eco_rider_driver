import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:http/http.dart' as http;

import '../../Api services/api_services/apiConstants.dart';
import '../../Helper/Colors.dart';
import '../../Helper/loadingwidget.dart';
import '../auth/custumScreen.dart';

class TermsConditionScrr extends StatefulWidget {
  const TermsConditionScrr({Key? key}) : super(key: key);

  @override
  State<TermsConditionScrr> createState() => _TermsConditionScrrState();
}

class _TermsConditionScrrState extends State<TermsConditionScrr> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getprivecy();
  }
  @override
  Widget build(BuildContext context) {
    return   SafeArea(
      child: Scaffold(
        body:

        Stack(
          children: [

            customdecorationFORScr(context,"Term & Conditions"),

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
                    SizedBox(height: 20,),

                    Row(
                      children: [
                        SizedBox(width: 20,),
                        Text("Term & Conditions",style: TextStyle(fontWeight: FontWeight.w500,color: AppColors.blackTemp,fontSize: 17),),
                      ],
                    ),

                    Column(
                        children: [
                          SizedBox(height: 20,),

                          Divider(color: AppColors.tabtextColor,),

                          !isLoading?
                          Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 15),
                              child:
                              Html(
                                data:'${getdataa}',
                              )

                          )
                              :


                          Container(
                              height: MediaQuery.of(context).size.height/2,
                              child: Center(child: LoadingWidget2(context))),

                        ]
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
  bool isLoading=false;
  var getdataa;


  Future<void> getprivecy() async {


    setState(() {
      isLoading=true;
    });

    var headers = {
      'Cookie': 'ci_session=6c0fcaf4599389035573c1a4171e5a8fb5c97331'
    };
    var request = http.MultipartRequest('POST', Uri.parse('${baseUrl}apiterms_and_conditions'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var result=
      await response.stream.bytesToString();
      var finalresult= jsonDecode(result);

      if(finalresult['status']==true){

        setState(() {
          getdataa=finalresult['data'][0]['description'];
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
}
