import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rayan/control/homecontroller.dart';
import 'package:rayan/model/modeApi/modelsCompt/model_compitition.dart';
import 'package:rayan/utils/constant/color.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';

Widget widgetgallary(context) {
  return GetBuilder<homecontroller>(builder: (controller) {
    return (Container(
      // color: Colors.white,

      margin: EdgeInsets.only(left: 20, right: 20),
      height: 300,

      child: controller.saveMapCompitition == null
          ? Text("loading...")
          : ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: controller.saveMapCompitition.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: GetBuilder<homecontroller>(builder: (controller) {
                    return (InkWell(
                      onTap: () {
                        if (foundCompitition[index]['isFinish'] == true) {
                          AwesomeDialog(
                                  context: context,
                                  animType: AnimType.RIGHSLIDE,
                                  headerAnimationLoop: true,
                                  btnOkOnPress: () {},
                                  body: Text("Sorry,the contest is over".tr,
                                      style: TextStyle(
                                          color: MyColors.color3,
                                          fontSize: 14,
                                          fontFamily: 'Almarai')),
                                  dialogBackgroundColor: MyColors.color2,
                                  btnOkColor: MyColors.color1)
                              .show();
                        } else {
                          controller.SavenameComp(
                              controller.saveMapCompitition[index]['name']);
                          controller.SavemonyrComp(controller
                              .saveMapCompitition[index]['awardAmount']);
                          controller.SavediscrpComp(controller
                              .saveMapCompitition[index]['description']);
                          controller.SaveidComp(controller
                              .saveMapCompitition[index]['competitionsId']);
                          controller.Saveamount(
                              controller.saveMapCompitition[index]['amount']);
                          controller.SaveIsFinishComp(
                              controller.saveMapCompitition[index]['isFinish']);
                          controller.SaveImageComp(
                              foundCompitition[index]['imageUrl']);
                          controller.SavecurrentTourName(controller
                              .saveMapCompitition[index]['currentTourName']);
                          controller.SavecurrentTourTimeLimit(
                              controller.saveMapCompitition[index]
                                  ['currentTourTimeLimit']);
                          Navigator.of(context).pushNamed("infoCompet");
                        }
                      },
                      child: Container(
                          height: 200,
                          width: 190,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                  image: NetworkImage(
                                      "http://212.24.108.54/wsaAdmin/images/${controller.saveMapCompitition[index]['imageUrl']}"),
                                  fit: BoxFit.cover)),
                          //width: 500,
                          // width: 80,
                          // height: 218,
                          margin: EdgeInsets.all(10),
                          child: Column(
                            children: [
                              Container(
                                  color: Color(0xff141E34).withOpacity(0.6),
                                  // width: MediaQuery.of(context).size.width,
                                  height: 186,
                                  width: 190,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        height: 30,
                                        width: 44,
                                        child: RaisedButton(
                                          color: Colors.black,
                                          shape: RoundedRectangleBorder(
                                              side: BorderSide(
                                                  color: Colors.pink,
                                                  width: 2)),
                                          onPressed: () {},
                                          child: Text(
                                            "${controller.saveMapCompitition[index]['remanningMember']}",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 9,
                                                fontFamily: 'Almarai'),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        "The number of contestants left".tr,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 9,
                                            fontFamily: 'Almarai'),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        "${controller.saveMapCompitition[index]['name']}",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 14,
                                            fontFamily: 'Almarai'),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(
                                            left: 10, right: 10),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: Color(0xff1A1E2B)
                                              .withOpacity(0.7),
                                        ),
                                        child: Column(
                                          children: [
                                            Text(
                                              controller.saveMapCompitition[
                                                              index]
                                                          ['currentTourName'] !=
                                                      null
                                                  ? "${controller.saveMapCompitition[index]['currentTourName']}"
                                                  : "Round has not started".tr,
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 10,
                                                  fontFamily: 'Almarai'),
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            controller.saveMapCompitition[index]
                                                        ['isFinish'] !=
                                                    true
                                                ? timeDate(
                                                    foundCompitition[index][
                                                        'currentTourStartDate'],
                                                    foundCompitition[index]
                                                        ['currentTourEndDate'])
                                                : Container(),
                                            controller.saveMapCompitition[index]
                                                        ['isFinish'] !=
                                                    true
                                                ? styleTimeDate(
                                                    foundCompitition[index][
                                                        'currentTourStartDate'],
                                                    foundCompitition[index]
                                                        ['currentTourEndDate'])
                                                : Container(
                                                    child: Text(
                                                      "المسابقة منتهبة",
                                                      style: TextStyle(
                                                          color: Color.fromARGB(
                                                              255,
                                                              222,
                                                              132,
                                                              147),
                                                          fontSize: 11,
                                                          fontFamily:
                                                              'Almarai'),
                                                    ),
                                                  ),
                                            controller.saveMapCompitition[index]
                                                        ['isFinish'] !=
                                                    true
                                                ? StyDate(
                                                    foundCompitition[index][
                                                        'currentTourStartDate'],
                                                    foundCompitition[index]
                                                        ['currentTourEndDate'])
                                                : Text(""),
                                            controller.saveMapCompitition[index]
                                                        ['isFinish'] !=
                                                    true
                                                ? styleDate(
                                                    foundCompitition[index][
                                                        'currentTourStartDate'],
                                                    foundCompitition[index]
                                                        ['currentTourEndDate'])
                                                : Container(),
                                          ],
                                        ),
                                      ),
                                    ],
                                  )),
                              Container(
                                  height: 90,
                                  width: 190,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(10),
                                          bottomRight: Radius.circular(10)),
                                      image: DecorationImage(
                                          image: AssetImage(
                                              "assets/images/backCopit.PNG"),
                                          fit: BoxFit.cover)),
                                  // width: MediaQuery.of(context).size.width,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        "assets/images/trophy.png",
                                        width: 31,
                                        height: 31,
                                      ),
                                      Text(
                                          "${controller.saveMapCompitition[index]['awardAmount']}\$",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 9,
                                              fontFamily: 'Almarai')),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Column(
                                            children: [
                                              Container(
                                                height: 22,
                                                width: 60,
                                                child: RaisedButton(
                                                  color: Colors.black,
                                                  shape: RoundedRectangleBorder(
                                                      side: BorderSide(
                                                          color: Colors.pink,
                                                          width: 2)),
                                                  onPressed: () {},
                                                  child: Text(
                                                    "${controller.saveMapCompitition[index]['amount']}\$",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 9,
                                                        fontFamily: 'Almarai'),
                                                  ),
                                                ),
                                              ),
                                              Text(
                                                "Participation".tr,
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 7,
                                                    fontFamily: 'Almarai'),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Column(
                                            children: [
                                              Container(
                                                height: 22,
                                                width: 60,
                                                child: RaisedButton(
                                                  color: Colors.black,
                                                  shape: RoundedRectangleBorder(
                                                      side: BorderSide(
                                                          color: Colors.pink,
                                                          width: 2)),
                                                  onPressed: () {},
                                                  child: Text(
                                                    "${controller.saveMapCompitition[index]['memberCount']}",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 9,
                                                        fontFamily: 'Almarai'),
                                                  ),
                                                ),
                                              ),
                                              Text(
                                                "constestant".tr,
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 7,
                                                    fontFamily: 'Almarai'),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                        ],
                                      )
                                    ],
                                  ))
                            ],
                          )),
                    ));
                  }),
                );
              }),
    ));
  });
}

