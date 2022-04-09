import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rayan/control/homecontroller.dart';
import 'package:rayan/view/auth/widget/themeWst.dart';
import 'package:rayan/view/other/homeMainScreens/widget_winner.dart';
import 'package:rayan/view/other/widget/design_appbar.dart';

class detailsWinner extends StatelessWidget {
  homecontroller controller = Get.put(homecontroller());
  @override
  Widget build(BuildContext context) {
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
            rowAppbar(context),
            Container(
              margin: EdgeInsets.only(left: 20, right: 20),
              child: Row(
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed("homePage");
                      },
                      icon: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      )),
                  Text(
                      "الرابحين" +
                          "/" +
                          " ${controller.saveListWinner[controller.indexWinner]['fullName']}",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontFamily: 'Almarai')),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      child: Image.asset(
                        "assets/images/1.png",
                        height: 75,
                        width: 75,
                      ),
                    ),
                  ),
                  Expanded(
                      flex: 2,
                      child: Column(
                        children: [
                          Container(
                            child: Text(
                                "${controller.saveListWinner[controller.indexWinner]['fullName']}",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 17,
                                    fontFamily: 'Almarai')),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              Image.asset(
                                "assets/images/Syriaicon.png",
                                height: 20,
                                width: 20,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                  "${controller.saveListWinner[controller.indexWinner]['countryDescAr']}",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontFamily: 'Almarai'))
                            ],
                          )
                        ],
                      )),
                  Expanded(
                      flex: 1,
                      child: Container(
                        child: Column(
                          children: [
                            Image.asset(
                              "assets/images/trophy.png",
                              height: 41,
                              width: 41,
                            ),
                            Text(
                                "${controller.saveListWinner[controller.indexWinner]['awardAmount']}",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 17,
                                    fontFamily: 'Almarai'))
                          ],
                        ),
                      )),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text("من أنا ؟",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontFamily: 'Almarai')),
            ), /*
            Padding(
              padding: const EdgeInsets.only(right: 20, left: 20),
              child: Text("${controller.saveListWinner[controller.indexWinner]['descrition']}",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontFamily: 'Almarai')),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text("كيف ربحت ؟",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontFamily: 'Almarai')),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20, left: 20),
              child: Text("${controller.saveListWinner[controller.indexWinner]['descrition']}",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontFamily: 'Almarai')),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text("كيف أشحن رصيد داخل التطبيق ؟",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontFamily: 'Almarai')),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20, left: 20),
              child: Text("${controller.saveListWinner[controller.indexWinner]['descrition']}",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontFamily: 'Almarai')),
            ),*/
          ],
        )
      ],
    ));
  }
}
