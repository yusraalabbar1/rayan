import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rayan/control/homecontroller.dart';
import 'package:rayan/model/modeApi/modelMedia/setting_social_media.dart';
import 'package:rayan/model/modeApi/modelsCompt/allMemberCompitition.dart';
import 'package:rayan/model/modeApi/modelsCompt/model_compitition.dart';
import 'package:rayan/utils/constant/color.dart';
import 'package:rayan/view/auth/widget/themeWst.dart';
import 'package:rayan/view/other/widget/design_appbar.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_share/flutter_share.dart';

class infoCompet extends StatefulWidget {
  infoCompet({Key? key}) : super(key: key);

  @override
  State<infoCompet> createState() => _infoCompetState();
}

class _infoCompetState extends State<infoCompet> {
  homecontroller controller = Get.put(homecontroller());

  Future<void> share() async {
    await FlutterShare.share(
        title: 'شارك المسابقة',
        text: "${controller.nameComp}",
        linkUrl: 'https://flutter.dev/',
        chooserTitle: 'شارك ${controller.nameComp}');
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    allMemberCompitition(controller.saveidComp);
  }

  @override
  Widget build(BuildContext context) {
    homecontroller controller = Get.put(homecontroller());
    return Scaffold(
        body: Stack(
      children: [
        containerMaine(),
        Container(
          decoration: boxDecorationMain(),
        ),
        ListView(
          shrinkWrap: true,
          children: [
            // rowAppbar(context),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(19.0),
              child: Card(
                child: Stack(children: [
                  Container(
                    width: 352,
                    height: 123,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(
                                "http://212.24.108.54/wsaAdmin/images/${controller.saveImageComp}"),
                            fit: BoxFit.cover)),
                  ),
                  Container(
                      // width: 300,
                      height: 123,
                      color: Color(0xff141E34).withOpacity(0.6),
                      child: Row(
                        children: [
                          Expanded(
                              child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "${controller.nameComp}",
                                style: TextStyle(
                                    color: MyColors.color3,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                    fontFamily: 'Almarai'),
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              Center(
                                child: Text(
                                  controller.saveIsFinishComp == true
                                      ? "Contest is over".tr
                                      : "Vote now for the contest".tr,
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Almarai'),
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                controller.savecurrentTourName != null
                                    ? "${controller.savecurrentTourName}"
                                    : "Round has not started".tr,
                                style: TextStyle(
                                    color: MyColors.color3,
                                    fontSize: 14,
                                    fontFamily: 'Almarai'),
                              ),
                              SizedBox(
                                height: 5,
                              ),

                              // Row(
                              //   mainAxisAlignment: MainAxisAlignment.center,
                              //   children: [
                              //     Text(
                              //       "The remaining Time".tr,
                              //       style: TextStyle(
                              //           color: MyColors.color3,
                              //           fontSize: 14,
                              //           fontFamily: 'Almarai'),
                              //     ),
                              //     Text(
                              //       controller.savecurrentTourName == null
                              //           ? "Round has not started".tr
                              //           : "${controller.savecurrentTourTimeLimit}",
                              //       style: TextStyle(
                              //           color: MyColors.color3,
                              //           fontSize: 12,
                              //           fontFamily: 'Almarai'),
                              //     ),
                              //     Text(
                              //       "minute".tr,
                              //       style: TextStyle(
                              //           color: MyColors.color3,
                              //           fontSize: 11,
                              //           fontFamily: 'Almarai'),
                              //     ),
                              //   ],
                              // ),
                              SizedBox(
                                height: 5,
                              ),
                              // Text(
                              //   "صوت الآن في المسابقة",
                              //   style: TextStyle(
                              //       color: MyColors.color3,
                              //       fontSize: 14,
                              //       fontFamily: 'Almarai'),
                              // )
                            ],
                          )),
                          Expanded(
                              child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset("assets/images/trophy.png"),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                controller.monyrComp.toString(),
                                style: TextStyle(
                                    color: MyColors.color3,
                                    fontSize: 14,
                                    fontFamily: 'Almarai'),
                              )
                            ],
                          ))
                        ],
                      ))
                ]),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(19.0),
              child: Text(
                "${controller.nameComp}",
                style: TextStyle(
                    color: MyColors.color3,
                    fontSize: 17,
                    fontFamily: 'Almarai'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 23, right: 23, top: 5),
              child: Text(
                "${controller.discrpComp}",
                style: TextStyle(
                    color: MyColors.color3,
                    fontSize: 13,
                    fontFamily: 'Almarai'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(19.0),
              child: Text(
                "How do I recharge in app credit?".tr,
                style: TextStyle(
                    color: MyColors.color3,
                    fontSize: 17,
                    fontFamily: 'Almarai'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 23, right: 23, top: 5),
              child: Text(
                recharge,
                style: TextStyle(
                    color: MyColors.color3,
                    fontSize: 13,
                    fontFamily: 'Almarai'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(19.0),
              child: Container(
                height: 60,
                child: RaisedButton(
                  color: MyColors.color1,
                  elevation: 10,
                  splashColor: MyColors.color3,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                      side: BorderSide(color: MyColors.color1, width: 2)),
                  onPressed: () {
                    if (controller.saveIsFinishComp == true) {
                      AwesomeDialog(
                              context: context,
                              dialogType: DialogType.ERROR,
                              animType: AnimType.RIGHSLIDE,
                              headerAnimationLoop: true,
                              title: 'Error',
                              btnOkOnPress: () {},
                              body: Text(
                                  "Contest has expired,Can't participate".tr,
                                  style: TextStyle(
                                      color: MyColors.color3,
                                      fontSize: 14,
                                      fontFamily: 'Almarai')),
                              dialogBackgroundColor: MyColors.color2,
                              btnOkColor: MyColors.color1)
                          .show();
                    } else {
                      Navigator.of(context).pushNamed("personSub");
                    }
                  },
                  child: Text("Particpation".tr,
                      style: TextStyle(
                          color: MyColors.color3,
                          fontSize: 17,
                          fontFamily: 'Almarai')),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(19.0),
              child: Text(
                "Share the Contest".tr,
                style: TextStyle(
                    color: MyColors.color3,
                    fontSize: 17,
                    fontFamily: 'Almarai'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 19, right: 19),
              child: Container(
                height: 60,
                child: RaisedButton(
                  color: MyColors.color1,
                  elevation: 10,
                  splashColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  onPressed: () {
                    share();
                  },
                  child: Text("Share link social media".tr,
                      style: TextStyle(
                          color: MyColors.color3,
                          fontSize: 14,
                          fontFamily: 'Almarai')),
                ),
              ),
              // child: Row(
              //   children: [
              //     SizedBox(
              //       width: 5,
              //     ),
              //     Expanded(
              //       child: RaisedButton(
              //         color: MyColors.color1,
              //         elevation: 10,
              //         splashColor: Colors.white,
              //         shape: RoundedRectangleBorder(
              //           borderRadius: BorderRadius.circular(25),
              //         ),
              //         onPressed: () {
              //           share();
              //         },
              //         child: Text("فيسبوك",
              //             style: TextStyle(
              //                 color: MyColors.color3,
              //                 fontSize: 14,
              //                 fontFamily: 'Almarai')),
              //       ),
              //     ),
              //     SizedBox(
              //       width: 5,
              //     ),
              //     Expanded(
              //       child: RaisedButton(
              //         color: Color(0xff1FC176),
              //         elevation: 10,
              //         splashColor: MyColors.color3,
              //         shape: RoundedRectangleBorder(
              //           borderRadius: BorderRadius.circular(25),
              //         ),
              //         onPressed: () {
              //           share();
              //         },
              //         child: Text("واتساب",
              //             style: TextStyle(
              //                 color: MyColors.color3,
              //                 fontSize: 14,
              //                 fontFamily: 'Almarai')),
              //       ),
              //     ),
              //     SizedBox(
              //       width: 5,
              //     ),
              //     Expanded(
              //       child: RaisedButton(
              //         color: MyColors.color1,
              //         elevation: 10,
              //         splashColor: Colors.white,
              //         shape: RoundedRectangleBorder(
              //           borderRadius: BorderRadius.circular(25),
              //         ),
              //         onPressed: () {
              //           share();
              //         },
              //         child: Text("تلجرام",
              //             style: TextStyle(
              //                 color: MyColors.color3,
              //                 fontSize: 14,
              //                 fontFamily: 'Almarai')),
              //       ),
              //     ),
              //     SizedBox(
              //       width: 5,
              //     ),
              //   ],
              // ),
            ),
            SizedBox(
              height: 30,
            )
          ],
        )
      ],
    ));
  }
}
