import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Container buttonsend(text, icon, context) {
  return Container(
    width: 127,
    height: 50,
    child: RaisedButton.icon(
      onPressed: () {
        print('Button Clicked.');
        Navigator.of(context).pushNamed("sendMony");
      },
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0))),
      label: Text(
        text,
        style:
            TextStyle(color: Colors.white, fontSize: 14, fontFamily: 'Almarai'),
      ),
      icon: Icon(
        icon,
        color: Colors.white,
      ),
      textColor: Colors.white,
      splashColor: Colors.white,
      color: Color(0xff464699),
    ),
  );
}

Container buttonrec(text, icon, context) {
  return Container(
    width: 127,
    height: 37,
    child: RaisedButton.icon(
      onPressed: () {
        print('Button Clicked.');
        Navigator.of(context).pushNamed("choisReceive");
      },
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0))),
      label: Text(
        text,
        style:
            TextStyle(color: Colors.white, fontSize: 14, fontFamily: 'Almarai'),
      ),
      icon: Icon(
        icon,
        color: Colors.white,
      ),
      textColor: Colors.white,
      splashColor: Colors.white,
      color: Color(0xff464699),
    ),
  );
}
