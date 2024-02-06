import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Api services/api_services/apiBasehelper.dart';
import '../../Api services/api_services/apiStrings.dart';
import '../../Helper/Colors.dart';
import '../../Helper/loadingwidget.dart';
import '../../Model/bookingModel.dart';
import '../../Model/completebookingModel.dart';
import '../auth/custumScreen.dart';
import 'completeBookingDetails.dart';

class CompleateDelivScr extends StatefulWidget {
  const CompleateDelivScr({Key? key}) : super(key: key);

  @override
  State<CompleateDelivScr> createState() => _CompleateDelivScrState();
}

class _CompleateDelivScrState extends State<CompleateDelivScr> {
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      color: AppColors.primary,
      onRefresh: () async {
        getdeliveries();
      },
      child: ListView.builder(
        itemCount: 1,
        itemBuilder: (context, index) {
          return !isLoading
              ? Stack(
                  children: [

                    customdwithoutBackScr(context, "Complete Bookings List"),
                    Container(
                      margin: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.15),
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      decoration: const BoxDecoration(
                        color: Color(0xffF6F6F6),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                        ),
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
                            const Row(
                              children: [
                                Text(
                                  'Complete Bookings List',
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            TodayDeliverList.isEmpty
                                ? Container(
                                    height:
                                        MediaQuery.of(context).size.height / 2,
                                    width: MediaQuery.of(context).size.width,
                                    child: const Center(
                                      child: Text('Booking Not Found'),
                                    ),
                                  )
                                : Container(
                                    height: MediaQuery.of(context).size.height /
                                        1.5,
                                    child: ListView.builder(
                                      shrinkWrap: true,
                                      physics: const AlwaysScrollableScrollPhysics(),
                                      itemCount: TodayDeliverList.length ?? 0,
                                      itemBuilder: (context, index) {
                                        return Padding(
                                          padding: const EdgeInsets.only(bottom: 20),
                                          child: InkWell(
                                            onTap: () {

                                              Navigator.push(context, MaterialPageRoute(builder: (context) =>
                                                  BookingggDetails(compleateDeliver: TodayDeliverList[index]),));                                          },
                                            child: Card(
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(12.0),
                                              ),
                                              child: Container(
                                                // height: 300,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(15),
                                                  child:

                                                  Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceEvenly,
                                                      children: [
                                                        Row(
                                                          children: [


                                                            const Text(
                                                              'Booking Id - ',
                                                              style: TextStyle(
                                                                  fontSize: 15,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500),
                                                            ),
                                                            const Spacer(),
                                                            Text(
                                                              '${TodayDeliverList[index].bookingId}',
                                                              style: const TextStyle(
                                                                  fontSize: 15,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500),
                                                            ),
                                                          ],
                                                        ),
                                                        const SizedBox(
                                                          height: 5,
                                                        ),
                                                        Row(
                                                          children: [
                                                            const Text(
                                                              'Owner Name - ',
                                                              style: TextStyle(
                                                                  fontSize: 15,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500),
                                                            ),
                                                            const Spacer(),
                                                            Text(
                                                              '${TodayDeliverList[index].username}',
                                                              style: const TextStyle(
                                                                  fontSize: 15,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500),
                                                            ),
                                                          ],
                                                        ),
                                                        const SizedBox(
                                                          height: 5,
                                                        ),
                                                        Row(
                                                          children: [
                                                            const Text(
                                                              'Mobile - ',
                                                              style: TextStyle(
                                                                  fontSize: 15,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500),
                                                            ),
                                                            const Spacer(),
                                                            Text(
                                                              '${TodayDeliverList[index].mobile}',
                                                              style: const TextStyle(
                                                                  fontSize: 15,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500),
                                                            ),
                                                          ],
                                                        ),

                                                        const SizedBox(
                                                          height: 5,
                                                        ),
                                                        Row(
                                                          children: [
                                                            const Text(
                                                              'Email - ',
                                                              style: TextStyle(
                                                                  fontSize: 15,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500),
                                                            ),
                                                            const Spacer(),
                                                            Text(
                                                              '${TodayDeliverList[index].email}',
                                                              style: const TextStyle(
                                                                  fontSize: 15,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500),
                                                            ),
                                                          ],
                                                        ),

                                                        const SizedBox(
                                                          height: 5,
                                                        ),
                                                        Row(
                                                          children: [
                                                            const Text(
                                                              'Pickup Location - ',
                                                              style: TextStyle(
                                                                  fontSize: 15,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500),
                                                            ),
                                                            const Spacer(),
                                                            SizedBox(
                                                              width: MediaQuery.of(context).size.width/2.5,
                                                              child: Text(
                                                                '${TodayDeliverList[index].pickupAddress}',
                                                                style: const TextStyle(
                                                                    fontSize: 15,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500),overflow: TextOverflow.ellipsis,maxLines: 3,
                                                              ),
                                                            ),
                                                          ],
                                                        ),


                                                        const SizedBox(
                                                          height: 5,
                                                        ),
                                                        Row(
                                                          children: [
                                                            const Text(
                                                              'Dop Location - ',
                                                              style: TextStyle(
                                                                  fontSize: 15,
                                                                  fontWeight:
                                                                  FontWeight
                                                                      .w500),
                                                            ),
                                                            const Spacer(),
                                                            SizedBox(
                                                              width: MediaQuery.of(context).size.width/2.5,
                                                              child: Text(
                                                                '${TodayDeliverList[index].dropAddress}',
                                                                style: const TextStyle(
                                                                    fontSize: 15,
                                                                    fontWeight:
                                                                    FontWeight
                                                                        .w500),overflow: TextOverflow.ellipsis,maxLines: 3,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        // const SizedBox(
                                                        //   height: 5,
                                                        // ),
                                                        // Row(
                                                        //   children: [
                                                        //     const Text(
                                                        //       'In City/Out City - ',
                                                        //       style: TextStyle(
                                                        //           fontSize: 15,
                                                        //           fontWeight:
                                                        //               FontWeight
                                                        //                   .w500),
                                                        //     ),
                                                        //     const Spacer(),
                                                        //     Text(
                                                        //       '${TodayDeliverList[index].inOutCity}',
                                                        //       style: const TextStyle(
                                                        //           fontSize: 15,
                                                        //           fontWeight:
                                                        //               FontWeight
                                                        //                   .w500),
                                                        //     ),
                                                        //   ],
                                                        // ),
                                                        //
                                                        // const SizedBox(
                                                        //   height: 5,
                                                        // ),
                                                        // Row(
                                                        //   children: [
                                                        //     const Text(
                                                        //       'One Way/Two Way - ',
                                                        //       style: TextStyle(
                                                        //           fontSize: 15,
                                                        //           fontWeight:
                                                        //           FontWeight
                                                        //               .w500),
                                                        //     ),
                                                        //     const Spacer(),
                                                        //     Text(
                                                        //       '${TodayDeliverList[index].oneTowWay}',
                                                        //       style: const TextStyle(
                                                        //           fontSize: 15,
                                                        //           fontWeight:
                                                        //           FontWeight
                                                        //               .w500),
                                                        //     ),
                                                        //   ],
                                                        // ),
                                                        // const SizedBox(
                                                        //   height: 5,
                                                        // ),
                                                        // Row(
                                                        //   children: [
                                                        //     const Text(
                                                        //       'Booking Date - ',
                                                        //       style: TextStyle(
                                                        //           fontSize: 15,
                                                        //           fontWeight:
                                                        //           FontWeight
                                                        //               .w500),
                                                        //     ),
                                                        //     const Spacer(),
                                                        //     Text(
                                                        //       '${TodayDeliverList[index].pickupDate}',
                                                        //       style: const TextStyle(
                                                        //           fontSize: 15,
                                                        //           fontWeight:
                                                        //           FontWeight
                                                        //               .w500),
                                                        //     ),
                                                        //   ],
                                                        // ),
                                                        //
                                                        // const SizedBox(
                                                        //   height: 5,
                                                        // ),
                                                        // Row(
                                                        //   children: [
                                                        //     const Text(
                                                        //       'Booking Time - ',
                                                        //       style: TextStyle(
                                                        //           fontSize: 15,
                                                        //           fontWeight:
                                                        //           FontWeight
                                                        //               .w500),
                                                        //     ),
                                                        //     const Spacer(),
                                                        //     Text(
                                                        //       '${TodayDeliverList[index].pickupTime}',
                                                        //       style: const TextStyle(
                                                        //           fontSize: 15,
                                                        //           fontWeight:
                                                        //           FontWeight
                                                        //               .w500),
                                                        //     ),
                                                        //   ],
                                                        // ),
                                                        //
                                                        // const SizedBox(
                                                        //   height: 5,
                                                        // ),
                                                        // Row(
                                                        //   children: [
                                                        //     const Text(
                                                        //       'Total Amount - ',
                                                        //       style: TextStyle(
                                                        //           fontSize: 15,
                                                        //           fontWeight:
                                                        //               FontWeight
                                                        //                   .w500),
                                                        //     ),
                                                        //     const Spacer(),
                                                        //     Text(
                                                        //       'RS ${TodayDeliverList[index].amount}/-',
                                                        //       style: const TextStyle(
                                                        //           fontSize: 15,
                                                        //           fontWeight:
                                                        //               FontWeight
                                                        //                   .w500),
                                                        //     ),
                                                        //   ],
                                                        // ),
                                                        const SizedBox(
                                                          height: 5,
                                                        ),
                                                        Row(
                                                          children: [
                                                            const Text(
                                                              'Total Amount - ',
                                                              style: TextStyle(
                                                                  fontSize: 15,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500),
                                                            ),
                                                            const Spacer(),
                                                            Text(
                                                              '${TodayDeliverList[index].amount}/-',
                                                              style: const TextStyle(
                                                                  fontSize: 15,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500),
                                                            ),
                                                          ],
                                                        ),
                                                      ]),
                                                ),
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  )
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              : Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: Center(
                    child: LoadingWidget2(context),
                  ),
                );
        },
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getdeliveries();
  }

  bool isLoading = false;

  List<CompleateDeliverList> TodayDeliverList = [];
  var userId;
  Future<void> getdeliveries() async {
    setState(() {
      isLoading = true;
    });

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    userId = prefs.getString('userId');
    var param = {'driver_id': '${userId.toString()}'};
    apiBaseHelper.postAPICall(getcompletebookingUrl, param).then((getDta) {
      bool error = getDta['status'];
      if (error == true) {
        setState(() {
          TodayDeliverList = CompleteBookingModel.fromJson(getDta).data ?? [];
          setState(() {
            isLoading = false;
          });
        });
      } else {
        setState(() {
          isLoading = false;
        });
      }
    });
  }
}
