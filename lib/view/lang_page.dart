import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rayan/control/homecontroller.dart';
import 'package:rayan/translation/app_languge_controller.dart';
import 'package:rayan/utils/constant/color.dart';
import 'package:rayan/view/auth/widget/themeWst.dart';

class langPage extends StatefulWidget {
  langPage({Key? key}) : super(key: key);

  @override
  State<langPage> createState() => _langPageState();
}

class _langPageState extends State<langPage> {
  // AppLanguage langControl = Get.put(AppLanguage());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // imageBackgroundContainer(),
          containerMaine(),
          Container(
            decoration: boxDecorationMain(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                wstContainer1(context),
                Container(
                  margin: const EdgeInsets.only(bottom: 60),
                  child: const Text(
                    "المحفظة الالكترونية الأشهر في الشرق الأوسط",
                    style: TextStyle(
                        fontSize: 12,
                        color: MyColors.color3,
                        fontFamily: 'Almarai'),
                  ),
                ),
                Center(
                  child: Text("اختر لغة التطبيق",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontFamily: 'Almarai')),
                ),
                SizedBox(
                  height: 8,
                ),
                Center(
                  child: Text("Choose The Language of the Applcation",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontFamily: 'Almarai')),
                ),
                SizedBox(
                  height: 20,
                ),
                Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: 130,
                        height: 50,
                        child:
                            GetBuilder<homecontroller>(builder: (controller) {
                          return (RaisedButton(
                            onPressed: () {
                              print('Button Clicked.');
                              // langControl.changeLanguage('en');
                              Get.updateLocale(Locale('en'));
                              Navigator.of(context).pushNamed("startPage");
                            },
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(25.0))),
                            child: Text(
                              "English",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontFamily: 'Almarai'),
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
                          width: 130,
                          height: 50,
                          child:
                              GetBuilder<homecontroller>(builder: (controller) {
                            return (RaisedButton(
                              onPressed: () {
                                print('Button Clicked.');
                                Get.updateLocale(Locale('ar'));
                                // langControl.changeLanguage('ar');
                                Navigator.of(context).pushNamed("startPage");
                              },
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(25.0))),
                              child: Text(
                                "العربية",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontFamily: 'Almarai'),
                              ),
                              textColor: Colors.white,
                              splashColor: Colors.white,
                              color: controller.i == 1
                                  ? Color(0xff464699)
                                  : Color.fromARGB(255, 131, 28, 131),
                            ));
                          })),
                      SizedBox(
                        height: 20,
                      ),
                    ]),
              ],
            ) /* add child content here */,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: EdgeInsets.only(bottom: 20),
              child: Text(
                "جميع الحقوق محفوظة لدى التطبيق 2021",
                style: TextStyle(
                    fontSize: 13,
                    color: MyColors.color3,
                    fontFamily: 'Almarai'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
