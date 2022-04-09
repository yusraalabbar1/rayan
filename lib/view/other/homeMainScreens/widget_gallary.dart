import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rayan/control/homecontroller.dart';
import 'package:rayan/model/modeApi/modelsCompt/model_compitition.dart';

Widget widgetgallary(context) {
  return GetBuilder<homecontroller>(builder: (controller) {
    return (Container(
      // color: Colors.white,

      margin: EdgeInsets.only(left: 20, right: 20),
      height: 200,
      width: MediaQuery.of(context).size.width,

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
                        controller.SavecurrentTourTimeLimit(controller
                            .saveMapCompitition[index]['currentTourTimeLimit']);
                        Navigator.of(context).pushNamed("infoCompet");
                      },
                      child: Container(
                          height: 200,
                          width: 150,
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
                                  height: 96,
                                  width: 180,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        height: 22,
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
                                        height: 3,
                                      ),
                                      Text(
                                        "عدد المتسابقين المتبقي",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 9,
                                            fontFamily: 'Almarai'),
                                      ),
                                      SizedBox(
                                        height: 3,
                                      ),
                                      Text(
                                        "${controller.saveMapCompitition[index]['name']}",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12,
                                            fontFamily: 'Almarai'),
                                      ),
                                      Text(
                                        controller.saveMapCompitition[index]
                                                    ['currentTourName'] !=
                                                null
                                            ? "${controller.saveMapCompitition[index]['currentTourName']}"
                                            : "لم تبدأ الجولة",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 10,
                                            fontFamily: 'Almarai'),
                                      ),
                                    ],
                                  )),
                              Container(
                                  height: 80,
                                  width: 180,
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
                                                width: 44,
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
                                                "الإشتراك",
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
                                                width: 44,
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
                                                "المتسابقين",
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
