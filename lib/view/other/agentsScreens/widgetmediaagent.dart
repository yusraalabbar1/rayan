import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:rayan/control/homecontroller.dart';
import 'package:rayan/model/modeApi/modelAgent/agents_details.dart';
import 'package:rayan/model/modeApi/modelAgent/api_all_agents.dart';

bool isNumeric(String s) {
  if (s == null) {
    return false;
  }
  return double.tryParse(s) != null;
}

Widget widgetmediaagent(context, i) {
  homecontroller controller = Get.put(homecontroller());
  return controller.saveMediaAgents.length > 0
      ? Container(
          // color: Colors.white,
          // height: 200,
          width: MediaQuery.of(context).size.width,
          child: GetBuilder<homecontroller>(builder: (controller) {
            return (GridView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              physics: ScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
              ),
              itemCount: controller.saveMediaAgents.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 19, right: 19),
                  child: Row(
                    children: [
                      Expanded(
                        child: RaisedButton(
                          color: Colors.primaries[
                              Random().nextInt(Colors.primaries.length)],
                          elevation: 10,
                          splashColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                          onPressed: () async {
                            var link =
                                controller.saveMediaAgents[index]["value"];

                            // if (isNumeric(link)) {
                            //   launch(('tel://${link}'));
                            // } else {
                            //   launch(link);
                            // }

                            if (controller.saveMediaAgents[index]
                                        ["mediaTypeArDesc"] ==
                                    "واتساب" ||
                                controller.saveMediaAgents[index]
                                        ["mediaTypeEnDesc"] ==
                                    "WhatsApp") {
                              await launch('whatsapp://send?phone=${link}');
                            } else if (controller.saveMediaAgents[index]
                                        ["mediaTypeArDesc"] ==
                                    "اتصال" ||
                                controller.saveMediaAgents[index]
                                        ["mediaTypeEnDesc"] ==
                                    "Telephone") {
                              launch(('tel://${link}'));
                            } else {
                              launch(link);
                            }
                          },
                          child: Text(
                              controller.saveMediaAgents[index]
                                      ["mediaTypeArDesc"]
                                  .toString(),
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 11,
                                  fontFamily: 'Almarai')),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ));
          }))
      : Padding(
          padding: const EdgeInsets.only(left: 30, right: 30, top: 19),
          child: Container(
            child: Text("لا يوجد وسائل تواصل حاليا",
                style: TextStyle(
                    color: Colors.white, fontSize: 13, fontFamily: 'Almarai')),
          ),
        );
}
