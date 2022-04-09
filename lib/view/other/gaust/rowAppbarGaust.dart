import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rayan/control/homecontroller.dart';
import 'package:rayan/utils/constant/color.dart';
import 'package:rayan/view/auth/widget/themeWst.dart';

Row rowAppbarGaust(context) {
  homecontroller controller = Get.put(homecontroller());
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Container(
        margin: EdgeInsets.all(20),
        child: Row(
          children: [
            InkWell(
              child: GetBuilder<homecontroller>(builder: (controller) {
                return (Container(
                  alignment: Alignment.topRight,
                  width: 44,
                  height: 44,
                  child: CircleAvatar(
                    radius: 50,
                    backgroundColor: MyColors.color1,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Icon(Icons.image_not_supported)),
                  ),
                ));
              }),
              onTap: () {
                Scaffold.of(context).openDrawer();
              },
            ),
            SizedBox(
              width: 5,
            ),
            Icon(
              Icons.notifications,
              size: 35,
              color: Colors.white,
            ),
          ],
        ),
      ),
      logoContainer(context),
    ],
  );
}
