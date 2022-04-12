import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rayan/control/homecontroller.dart';
import 'package:rayan/model/modeApi/modelsCompt/add_member_compittion.dart';
import 'package:rayan/model/modeApi/modelsCompt/allMemberCompitition.dart';
import 'package:rayan/utils/constant/color.dart';
import 'package:rayan/view/auth/widget/themeWst.dart';
import 'package:rayan/view/other/setting/profile/widgetRowForProfil.dart';
import 'package:rayan/view/other/setting/profile/widgetrowOfLinkSocialMedia.dart';

class personSub extends StatelessWidget {
  final formstate = GlobalKey<FormState>();

  homecontroller controller = Get.put(homecontroller());
  @override
  Widget build(BuildContext context) {
    var nameFake;
    return Scaffold(
        body: Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: MyColors.color2,
        ),
        Container(
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                expandedHeight: 230,
                elevation: 0.0,
                backgroundColor: Colors.transparent,
              ),
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    Stack(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height,
                          width: MediaQuery.of(context).size.width,
                          color: Colors.transparent,
                        ),
                        Column(
                          children: [
                            Container(
                              height: 40,
                              width: MediaQuery.of(context).size.width,
                              color: Colors.transparent,
                            ),
                            Container(
                              color: MyColors.color2,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: MediaQuery.of(context).size.height,
                                    width: MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(40),
                                        topLeft: Radius.circular(40),
                                      ),
                                      image: DecorationImage(
                                        image: AssetImage(
                                            "assets/images/background.png"),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          height: 60,
                                        ),
                                        Text(
                                          "${controller.nameComp}",
                                          style: TextStyle(
                                              color: MyColors.color3,
                                              fontSize: 20,
                                              fontFamily: 'Almarai'),
                                        ),
                                        SizedBox(
                                          height: 30,
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(
                                              left: 30, right: 30),
                                          alignment: Alignment.centerRight,
                                          child: Text(
                                            "Nick name".tr,
                                            style: TextStyle(
                                                color: MyColors.color3,
                                                fontSize: 14,
                                                fontFamily: 'Almarai'),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 30,
                                              right: 30,
                                              bottom: 20,
                                              top: 20),
                                          child: Form(
                                            key: formstate,
                                            child: GetBuilder<homecontroller>(
                                                builder: (controller) {
                                              return (TextFormField(
                                                style: const TextStyle(
                                                    color: MyColors.color3),
                                                validator: (text) {
                                                  if (text!.length > 40) {
                                                    return "can not enter bigest than 40";
                                                  }
                                                  if (text.length < 2) {
                                                    return "can not enter less than 2";
                                                  }
                                                  return null;
                                                },
                                                decoration:
                                                    const InputDecoration(
                                                  hintText: 'حسام الأحمد',
                                                ),
                                                onSaved: (string) {
                                                  nameFake = string;
                                                  controller.SavenameFake(
                                                      string);
                                                },
                                              ));
                                            }),
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Column(
                                              children: [
                                                Container(
                                                  width: 50.0,
                                                  height: 50.0,
                                                  decoration: new BoxDecoration(
                                                    color: Colors.black,
                                                    shape: BoxShape.circle,
                                                    border: Border.all(
                                                      color: Color(
                                                          0xff464699), //                   <--- border color
                                                      width: 5.0,
                                                    ),
                                                  ),
                                                  child: Center(
                                                    child: Text(
                                                      "${lengthMemberComp}",
                                                      style: TextStyle(
                                                          color:
                                                              MyColors.color3,
                                                          fontSize: 14,
                                                          fontFamily:
                                                              'Almarai'),
                                                    ),
                                                  ),
                                                ),
                                                Text("Number of contestant".tr,
                                                    style: TextStyle(
                                                        color: MyColors.color3,
                                                        fontSize: 12,
                                                        fontFamily: 'Almarai'))
                                              ],
                                            ),
                                            Column(
                                              children: [
                                                Container(
                                                  width: 50.0,
                                                  height: 50.0,
                                                  decoration: new BoxDecoration(
                                                    color: Colors.black,
                                                    shape: BoxShape.circle,
                                                    border: Border.all(
                                                      color: MyColors
                                                          .color1, //                   <--- border color
                                                      width: 5.0,
                                                    ),
                                                  ),
                                                  child: Center(
                                                    child: Text(
                                                      "${controller.saveamount}",
                                                      style: TextStyle(
                                                          color:
                                                              MyColors.color3,
                                                          fontSize: 14,
                                                          fontFamily:
                                                              'Almarai'),
                                                    ),
                                                  ),
                                                ),
                                                Text("Particpation".tr,
                                                    style: TextStyle(
                                                        color: MyColors.color3,
                                                        fontSize: 12,
                                                        fontFamily: 'Almarai'))
                                              ],
                                            )
                                          ],
                                        ),
                                        Container(
                                          width: double.infinity,
                                          height: 60,
                                          margin: const EdgeInsets.only(
                                              bottom: 10,
                                              right: 30,
                                              left: 30,
                                              top: 30),
                                          child: RaisedButton(
                                            color: MyColors.color1,
                                            elevation: 10,
                                            splashColor: MyColors.color3,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(25),
                                                side: BorderSide(
                                                    color: MyColors.color1,
                                                    width: 2)),
                                            onPressed: () {
                                              var formdata =
                                                  formstate.currentState;
                                              if (formdata!.validate()) {
                                                formdata.save();
                                                //////////////////////////
                                                addMemberCompitition(context,
                                                    controller.nameFake);
                                              } else {
                                                print(
                                                    "not validddddddddddddddd");
                                              }
                                            },
                                            child: Text(
                                              "Particpation".tr,
                                              style: TextStyle(
                                                  fontSize: 13,
                                                  color: MyColors.color3,
                                                  fontFamily: 'Almarai'),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Positioned(
                          // left: 46,
                          top: 0.0,
                          left: (MediaQuery.of(context).size.width) / 2 - 31,

                          // (background container size) - (circle height / 2)
                          child: Center(
                            child: Container(
                              child: InkWell(
                                child: Image.asset(
                                  "assets/images/1.png",
                                  height: 84.0,
                                  width: 84.0,
                                ),
                              ),
                              height: 84.0,
                              width: 84.0,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: MyColors.color2),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    ));
  }
}

Widget buildSliverAppBar() {
  return SliverAppBar(
    expandedHeight: 350,
    elevation: 0.0,
    flexibleSpace: FlexibleSpaceBar(
      centerTitle: true,
      background: Hero(
        tag: 1,
        child: Container(
          color: Colors.transparent,
        ),
      ),
    ),
  );
}
