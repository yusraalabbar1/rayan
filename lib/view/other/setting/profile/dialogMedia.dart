import 'dart:io';

import 'package:flutter/material.dart';
import 'package:rayan/model/modeApi/modelMedia/setting_social_media.dart';
import 'package:rayan/routs.dart';
import 'package:rayan/utils/constant/color.dart';
import 'package:url_launcher/url_launcher.dart';

dialogForMediae(context) async {
  var whatsapp = whatsupSitting;

  var number = whatsupSitting;
  var email = "";
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
            content: Container(
          height: 150,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 127,
                height: 50,
                child: RaisedButton.icon(
                  onPressed: () {
                    print('Button Clicked.');
                    launch("whatsapp://send?phone=${whatsapp}");
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(25.0))),
                  label: Text(
                    "WhatsApp",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontFamily: 'Almarai'),
                  ),
                  icon: Icon(
                    Icons.whatsapp_outlined,
                    color: Colors.white,
                  ),
                  textColor: Colors.white,
                  splashColor: Colors.white,
                  color: MyColors.color1,
                ),
              ),
            ],
          ),
        ));
      });
}
