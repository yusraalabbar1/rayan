import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rayan/control/homecontroller.dart';
import 'package:rayan/view/other/homeMainScreens/widget_home.dart';

Widget towButtonRegister1() {
  homecontroller controller = Get.put(homecontroller());
  return Padding(
    padding: const EdgeInsets.only(top: 15, bottom: 15, right: 20, left: 20),
    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Container(
        width: 160,
        height: 67,
        child: GetBuilder<homecontroller>(builder: (controller) {
          return (RaisedButton(
            onPressed: () {
              print('Button Clicked.');
              controller.SaveIdPageCopititio(1);
            },
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(25.0))),
            child: Text(
              "Profits".tr,
              style: TextStyle(
                  color: Colors.white, fontSize: 14, fontFamily: 'Almarai'),
            ),
            textColor: Colors.white,
            splashColor: Colors.white,
            color: controller.i == 0
                ? Color(0xff464699)
                : Color.fromARGB(255, 131, 28, 131),
          ));
        }),
      ),
      SizedBox(
        height: 20,
      ),
      Container(
          width: 160,
          height: 67,
          child: GetBuilder<homecontroller>(builder: (controller) {
            return (RaisedButton(
              onPressed: () {
                print('Button Clicked.');
                controller.SaveIdPageCopititio(0);
              },
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(25.0))),
              child: Text(
                "Register".tr,
                style: TextStyle(
                    color: Colors.white, fontSize: 14, fontFamily: 'Almarai'),
              ),
              textColor: Colors.white,
              splashColor: Colors.white,
              color: controller.i == 1
                  ? Color(0xff464699)
                  : Color.fromARGB(255, 131, 28, 131),
            ));
          })),
    ]),
  );
}