Widget timeDate(dt1, dt2) {
  var now = new DateTime.now();
  // DateTime dt1 = DateTime.parse("2022-06-12T21:30:00");
  // DateTime dt2 = DateTime.parse("2022-06-12T21:30:00");
  return Text(
      dt1.compareTo(now) > 0
          ? "تبدأ الجولة في الساعة"
          : "تنتهي الجولة في الساعة",
      style: TextStyle(
          color: Color.fromARGB(255, 231, 136, 129),
          fontWeight: FontWeight.bold,
          fontSize: 10,
          fontFamily: 'Almarai'));
}

Widget StyDate(dt1, dt2) {
  var now = new DateTime.now();
  return Text(dt1.compareTo(now) > 0 ? "بتاريخ" : "بتاريخ",
      style: TextStyle(
          color: Color.fromARGB(255, 231, 136, 129),
          fontWeight: FontWeight.bold,
          fontSize: 10,
          fontFamily: 'Almarai'));
}

Widget styleTimeDate(dt1, dt2) {
  var now = new DateTime.now();
  String str = dt1.compareTo(now) > 0 ? dt1.toString() : dt2.toString();

  //find substring
  String result = str.substring(0, 4);
  String result1 = str.substring(5, 7);
  String result2 = str.substring(8, 10);
  String result3 = str.substring(11, 13);
  String result4 = str.substring(14, 16);
  String result5 = str.substring(17, 19);
  print(result);
  print(result1);
  print(result2);
  print(result3);
  print(result4);
  print(result5);
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Container(
        height: 30,
        width: 30,
        alignment: Alignment.center,
        margin: EdgeInsets.all(5),
        // color: MyColors.color1,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(result4.toString(),
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 10,
                    fontFamily: 'Almarai')),
            Text("دقيقة",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 5,
                    fontFamily: 'Almarai'))
          ],
        ),
      ),
      Container(
          alignment: Alignment.center,
          //color: MyColors.color1,
          child: Text(":",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                  fontFamily: 'Almarai'))),
      Container(
        height: 30,
        width: 30,
        margin: EdgeInsets.all(5),
        alignment: Alignment.center,
        // color: MyColors.color1,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(result3.toString(),
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 10,
                    fontFamily: 'Almarai')),
            Text("الساعة",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 5,
                    fontFamily: 'Almarai'))
          ],
        ),
      ),
      Container(
          child: Text(int.parse(result3) > 12 ? "PM" : "AM",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                  fontFamily: 'Almarai'))),
    ],
  );
}

