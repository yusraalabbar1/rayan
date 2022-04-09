import 'package:flutter/material.dart';
import 'package:rayan/utils/constant/color.dart';

Container wstContainer1(context) {
  return Container(
      height: (MediaQuery.of(context).size.height) / 5,
      width: MediaQuery.of(context).size.width,
      child: Image.asset("assets/images/logo.png"));
}

Container wstContainer(context) {
  return Container(
      height: (MediaQuery.of(context).size.height) / 7,
      width: MediaQuery.of(context).size.width,
      child: Image.asset("assets/images/logo.png"));
}

Container logoContainer(context) {
  return Container(
      margin: EdgeInsets.only(left: 20),
      height: 60,
      width: 60,
      child: Image.asset("assets/images/logo.png"));
}

Container containerMaine() {
  return Container(
    width: double.infinity,
    height: double.infinity,
    color: MyColors.color2,
    // color: Color.fromRGBO(20, 30, 52, 0.6),
  );
}

BoxDecoration boxDecorationMain() {
  return BoxDecoration(
    image: DecorationImage(
      image: AssetImage("assets/images/background.png"),
      fit: BoxFit.cover,
    ),
  );
}

Container imageBackgroundContainer() {
  return Container(
    decoration: BoxDecoration(
      image: DecorationImage(
        image: AssetImage("assets/images/background.png"),
        fit: BoxFit.cover,
      ),
    ),
    child: null /* add child content here */,
  );
}

Container buttonStart(col1, col2, t1, col3, context, rout) {
  return Container(
    width: double.infinity,
    height: 55,
    margin: EdgeInsets.only(bottom: 10, right: 30, left: 30, top: 10),
    child: RaisedButton(
      color: col1,
      elevation: 10,
      splashColor: MyColors.color3,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
          side: BorderSide(color: col2, width: 2)),
      onPressed: () {
        Navigator.of(context).pushNamed(rout);
      },
      child: Text(
        t1,
        style: TextStyle(fontSize: 13, color: col3, fontFamily: 'Almarai'),
      ),
    ),
  );
}
