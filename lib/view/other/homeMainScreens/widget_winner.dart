import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';

import 'package:get/get.dart';
import 'package:rayan/control/homecontroller.dart';
import 'package:rayan/model/modeApi/modelLogin/login_model.dart';
import 'package:rayan/utils/constant/url.dart';

Widget widetWinner(context) {
  homecontroller controller = Get.put(homecontroller());
  return GetBuilder<homecontroller>(builder: (controller) {
    return (Container(
      // color: Colors.white,
      margin: EdgeInsets.only(left: 30, right: 30),
      height: 230,
      width: MediaQuery.of(context).size.width,

      child: controller.saveListWinner == null
          ? Text("loading..")
          : ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: controller.saveListWinner.length,
              itemBuilder: (context, index) {
                return GetBuilder<homecontroller>(builder: (controller) {
                  return (InkWell(
                    onTap: (() {
                      controller.SaveindexWinner(index);
                      // if (controller.saveListWinner[index]['fullName'] ==
                      //     fullName) {
                      //   Navigator.of(context).pushNamed("quistWinner");
                      // } else {
                      //   Navigator.of(context).pushNamed("detailsWinner");
                      // }
                    }),
                    child: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Stack(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  height: 30,
                                  width: 148,
                                  color: Colors.transparent,
                                ),
                                Expanded(
                                  child: Container(
                                    height: 161,
                                    width: 148,
                                    padding: EdgeInsets.only(top: 30),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.primaries[Random()
                                          .nextInt(Colors.primaries.length)],
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "${controller.saveListWinner[index]['fullName']}",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 12,
                                              fontFamily: 'Almarai'),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Image.network(
                                              baseUrlAdmin +
                                                  "/images/${controller.saveListWinner[index]['countryFlag']}",
                                              width: 20,
                                              height: 20,
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              "${controller.saveListWinner[index]['countryDescAr']}",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 9,
                                                  fontFamily: 'Almarai'),
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                          width: 105,
                                          height: 74,
                                          padding: EdgeInsets.all(8),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: Color(0xff1A1E2B)
                                                .withOpacity(0.5),
                                          ),
                                          child: Column(
                                            children: [
                                              Image.asset(
                                                  "assets/images/trophy.png"),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                "${controller.saveListWinner[index]['awardAmount']}",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 18,
                                                    fontFamily: 'Almarai'),
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                            Positioned(
                              left: 46,
                              top: 0.0,
                              // (background container size) - (circle height / 2)
                              child: Center(
                                child: Container(
                                  child: InkWell(
                                    child: Container(
                                      height: 56,
                                      width: 56,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          image: DecorationImage(
                                            image: NetworkImage(controller
                                                                .saveListWinner[
                                                            index]
                                                        ['imageProfile'] ==
                                                    null
                                                ? "https://media.istockphoto.com/vectors/avatar-person-user-icon-blue-color-vector-id1216255389?k=20&m=1216255389&s=170667a&w=0&h=uklU-WnkSAvUCtqrB4vxbga1hfYfBWRcQQlEYKhhrdQ="
                                                : baseUrlAdmin +
                                                    "/images/${controller.saveListWinner[index]['imageProfile']}"),
                                            fit: BoxFit.cover,
                                          )),
                                    ),
                                    // child: Image.network(
                                    //   "http://212.24.108.54/wsaAdmin/images/${controller.saveListWinner[index]['imageProfile']}",
                                    //   height: 56.0,
                                    //   width: 56.0,
                                    // ),
                                  ),
                                  height: 56.0,
                                  width: 56.0,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Color(0xff1C2948)),
                                ),
                              ),
                            )
                          ],
                        )),
                  ));
                });
              }),
    ));
  });
}
