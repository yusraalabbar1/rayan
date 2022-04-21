import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rayan/control/homecontroller.dart';
import 'package:rayan/model/modeApi/balance/userBalancLog.dart';
import 'package:rayan/utils/constant/color.dart';

Widget widgetRigerter2moy() {
  return Padding(
      padding: const EdgeInsets.all(15.0),
      child: GetBuilder<homecontroller>(builder: (controller) {
        return (ListView.builder(
            // reverse: true,
            itemCount: recived.length,
            itemBuilder: (context, index) {
              int itemCount = recived.length;
              int reversedIndex = itemCount - 1 - index;
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    InkWell(
                        onTap: (() {
                          // controller.SaveindexCopititon(index);
                          // Navigator.of(context).pushNamed("infoVote");
                        }),
                        child: Column(
                          children: [
                            Container(
                              alignment: Alignment.topRight,
                              child: Text(
                                  "${recived[reversedIndex]['message']}",
                                  style: TextStyle(
                                      color: Colors.white,
                                      height: 1.5,
                                      fontSize: 12,
                                      fontFamily: 'Almarai')),
                            ),
                            Container(
                              alignment: Alignment.topRight,
                              child: Row(
                                children: [
                                  Text("التاريخ:",
                                      style: TextStyle(
                                          color: MyColors.color1,
                                          height: 1.5,
                                          fontSize: 12,
                                          fontFamily: 'Almarai')),
                                  Text(
                                      " ${recived[reversedIndex]['createDate']}"
                                          .substring(0, 10),
                                      style: TextStyle(
                                          color: MyColors.color1,
                                          height: 1.5,
                                          fontSize: 12,
                                          fontFamily: 'Almarai')),
                                  Text("  الوقت:",
                                      style: TextStyle(
                                          color: MyColors.color1,
                                          height: 1.5,
                                          fontSize: 12,
                                          fontFamily: 'Almarai')),
                                  Text(
                                      " ${recived[reversedIndex]['createDate']}"
                                          .substring(12, 20),
                                      style: TextStyle(
                                          color: MyColors.color1,
                                          height: 1.5,
                                          fontSize: 12,
                                          fontFamily: 'Almarai')),
                                ],
                              ),
                            ),
                          ],
                        )),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      height: 2,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: [
                                Color.fromARGB(255, 32, 53, 104),
                                Color(0xff414D72)
                              ]),
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                    )
                  ],
                ),
              );
            }));
      }));
}
