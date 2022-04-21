import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rayan/model/modeApi/modelAgent/agent_info.dart';
import 'package:rayan/model/pref/prefLog.dart';
import 'package:rayan/view/auth/page/welcom.dart';
import 'package:rayan/view/other/agentsScreens/part2agent.dart';
import 'package:rayan/view/other/homeMainScreens/notification_page.dart';
import 'package:rayan/view/other/homeMainScreens/question_winer.dart';
import 'package:rayan/view/other/setting/aboutUs.dart';
import 'package:rayan/view/other/setting/terms.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:rayan/control/homecontroller.dart';
import 'package:rayan/model/modeApi/modelLogin/login_model.dart';
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

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:rayan/view/init_page.dart';
import 'package:rayan/view/lang_page.dart';
import 'package:rayan/view/other/competitionsScreens/competitions_main.dart';
import 'package:rayan/view/other/competitionsScreens/complet_person_sub.dart';
import 'package:rayan/view/other/competitionsScreens/info_compit.dart';
import 'package:rayan/view/other/competitionsScreens/person_sub.dart';
import 'package:rayan/view/other/gaust/gaust.dart';
import 'package:rayan/view/other/homeMainScreens/recive/chois_receive.dart';
import 'package:rayan/view/other/homeMainScreens/send/complet_send_money.dart';
import 'package:rayan/view/other/homeMainScreens/details_winner.dart';
import 'package:rayan/view/other/homeMainScreens/recive/code.dart';
import 'package:rayan/view/other/homeMainScreens/recive/compleRecive.dart';
import 'package:rayan/view/other/homeMainScreens/recive/gallary.dart';
import 'package:rayan/view/other/homeMainScreens/recive/qr.dart';
import 'package:rayan/view/other/homeMainScreens/send/sendMony.dart';
import 'package:rayan/view/other/home_page.dart';
import 'package:rayan/view/other/register1Screens/register1_main.dart';
import 'package:rayan/view/other/setting/notification/sitting_notification.dart';
import 'package:rayan/view/other/setting/profile/sitting_profile.dart';
import 'package:rayan/view/other/setting/question.dart';
import 'package:rayan/view/other/setting/secutity/sitting_security.dart';

import 'view/auth/page/forgetPassword/email_for_forgetpassword.dart';
import 'view/auth/page/signup/Pin_code_verification_screen.dart';
import 'view/other/competitionsScreens/info_vote.dart';
import 'view/other/setting/profile/UploadImageScreen.dart';

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
        "infoCompet": ((context) => infoCompet()),
        // "infoAgent": ((context) => infoAgent()),
        "personSub": ((context) => personSub()),
        "completPersonSub": ((context) => completPersonSub()),
        "infoVote": ((context) => infoVote()),
        "detailsWinner": ((context) => detailsWinner()),
        "competitionsMain": ((context) => competitionsMain()),
        "sendMony": ((context) => sendMony()),
        "CompletsendMoney": ((context) => CompletsendMoney()),
        "choisReceive": ((context) => choisReceive()),
        "code": ((context) => code()),
        "completRecive": ((context) => completRecive()),
        "qr": ((context) => qr()),
        "gallary": ((context) => gallary()),
        "register1Main": ((context) => register1Main()),
        "question": ((context) => const questionComm()),
        "gaust": ((context) => gaust()),
        "terms": ((context) => terms()),
        "notificationPage": ((context) => notificationPage()),
        "about": ((context) => about()),
        "agentDet": ((context) => agentDet()),
        // "UploadImageScreen": ((context) => UploadImageScreen()),
        "quistWinner": ((context) => quistWinner()),
      },
      // supportedLocales: [
      //   const Locale('en'),
      //   const Locale('ar'),
      //   const Locale('es'),
      //   const Locale('el'),
      //   const Locale('et'),
      //   const Locale('nb'),
      //   const Locale('nn'),
      //   const Locale('pl'),
      //   const Locale('pt'),
      //   const Locale('ru'),
      //   const Locale('hi'),
      //   const Locale('ne'),
      //   const Locale('uk'),
      //   const Locale('hr'),
      //   const Locale('tr'),
      //   const Locale.fromSubtags(
      //       languageCode: 'zh',
      //       scriptCode: 'Hans'), // Generic Simplified Chinese 'zh_Hans'
      //   const Locale.fromSubtags(
      //       languageCode: 'zh',
      //       scriptCode: 'Hant'), // Generic traditional Chinese 'zh_Hant'
      // ],
      // localizationsDelegates: [
      //   CountryLocalizations.delegate,
      //   GlobalMaterialLocalizations.delegate,
      //   GlobalCupertinoLocalizations.delegate,
      //   GlobalWidgetsLocalizations.delegate,
      // ],
      // locale: Locale('ar'),
      translations: Translation(),
      locale: isStart == true ? Locale('ar') : Locale('ar'),
      fallbackLocale: Locale('en'),
    );
  }

  monthly() {}
}
