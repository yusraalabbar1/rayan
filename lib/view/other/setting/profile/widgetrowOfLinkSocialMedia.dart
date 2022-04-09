import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rayan/control/homecontroller.dart';
import 'package:rayan/model/modeApi/modelMedia/get_all_social.dart';
import 'package:rayan/view/other/setting/profile/dialogFace.dart';
import 'package:rayan/view/other/setting/profile/dialogInsta.dart';
import 'package:rayan/view/other/setting/profile/dialog_edit.dart';
import 'package:rayan/view/other/setting/profile/dialogtele.dart';

Widget widgetrowOfLinkSocialMedia(context) {
  homecontroller controller = Get.put(homecontroller());
  return Padding(
    padding: const EdgeInsets.all(15.0),
    child: Column(
      children: [
        Row(
          children: [
            Expanded(
                child: Container(
              alignment: Alignment.topRight,
              child: Text("انستغرام",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontFamily: 'Almarai')),
            )),
            Expanded(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                    alignment: Alignment.topLeft,
                    child: GetBuilder<homecontroller>(builder: (controller) {
                      return (Text(
                          controller.saveLinkInsta == ""
                              ? ""
                              : controller.saveLinkInsta,
                          style: TextStyle(
                              color: Color(0xff707070),
                              fontSize: 13,
                              fontFamily: 'Almarai')));
                    })),
                IconButton(
                    onPressed: () {
                      dialogForInsta(context);
                    },
                    icon: Icon(
                      Icons.navigate_next,
                      color: Colors.white,
                    ))
              ],
            )),
          ],
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
        ),
        Row(
          children: [
            Expanded(
                child: Container(
              alignment: Alignment.topRight,
              child: Text("فيسبوك",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontFamily: 'Almarai')),
            )),
            Expanded(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                    alignment: Alignment.topLeft,
                    child: GetBuilder<homecontroller>(builder: (controller) {
                      return (Text(
                          controller.saveLinkFace == ""
                              ? ""
                              : controller.saveLinkFace,
                          style: TextStyle(
                              color: Color(0xff707070),
                              fontSize: 13,
                              fontFamily: 'Almarai')));
                    })),
                IconButton(
                    onPressed: () {
                      dialogForFace(context);
                    },
                    icon: Icon(
                      Icons.navigate_next,
                      color: Colors.white,
                    ))
              ],
            )),
          ],
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
        ),
        Row(
          children: [
            Expanded(
                child: Container(
              alignment: Alignment.topRight,
              child: Text("تلجرام",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontFamily: 'Almarai')),
            )),
            Expanded(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                    alignment: Alignment.topLeft,
                    child: GetBuilder<homecontroller>(builder: (controller) {
                      return (Text(
                          controller.saveLinktele == ""
                              ? ""
                              : controller.saveLinktele,
                          style: TextStyle(
                              color: Color(0xff707070),
                              fontSize: 13,
                              fontFamily: 'Almarai')));
                    })),
                IconButton(
                    onPressed: () {
                      dialogForIeleg(context);
                    },
                    icon: Icon(
                      Icons.navigate_next,
                      color: Colors.white,
                    ))
              ],
            )),
          ],
        ),

        // Row(
        //   children: [
        //     Expanded(
        //         child: Container(
        //       alignment: Alignment.topRight,
        //       child: Text("الصورة الرئيسية",
        //           style: TextStyle(
        //               color: Colors.white,
        //               fontSize: 13,
        //               fontFamily: 'Almarai')),
        //     )),
        //     Expanded(
        //         child: Row(
        //       mainAxisAlignment: MainAxisAlignment.end,
        //       children: [
        //         Container(
        //           alignment: Alignment.topLeft,
        //           child: Text("تحديد",
        //               style: TextStyle(
        //                   color: Color(0xff707070),
        //                   fontSize: 13,
        //                   fontFamily: 'Almarai')),
        //         ),
        //         IconButton(
        //             onPressed: () {},
        //             icon: Icon(
        //               Icons.navigate_next,
        //               color: Colors.white,
        //             ))
        //       ],
        //     )),
        //   ],
        // ),
        // Container(
        //   height: 2,
        //   decoration: BoxDecoration(
        //       gradient: LinearGradient(
        //           begin: Alignment.centerLeft,
        //           end: Alignment.centerRight,
        //           colors: [
        //             Color.fromARGB(255, 32, 53, 104),
        //             Color(0xff414D72)
        //           ]),
        //       borderRadius: BorderRadius.all(Radius.circular(20))),
        // ),
        // Row(
        //   children: [
        //     Expanded(
        //         child: Container(
        //       alignment: Alignment.topRight,
        //       child: Text("صور أخرى",
        //           style: TextStyle(
        //               color: Colors.white,
        //               fontSize: 13,
        //               fontFamily: 'Almarai')),
        //     )),
        //     Expanded(
        //         child: Row(
        //       mainAxisAlignment: MainAxisAlignment.end,
        //       children: [
        //         Container(
        //           alignment: Alignment.topLeft,
        //           child: Text("تحديد",
        //               style: TextStyle(
        //                   color: Color(0xff707070),
        //                   fontSize: 13,
        //                   fontFamily: 'Almarai')),
        //         ),
        //         IconButton(
        //             onPressed: () {},
        //             icon: Icon(
        //               Icons.navigate_next,
        //               color: Colors.white,
        //             ))
        //       ],
        //     )),
        //   ],
        // ),
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
        ),
      ],
    ),
  );
}
