import 'dart:io';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rayan/control/homecontroller.dart';
import 'package:rayan/utils/constant/color.dart';
import 'package:rayan/view/auth/widget/themeWst.dart';
import 'package:rayan/view/other/homeMainScreens/widget_list_notification.dart';
import 'package:rayan/view/other/setting/profile/dialogInsta.dart';

Text title() {
  return Text(
    "WST",
    style: TextStyle(
        fontSize: 28,
        fontFamily: 'HELLO_DENVER_DISPLAY',
        fontWeight: FontWeight.bold,
        color: Colors.white),
  );
}

PickedFile? imageFile = null;
var _selected;

Row rowAppbar(context) {
  homecontroller controller = Get.put(homecontroller());
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Container(
        margin: EdgeInsets.all(20),
        child: Row(
          children: [
            InkWell(
              child: Builder(
                  builder: (context) =>
                      GetBuilder<homecontroller>(builder: (controller) {
                        return (Container(
                          alignment: Alignment.topRight,
                          width: 44,
                          height: 44,
                          child: CircleAvatar(
                            radius: 50,
                            backgroundColor: MyColors.color1,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: (controller.savePathImage == null)
                                  ? Icon(Icons.image_not_supported)
                                  : Image.network(
                                      controller.savePathImage,
                                      width: 44,
                                      height: 44,
                                      fit: BoxFit.fitHeight,
                                    ),
                            ),
                          ),
                        ));
                      })),
              onTap: () {
                Scaffold.of(context).openDrawer();
              },
            ),
            SizedBox(
              width: 5,
            ),
            /*  DropdownButtonHideUnderline(
              child: DropdownButton2<String>(
                dropdownWidth: 193,
                dropdownMaxHeight: 190,
                dropdownDecoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Color(0xff1C2948),
                  boxShadow: [
                    BoxShadow(spreadRadius: 0.8),
                  ],
                ),
                customButton: Icon(
                  Icons.notifications,
                  size: 35,
                  color: Colors.white,
                ),
                items: controller.saveListNotifications.map((Map map) {
                  return DropdownMenuItem<String>(
                    value: map["id"].toString(),
                    child: Column(
                      children: [
                        Text(
                          map["title"].toString(),
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 11,
                              fontFamily: 'Almarai'),
                          maxLines: 1,
                        ),
                        Text(
                          map["body"].toString(),
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 7,
                              fontFamily: 'Almarai'),
                          maxLines: 1,
                        ),
                        // leading: Icon(
                        //   Icons.notifications_active,
                        //   color: MyColors.color1,
                        // ),

                        SizedBox(
                          height: 3,
                        ),
                        Divider(
                          color: Colors.white,
                        )
                      ],
                    ),
                  );
                }).toList(),
                onChanged: (_) {},
              ),
            ),*/
          ],
        ),
      ),
      logoContainer(context),
    ],
  );
}
