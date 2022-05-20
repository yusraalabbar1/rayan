import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rayan/model/pref/prefLog.dart';
import 'package:rayan/view/auth/page/welcom.dart';
import 'package:rayan/view/other/agentsScreens/part2agent.dart';
import 'package:rayan/view/other/folderEmpty/file_empty.dart';
import 'package:rayan/view/other/homeMainScreens/notification_page.dart';
import 'package:rayan/view/other/setting/aboutUs.dart';
import 'package:rayan/view/other/setting/privecy.dart';
import 'package:rayan/view/other/setting/terms.dart';
import 'package:rayan/control/homecontroller.dart';
import 'package:rayan/thems.dart';
import 'package:rayan/translation/translation.dart';
import 'package:rayan/view/auth/page/forgetPassword/cofirm_code.dart';
import 'package:rayan/view/auth/page/signup/complet_signup.dart';
import 'package:rayan/view/auth/page/signup/final_signup.dart';
import 'package:rayan/view/auth/page/forgetPassword/pin_code_password.dart';
import 'package:rayan/view/auth/page/signup/start_signup.dart';
import 'package:rayan/view/auth/page/login/old_login.dart';
import 'package:rayan/view/auth/page/forgetPassword/password_new.dart';
import 'package:rayan/view/auth/page/forgetPassword/reset_code_password.dart';
import 'package:rayan/view/auth/page/signup/signup.dart';
import 'package:rayan/view/auth/page/start_page.dart';
import 'package:rayan/view/init_page.dart';
import 'package:rayan/view/lang_page.dart';
import 'package:rayan/view/other/gaust/gaust.dart';
import 'package:rayan/view/other/homeMainScreens/send/complet_send_money.dart';
import 'package:rayan/view/other/homeMainScreens/send/sendMony.dart';
import 'package:rayan/view/other/home_page.dart';
import 'package:rayan/view/other/register1Screens/register1_main.dart';
import 'package:rayan/view/other/setting/notification/sitting_notification.dart';
import 'package:rayan/view/other/setting/profile/sitting_profile.dart';
import 'package:rayan/view/other/setting/question.dart';
import 'package:rayan/view/other/setting/secutity/sitting_security.dart';

import 'view/auth/page/forgetPassword/email_for_forgetpassword.dart';
import 'view/auth/page/signup/Pin_code_verification_screen.dart';

class MyApp extends StatelessWidget {
  homecontroller controller = Get.put(homecontroller());
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      //isStart == true ? welcom() : initPage(),
      home: isStart == true ? welcom() : initPage(),
      theme: CustomTheme.lightTheme,
      routes: {
        "welcom": ((context) => welcom()),
        "initPage": ((context) => initPage()),
        "langPage": ((context) => langPage()),
        "startPage": ((context) => startPage()),
        "login": ((context) => login()),
        "signup": ((context) => signup()),
        "completSignUp": ((context) => completSignUp()),
        "passwordNew": ((context) => passwordNew()),
        "finalLogin": ((context) => finalLogin()),
        "oldLogin": ((context) => oldLogin()),
        "resetCodePassword": ((context) => resetCodePassword()),
        "confirmCodeUsingMobile": ((context) => confirmCodeUsingMobile()),
        "homePage": ((context) => homePage()),
        "pinPassword": ((context) => pinPassword()),
        "PinCodeVerificationScreen": ((context) => PinCodeVerificationScreen()),
        "emailForForgetPassword": ((context) => emailForForgetPassword()),
        "sittingProfile": ((context) => sittingProfile()),
        "sittingSecurity": ((context) => sittingSecurity()),
        "sittingNotification": ((context) => sittingNotification()),
        "competitionsMain": ((context) => pageEmpty()),
        "sendMony": ((context) => sendMony()),
        "CompletsendMoney": ((context) => CompletsendMoney()),
        "register1Main": ((context) => register1Main()),
        "question": ((context) => const questionComm()),
        "gaust": ((context) => gaust()),
        "terms": ((context) => terms()),
        "notificationPage": ((context) => notificationPage()),
        "about": ((context) => about()),
        "agentDet": ((context) => agentDet()),
        "privecy": ((context) => privecy()),
      },

      translations: Translation(),
      locale: isStart == true ? Locale('ar') : Locale('ar'),
      fallbackLocale: Locale('en'),
    );
  }

  monthly() {}
}
