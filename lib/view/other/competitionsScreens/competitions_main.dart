import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rayan/control/homecontroller.dart';
import 'package:rayan/model/modeApi/modelsCompt/allMemberCompitition.dart';
import 'package:rayan/model/modeApi/modelsCompt/model_compitition.dart';
import 'package:rayan/utils/constant/color.dart';
import 'package:rayan/view/auth/widget/themeWst.dart';
import 'package:rayan/view/other/competitionsScreens/widget_tow_button_compitition.dart';
import 'package:rayan/view/other/widget/design_appbar.dart';

class competitionsMain extends StatefulWidget {
  competitionsMain({Key? key}) : super(key: key);

  @override
  State<competitionsMain> createState() => _competitionsMainState();
}

class _competitionsMainState extends State<competitionsMain> {
  homecontroller controller = Get.put(homecontroller());
  List filteredUsers = [];
  @override
  void initState() {
    super.initState();
  }

  _onSearchFieldChanged(String value) async {
    // to fill out next!
    var results;
    if (value.isEmpty) {
      print("empty");
      print(MyCompitition);
      results = MyCompitition;
    } else {
      results = MyCompitition.where((user) =>
          user["name"].toLowerCase().contains(value.toLowerCase())).toList();
    }

    setState(() {
      foundCompitition = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        containerMaine(),
        Container(
          decoration: boxDecorationMain(),
        ),
        controller.saveMapCompitition == null
            ? Text("loading...")
            : ListView(
                // shrinkWrap: true,
                children: [
                  rowAppbar(context),
                  widgetTowButtonCompitition(),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Center(
                      child: TextField(
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(15.0),
                            prefixIcon: Icon(
                              Icons.search,
                              color: MyColors.color1,
                            ),
                            hintText: 'ابحث عن مسابقة'),
                        onChanged: (string) {
                          _onSearchFieldChanged(string);
                        },
                      ),
                    ),
                  ),
                  GetBuilder<homecontroller>(builder: (controller) {
                    return (controller.i == 0
                        ? pageCompit()
                        : pageVote(context));
                  }),
                  const SizedBox(
                    height: 100,
                  )
                ],
              )
      ],
    ));
  }

  Widget pageCompit() {
    return GridView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      physics: ScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemCount: foundCompitition.length,
      itemBuilder: (BuildContext context, int index) {
        return GetBuilder<homecontroller>(builder: (controller) {
          return (InkWell(
            onTap: () {
              if (foundCompitition[index]['isFinish'] = true) {
                AwesomeDialog(
                        context: context,
                        animType: AnimType.RIGHSLIDE,
                        headerAnimationLoop: true,
                        btnOkOnPress: () {},
                        body: Text("عذرا المسابقة منتهية",
                            style: TextStyle(
                                color: MyColors.color3,
                                fontSize: 14,
                                fontFamily: 'Almarai')),
                        dialogBackgroundColor: MyColors.color2,
                        btnOkColor: MyColors.color1)
                    .show();
              } else {
                controller.SavenameComp(foundCompitition[index]['name']);
                controller.SavemonyrComp(
                    foundCompitition[index]['awardAmount']);
                controller.SavediscrpComp(
                    foundCompitition[index]['description']);
                controller.SaveidComp(
                    foundCompitition[index]['competitionsId']);
                controller.Saveamount(foundCompitition[index]['amount']);
                controller.SaveIsFinishComp(
                    foundCompitition[index]['isFinish']);
                controller.SaveImageComp(foundCompitition[index]['imageUrl']);
                controller.SavecurrentTourName(
                    foundCompitition[index]['currentTourName']);
                controller.SavecurrentTourTimeLimit(
                    foundCompitition[index]['currentTourTimeLimit']);
                Navigator.of(context).pushNamed("infoCompet");
              }
            },
            child: Container(
                height: 218,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        image: NetworkImage(
                            "http://212.24.108.54/wsaAdmin/images/${foundCompitition[index]['imageUrl']}"),
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
                                        color: Colors.pink, width: 2)),
                                onPressed: () {},
                                child: Text(
                                  "${foundCompitition[index]['remanningMember']}",
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
                              "${foundCompitition[index]['name']}",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontFamily: 'Almarai'),
                            ),
                            Text(
                              foundCompitition[index]['currentTourName'] != null
                                  ? "${foundCompitition[index]['currentTourName']}"
                                  : "لم تبدأ الجولة",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 10,
                                  fontFamily: 'Almarai'),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              foundCompitition[index]['isFinish'] != true
                                  ? ""
                                  : "المسابقة منتهية",
                              style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 7,
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
                                image:
                                    AssetImage("assets/images/backCopit.PNG"),
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
                            Text("${foundCompitition[index]['awardAmount']}\$",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 9,
                                    fontFamily: 'Almarai')),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
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
                                                color: Colors.pink, width: 2)),
                                        onPressed: () {},
                                        child: Text(
                                          "${foundCompitition[index]['amount']}\$",
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
                                                color: Colors.pink, width: 2)),
                                        onPressed: () {},
                                        child: Text(
                                          "${foundCompitition[index]['memberCount']}",
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
        });
      },
    );
  }

  Widget pageVote(context) {
    return GetBuilder<homecontroller>(builder: (controller) {
      return Padding(
        padding: const EdgeInsets.all(20.0),
        child: (ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            physics: ScrollPhysics(),
            itemCount: foundCompitition.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: (() {
                  // controller.SaveindexCopititon(
                  //     foundCompitition[index]['competitionsId']);

                  /**************************** */
                  controller.SavenameComp(foundCompitition[index]['name']);
                  controller.SavemonyrComp(
                      foundCompitition[index]['awardAmount']);
                  controller.SavediscrpComp(
                      foundCompitition[index]['description']);
                  controller.SaveidComp(
                      foundCompitition[index]['competitionsId']);
                  controller.Saveamount(foundCompitition[index]['amount']);
                  controller.SaveIsFinishComp(
                      foundCompitition[index]['isFinish']);
                  controller.SaveImageComp(foundCompitition[index]['imageUrl']);
                  controller.SavecurrentTourName(
                      foundCompitition[index]['currentTourName']);
                  controller.SavecurrentTourTimeLimit(
                      foundCompitition[index]['currentTourTimeLimit']);

                  /******************************** */
                  print(index);
                  memberInCompt = [];

                  allMemberCompitition(
                      foundCompitition[index]['competitionsId']);
                  Navigator.of(context).pushNamed("infoVote");
                }),
                child: Card(
                  child: Stack(children: [
                    Container(
                      height: 123,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: MyColors.color1,
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                          image: DecorationImage(
                              image: NetworkImage(
                                  "http://212.24.108.54/wsaAdmin/images/${foundCompitition[index]['imageUrl']}"),
                              fit: BoxFit.cover)),
                    ),
                    Container(
                        width: MediaQuery.of(context).size.width,
                        height: 123,
                        color: Color(0xff141E34).withOpacity(0.6),
                        child: Row(
                          children: [
                            Expanded(
                                child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "${foundCompitition[index]['name']}",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontFamily: 'Almarai'),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "صوت الآن في المسابقة",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontFamily: 'Almarai'),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "الوقت المتبقي ",
                                      style: TextStyle(
                                          color: MyColors.color3,
                                          fontSize: 11,
                                          fontFamily: 'Almarai'),
                                    ),
                                    Text(
                                      foundCompitition[index]
                                                  ['currentTourTimeLimit'] ==
                                              null
                                          ? "لم تبدأ الجولة"
                                          : "${foundCompitition[index]['currentTourTimeLimit']}",
                                      style: TextStyle(
                                          color: MyColors.color3,
                                          fontSize: 11,
                                          fontFamily: 'Almarai'),
                                    ),
                                    Text(
                                      "دقيقة",
                                      style: TextStyle(
                                          color: MyColors.color3,
                                          fontSize: 11,
                                          fontFamily: 'Almarai'),
                                    ),
                                  ],
                                ),
                              ],
                            )),
                            Expanded(
                                child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset("assets/images/trophy.png"),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "${foundCompitition[index]['awardAmount']}",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontFamily: 'Almarai'),
                                )
                              ],
                            ))
                          ],
                        ))
                  ]),
                ),
              );
            })),
      );
    });
  }
}
