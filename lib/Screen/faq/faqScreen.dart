import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

import 'package:http/http.dart' as http;

import '../../Api services/api_services/apiConstants.dart';
import '../../Helper/Colors.dart';
import '../../Helper/loadingwidget.dart';
import '../../Model/faqModel.dart';
import '../auth/custumScreen.dart';

class FaqsScrr extends StatefulWidget {
  const FaqsScrr({Key? key}) : super(key: key);

  @override
  State<FaqsScrr> createState() => _FaqsScrrState();
}

class _FaqsScrrState extends State<FaqsScrr> {
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

            customdecorationFORScr(context,"FAQ"),

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
                        Text("FAQ",style: TextStyle(fontWeight: FontWeight.w500,color: AppColors.blackTemp,fontSize: 17),),
                      ],
                    ),

                    Column(
                        children: [


                          !isLoading?
                          Container(
                            padding: EdgeInsets.all(15),
                            height: MediaQuery.of(context).size.height/1.4,
                            child: ListView.builder(
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.only(bottom: 8,),
                                  child: faqTileDetails(
                                      question: "${faqList[index].title}", answer: '${faqList[index].description}', index: index+1),
                                );
                              },
                              itemCount: faqList.length,
                            ),
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
  int selected = -1;
  Widget faqTileDetails(
      {required String question, required String answer, required int index}) {
    return

      Column(
        children: [
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),),
            elevation: 1,
            child: Container(
              decoration: BoxDecoration(borderRadius:BorderRadius.circular(10),

                  color: AppColors.whiteTemp
              ),
              child: ListTile(
                onTap: () {
                  setState(() {
                    if (selected == index) {
                      selected = -1;
                    } else {
                      selected = index;
                    }
                  });
                },
                title: Text(
                  question,
                  style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),
                ),
                trailing: Icon(selected == index
                    ? Icons.keyboard_arrow_up
                    : Icons.keyboard_arrow_down),
              ),
            ),
          ),
          selected == index
              ? Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.symmetric(horizontal: 5),
              color: AppColors.faqanswerColor,
              child: Html(data: answer,)
          )
              : Container(),
        ],
      );
  }

  bool isLoading=false;
  FaqDataModel?faqDataModel;
  List<Faqllist> faqList=[];
  var getdataa;

  Future<void> getprivecy() async {


    setState(() {
      isLoading=true;
    });

    var headers = {
      'Cookie': 'ci_session=6c0fcaf4599389035573c1a4171e5a8fb5c97331'
    };
    var request = http.MultipartRequest('POST', Uri.parse('${baseUrl}apifaqs'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var result=
      await response.stream.bytesToString();
      var finalresult= jsonDecode(result);

      if(finalresult['status']==true){

        setState(() {
          faqList=FaqDataModel.fromJson(finalresult).data??[];
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
