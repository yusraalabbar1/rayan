import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher.dart';
import 'package:rayan/model/modeApi/modelMedia/setting_social_media.dart';
import 'package:rayan/utils/constant/color.dart';

InkWell mediatele(String name) {
  return InkWell(
    child: Text(
      name,
      style: const TextStyle(
          fontSize: 13, color: MyColors.color3, fontFamily: 'Almarai'),
    ),
    onTap: () async {
      // var sms = 'sms:+' + telgramSitting;
      // if (await canLaunch(sms)) {
      //   await launch(sms);
      // } else {
      //   throw 'could not launch $sms';
      // }
      launch(telgramSitting);
      // launch("https://t.me/prog8class");
    },
  );
}

InkWell mediawhat(String name) {
  return InkWell(
    child: Text(
      name,
      style: const TextStyle(
          fontSize: 13, color: MyColors.color3, fontFamily: 'Almarai'),
    ),
    onTap: () async {
      // var whatsapp = 'whatsapp://send?phone=+' + whatsupSitting;
      // if (await canLaunch(whatsapp)) {
      //   await launch(whatsapp);
      // } else {
      //   throw 'could not launch $whatsapp';
      // }
      launch('whatsapp://send?phone=+' + whatsupSitting);
    },
  );
}

InkWell mediaface(String name) {
  return InkWell(
    child: Text(
      name,
      style: const TextStyle(
          fontSize: 13, color: MyColors.color3, fontFamily: 'Almarai'),
    ),
    onTap: () async {
      // var face = facebookSitting;
      // if (await canLaunch(face)) {
      //   await launch(face);
      // } else {
      //   throw 'could not launch $face';
      // }
      launch(facebookSitting);
    },
  );
}
