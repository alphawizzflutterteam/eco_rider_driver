import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Api services/api_services/apiBasehelper.dart';
import '../../Api services/api_services/apiStrings.dart';
import '../../Helper/Colors.dart';
import '../../Helper/loadingwidget.dart';
import '../../Model/getTranjectionModel.dart';
import '../../Model/tranjectionModel.dart';
import '../auth/custumScreen.dart';

class Tranjection extends StatefulWidget {
  const Tranjection({Key? key}) : super(key: key);

  @override
  State<Tranjection> createState() => _TranjectionState();
}

class _TranjectionState extends State<Tranjection> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getTranjection();
  }
  @override
  Widget build(BuildContext context) {
    return   SafeArea(
      child: Scaffold(
        body:

        Stack(
          children: [

            customdecorationFORScr(context,"Wallet"),

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

                    Text("Wallet Balance",style: TextStyle(fontWeight: FontWeight.w500,color: AppColors.blackTemp,fontSize: 20),),
                    SizedBox(height: 5,),
                    Text("\u{20B9} ${balance??'0'} /-",style: TextStyle(color:  Colors.green,fontSize: 18),),

                    Column(
                        children: [
                          SizedBox(height: 20,),

                          Divider(color: AppColors.tabtextColor,),
                          SizedBox(height: 5,),
                          Row(
                            children: [
                              SizedBox(width: 20,),
                              Text("Transaction History",style: TextStyle(fontWeight: FontWeight.w500,color: AppColors.blackTemp,fontSize: 20),),
                            ],
                          ),
                          SizedBox(height: 10,),

                          !isLoading?
                          tranjectionList.isEmpty?Container(

                            height: MediaQuery.of(context).size.height/1.6,
                            width: MediaQuery.of(context).size.width,
                            child: Center(child: Text('Transaction History Not Found'),),
                          ):

                          Container(
                            height: MediaQuery.of(context).size.height/1.7,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 15,right: 15,bottom: 15),
                              child: ListView.builder(

                                shrinkWrap: true,
                                itemCount: tranjectionList.length,
                                itemBuilder: (context, index) {

                                  return
                                    Padding(
                                      padding: const EdgeInsets.only(bottom: 7),
                                      child: Container(
                                        height: 150,
                                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(13),

                                            border: Border.all(color: AppColors.primary,width: 1)
                                        ),

                                        child: Padding(
                                          padding: const EdgeInsets.all(10),
                                          child:   Column(

                                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                              children: [

                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Text("Transaction Type",style: TextStyle(fontWeight:FontWeight.bold,color: AppColors.tabtextColor,fontSize: 15),),
                                                    Spacer(),
                                                    SizedBox(
                                                        width: MediaQuery.of(context).size.width/2.3,
                                                        child: Align(
                                                          alignment: Alignment.topRight,
                                                          child: Text("${tranjectionList[index].gatewayName??""}",style: TextStyle(fontWeight:FontWeight.bold,color: AppColors.tabtextColor,fontSize: 15),

                                                            maxLines: 3,overflow: TextOverflow.ellipsis,
                                                          ),
                                                        )),
                                                  ],
                                                ),
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Text("Payment Type",style: TextStyle(fontWeight:FontWeight.bold,color: AppColors.tabtextColor,fontSize: 15),),
                                                    Spacer(),
                                                    SizedBox(
                                                        width: MediaQuery.of(context).size.width/2.3,
                                                        child: Align(
                                                          alignment: Alignment.topRight,
                                                          child: Text("${tranjectionList[index].gatewayName??""}",style: TextStyle(fontWeight:FontWeight.bold,color: AppColors.tabtextColor,fontSize: 15),

                                                            maxLines: 3,overflow: TextOverflow.ellipsis,
                                                          ),
                                                        )),
                                                  ],
                                                ),

                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Text("Transaction Amount",style: TextStyle(fontWeight:FontWeight.bold,color: AppColors.tabtextColor,fontSize: 15),),
                                                    Spacer(),
                                                    SizedBox(
                                                        width: MediaQuery.of(context).size.width/2.3,
                                                        child: Align(
                                                          alignment: Alignment.topRight,
                                                          child: Text("${tranjectionList[index].balance??""} /-",style: TextStyle(fontWeight:FontWeight.bold,color: AppColors.tabtextColor,fontSize: 15),

                                                            maxLines: 3,overflow: TextOverflow.ellipsis,
                                                          ),
                                                        )),
                                                  ],
                                                ),

                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Text("Transaction Date",style: TextStyle(fontWeight:FontWeight.bold,color: AppColors.tabtextColor,fontSize: 15),),
                                                    Spacer(),
                                                    SizedBox(
                                                        width: MediaQuery.of(context).size.width/2.3,
                                                        child: Align(
                                                          alignment: Alignment.topRight,
                                                          child: Text("${tranjectionList[index].txnDate??""}",style: TextStyle(fontWeight:FontWeight.bold,color: AppColors.tabtextColor,fontSize: 15),

                                                            maxLines: 3,overflow: TextOverflow.ellipsis,
                                                          ),
                                                        )),
                                                  ],
                                                ),

                                              ]),
                                        ),
                                      ),
                                    );

                                },),
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
  bool isLoading=false;
  var userId;
  var balance;
  List<TranjectionModelList> tranjectionList=[];
  Future<void> getTranjection() async {
    setState(() {
      isLoading=true;
    });
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    userId =prefs.getString('userId');
    var param={
      'user_id': userId.toString(),

    };

    apiBaseHelper.postAPICall(getTranjectionHistoryUrl,param ).then((getDta){

      if(getDta['status']==true){
        setState(() {
          balance=getDta['wallet'];
          tranjectionList=  GetTranjectionHistory.fromJson(getDta).data??[];
          setState(() {
            isLoading=false;
          });
        });

      }else{
        tranjectionList.clear();
        setState(() {
          isLoading=false;
        });


      }


    },);
  }
}
