import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rayan/control/homecontroller.dart';
import 'package:rayan/model/modeApi/modelsCompt/add_member_compittion.dart';
import 'package:rayan/model/modeApi/modelsCompt/allMemberCompitition.dart';
import 'package:rayan/utils/constant/color.dart';
import 'package:rayan/view/other/home_page.dart';

class completPersonSub extends StatelessWidget {
  const completPersonSub({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    homecontroller controller = Get.put(homecontroller());
    var nameFake;

    return Scaffold(
        body: Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: MyColors.color2,
        ),
        ListView(
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 2,
              width: MediaQuery.of(context).size.width,
              color: Colors.transparent,
            ),
            Container(
                // margin: EdgeInsets.all(15),
                height: 330,
                width: MediaQuery.of(context).size.width,
                child: Stack(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          height: 30,
                          width: MediaQuery.of(context).size.width,
                          color: Colors.transparent,
                        ),
                        Expanded(
                          child: Container(
                              height: MediaQuery.of(context).size.height / 2,
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
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    height: 40,
                                  ),
                                  Text(
                                    "${controller.nameComp}",
                                    style: TextStyle(
                                        color: MyColors.color3,
                                        fontSize: 20,
                                        fontFamily: 'Almarai'),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                      "Welcom".tr +
                                          " " +
                                          "${controller.nameFake}",
                                      style: TextStyle(
                                          color: MyColors.color3,
                                          fontSize: 19,
                                          fontFamily: 'Almarai')),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Text("Your Voting Number".tr,
                                          style: TextStyle(
                                              color: MyColors.color3,
                                              fontSize: 14,
                                              fontFamily: 'Almarai')),
                                      GetBuilder<homecontroller>(
                                          builder: (controller) {
                                        return (Text(
                                            controller.saveMemberIdCompt
                                                .toString(),
                                            style: TextStyle(
                                                color: MyColors.color3,
                                                fontSize: 18,
                                                fontFamily: 'Almarai')));
                                      }),
                                      RaisedButton(
                                        color: MyColors.color1,
                                        splashColor: MyColors.color3,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(25),
                                            side: BorderSide(
                                                color: MyColors.color1,
                                                width: 2)),
                                        onPressed: () {},
                                        child: Text("Share link".tr,
                                            style: TextStyle(
                                                color: MyColors.color3,
                                                fontSize: 14,
                                                fontFamily: 'Almarai')),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Text("has been discount".tr,
                                          style: TextStyle(
                                              color: MyColors.color3,
                                              fontSize: 14,
                                              fontFamily: 'Almarai')),
                                      Text(
                                        "${controller.saveamount}",
                                        style: TextStyle(
                                            color: MyColors.color3,
                                            fontSize: 14,
                                            fontFamily: 'Almarai'),
                                      ),
                                      Text(
                                          "Subscription fee from your wallet"
                                              .tr,
                                          style: TextStyle(
                                              color: MyColors.color3,
                                              fontSize: 14,
                                              fontFamily: 'Almarai'))
                                    ],
                                  ),
                                  Container(
                                    width: double.infinity,
                                    height: 44,
                                    margin: const EdgeInsets.only(
                                        bottom: 10,
                                        right: 30,
                                        left: 30,
                                        top: 10),
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
                                        Navigator.of(context)
                                            .pushNamed("homePage");
                                      },
                                      child: Text(
                                        "Back".tr,
                                        style: TextStyle(
                                            fontSize: 13,
                                            color: MyColors.color3,
                                            fontFamily: 'Almarai'),
                                      ),
                                    ),
                                  ),
                                ],
                              )),
                        )
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
                              shape: BoxShape.circle, color: Color(0xff1C2948)),
                        ),
                      ),
                    )
                  ],
                ))
          ],
        ),
      ],
    ));
  }
}