Widget styleDate(dt1, dt2) {
  var now = new DateTime.now();
  String str = dt1.compareTo(now) > 0 ? dt1.toString() : dt1.toString();

  //find substring
  String result = str.substring(0, 4);
  String result1 = str.substring(5, 7);
  String result2 = str.substring(8, 10);
  String result3 = str.substring(11, 13);
  String result4 = str.substring(14, 16);
  String result5 = str.substring(17, 19);
  print(result);
  print(result1);
  print(result2);
  print(result3);
  print(result4);
  print(result5);

  return Container(
      margin: EdgeInsets.all(5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(result.toString(),
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 10,
                  fontFamily: 'Almarai')),
          Text("/",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 10,
                  fontFamily: 'Almarai')),
          Text(result1.toString(),
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 10,
                  fontFamily: 'Almarai')),
          Text("/",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 10,
                  fontFamily: 'Almarai')),
          Text(result2.toString(),
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 10,
                  fontFamily: 'Almarai')),
        ],
      ));
}

Widget styleTimeDateNew(v1, v2, v3) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Container(
        height: 30,
        width: 30,
        alignment: Alignment.center,
        margin: EdgeInsets.all(5),
        color: MyColors.color1,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(v1.toString(),
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 10,
                    fontFamily: 'Almarai')),
            Text("دقيقة",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 5,
                    fontFamily: 'Almarai'))
          ],
        ),
      ),
      Container(
        height: 30,
        width: 30,
        margin: EdgeInsets.all(5),
        alignment: Alignment.center,
        color: MyColors.color1,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(v2.toString(),
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 10,
                    fontFamily: 'Almarai')),
            Text("ساعة",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 5,
                    fontFamily: 'Almarai'))
          ],
        ),
      ),
      Container(
        height: 30,
        width: 30,
        alignment: Alignment.center,
        margin: EdgeInsets.all(5),
        color: MyColors.color1,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(v3,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 10,
                    fontFamily: 'Almarai')),
            Text("يوم",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 5,
                    fontFamily: 'Almarai'))
          ],
        ),
      ),
    ],
  );
}
