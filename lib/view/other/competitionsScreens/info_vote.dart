import 'dart:math';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:get/get.dart';
import 'package:rayan/control/homecontroller.dart';
import 'package:rayan/model/modeApi/modelsCompt/addCompetitionVote.dart';
import 'package:rayan/model/modeApi/modelsCompt/allMemberCompitition.dart';
import 'package:rayan/model/modeApi/modelLogin/login_model.dart';
import 'package:rayan/model/modeApi/modelsCompt/getCompetitionWinner.dart';
import 'package:rayan/model/modeApi/modelsCompt/getWinnerQuestion.dart';
import 'package:rayan/model/modeApi/modelsCompt/get_winner_answer.dart';
import 'package:rayan/model/modeApi/modelsCompt/model_compitition.dart';
import 'package:rayan/utils/constant/color.dart';
import 'package:rayan/view/auth/widget/themeWst.dart';
import 'package:rayan/view/other/widget/design_appbar.dart';
import 'package:url_launcher/url_launcher.dart';

class infoVote extends StatefulWidget {
  infoVote({Key? key}) : super(key: key);

  @override
  State<infoVote> createState() => _infoVoteState();
}

class _infoVoteState extends State<infoVote> {
  homecontroller controller = Get.put(homecontroller());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    winnerAnswer = [];
    // // memberInCompt = null;

    getComptWinner(tokenloginresult, controller.saveidComp);
    getWinnerAnswer(controller.saveidComp);
  }

  Future<void> share() async {
    await FlutterShare.share(
        title: 'شارك المسابقة',
        text: "${controller.nameComp}",
        linkUrl: 'https://flutter.dev/',
        chooserTitle: 'شارك ${controller.nameComp}');
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
        ListView(
          shrinkWrap: true,
          children: [
            // rowAppbar(context),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(19.0),
              child: Card(
                child: Stack(children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 123,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(
                                "http://212.24.108.54/wsaAdmin/images/${controller.saveImageComp}"),
                            fit: BoxFit.cover)),
                  ),
                  Container(
                      // width: 300,
                      height: 123,
                      color: Color(0xff141E34).withOpacity(0.6),
                      child: Row(
                        children: [
                          Expanded(
                              child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "${controller.nameComp}",
                                style: TextStyle(
                                    color: MyColors.color3,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Almarai'),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Center(
                                child: Text(
                                  controller.saveIsFinishComp == true
                                      ? "Contest is over".tr
                                      : "Vote now for the contest".tr,
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Almarai'),
                                ),
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
                                "${controller.monyrComp}",
                                style: TextStyle(
                                    color: MyColors.color3,
                                    fontSize: 14,
                                    fontFamily: 'Almarai'),
                              )
                            ],
                          ))
                        ],
                      ))
                ]),
              ),
            ),

            GetBuilder<homecontroller>(builder: (controller) {
              return (controller.savememberInCompt == null
                  ? Container()
                  : controller.saveIsFinishComp == true
                      ? Container(
                          margin: EdgeInsets.only(left: 25, right: 25),
                          child: Text("Winner is".tr,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Almarai')),
                        )
                      : Container(
                          margin:
                              EdgeInsets.only(left: 25, right: 25, bottom: 20),
                          child: Text(
                            "All contestants".tr,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Almarai'),
                          ),
                        ));
            }),
            GetBuilder<homecontroller>(builder: (controller) {
              return (controller.savememberInCompt == null
                  ? Text("loading..")
                  : controller.saveIsFinishComp == true
                      ? widgetWinn()
                      : widgetConst(context, controller.saveidComp));
            }),
//controller.savegetComptWinnerid==idSaveprefpref?
            // widgetConst(context),
            GetBuilder<homecontroller>(builder: (controller) {
              return (controller.saveIsFinishComp == true &&
                      controller.savegetComptWinnerid == idSaveprefpref
                  ? widgQues()
                  : Container());
            }),
            Padding(
              padding: const EdgeInsets.all(19.0),
              child: Text(
                "${controller.nameComp}",
                style: TextStyle(
                    color: MyColors.color3,
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Almarai'),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(
                  left: 23, right: 23, top: 5, bottom: 20),
              child: Text(
                "${controller.discrpComp}",
                style: TextStyle(
                    color: MyColors.color3,
                    fontSize: 13,
                    fontFamily: 'Almarai'),
              ),
            ),

            GetBuilder<homecontroller>(builder: (controller) {
              return (controller.savememberInCompt == null
                  ? Container()
                  : controller.saveIsFinishComp == true
                      ? Container()
                      : Container(
                          child: Padding(
                            padding: const EdgeInsets.all(19.0),
                            child: Text(
                              "Share the Contest".tr,
                              style: TextStyle(
                                  color: MyColors.color3,
                                  fontSize: 17,
                                  fontFamily: 'Almarai'),
                            ),
                          ),
                        ));
            }),

            Padding(
              padding: const EdgeInsets.only(left: 19, right: 19),
              child: Container(
                height: 60,
                child: RaisedButton(
                  color: MyColors.color1,
                  elevation: 10,
                  splashColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  onPressed: () {
                    if (controller.saveIsFinishComp == true) {
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
                      share();
                    }
                  },
                  child: Text("Share link social media".tr,
                      style: TextStyle(
                          color: MyColors.color3,
                          fontSize: 14,
                          fontFamily: 'Almarai')),
                ),
              ),
            ),

            SizedBox(
              height: 30,
            )
          ],
        )
      ],
    ));
  }

  Widget widgQues() {
    return Container(
      margin: EdgeInsets.only(left: 40, right: 40),
      child: RaisedButton(
        color: MyColors.color1,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
            side: BorderSide(color: MyColors.color1, width: 2)),
        child: Text("Answer the question".tr,
            style: TextStyle(
                color: Colors.white, fontSize: 13, fontFamily: 'Almarai')),
        onPressed: () {
          Navigator.of(context).pushNamed("quistWinner");
        },
      ),
    );
  }

  Widget widgetWinn() {
    return Container(
      alignment: Alignment.topRight,
      margin: EdgeInsets.only(left: 20, right: 20, top: 20),
      // color: Colors.white,
      height: 230,
      // width: MediaQuery.of(context).size.width,
      //child: Text(controller.savegetComptWinnerNickName.toString()),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: InkWell(
              onTap: () {
                if (controller.saveListWinnerAnswer.isEmpty) {
                } else {
                  dialogForanswer(context);
                }
              },
              child: Container(
                width: 210,
                padding: EdgeInsets.only(top: 30),
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color.fromARGB(255, 117, 144, 224),
                          Color(0xff121E39)
                        ]),
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: controller.savegetComptWinnerNickName != null
                    ? Column(
                        children: [
                          Text(
                            controller.savegetComptWinnerNickName.toString(),
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 13,
                                fontFamily: 'Almarai'),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            width: 105,
                            height: 74,
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color(0xff1A1E2B).withOpacity(0.5),
                            ),
                            child: Column(
                              children: [
                                Image.asset("assets/images/trophy.png"),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  controller.monyrComp.toString(),
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontFamily: 'Almarai'),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            "Number of Votes".tr,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontFamily: 'Almarai'),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          GetBuilder<homecontroller>(builder: (controller) {
                            return (Text(
                              "(" +
                                  controller.savegetComptWinnerNumbeVote
                                      .toString() +
                                  ")",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontFamily: 'Almarai'),
                            ));
                          })
                        ],
                      )
                    : Container(
                        child: Center(
                          child: Text(
                            "لم يشارك أحد",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontFamily: 'Almarai'),
                          ),
                        ),
                      ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget widgetConst(context, id) {
    return Column(
      children: [
        /*Container(
          margin: EdgeInsets.only(left: 20, right: 20, bottom: 10),
          height: 35,
          child: Center(
            child: TextFormField(
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(15.0),
                  prefixIcon: Icon(
                    Icons.search,
                    color: MyColors.color1,
                  ),
                  hintText: 'ابحث عن متسابق',
                  hintStyle: TextStyle(fontSize: 10, color: MyColors.color3)),
              onChanged: (string) {},
            ),
          ),
        ),*/

        Container(
          margin: EdgeInsets.only(left: 20, right: 20),
          // color: Colors.white,
          height: 230,
          width: MediaQuery.of(context).size.width,

          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: memberInCompt.length,
              itemBuilder: (context, index) {
                int count = controller.savememberInCompt[index]['voteNumber'];
                return Stack(
                  children: [
                    Column(
                      children: <Widget>[
                        Container(
                          height: 30,
                          width: 130,
                          color: Colors.transparent,
                        ),
                        Expanded(
                          child: Container(
                            width: 120,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(40),
                                bottomLeft: Radius.circular(40),
                              ),
                              color: Colors.primaries[
                                      Random().nextInt(Colors.primaries.length)]
                                  .withOpacity(0.6),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "${controller.savememberInCompt[index]['nickName']}",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontFamily: 'Almarai'),
                                ),
                                Text(
                                  "Number".tr,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontFamily: 'Almarai'),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  height: 2,
                                  decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                          begin: Alignment.centerLeft,
                                          end: Alignment.centerRight,
                                          colors: [
                                            Color.fromARGB(255, 83, 101, 143),
                                            Color(0xff414D72)
                                          ]),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20))),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "(" +
                                      "${controller.savememberInCompt[index]['memberNo']}" +
                                      ")",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 21,
                                      fontFamily: 'Almarai'),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "Number of Votes".tr,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontFamily: 'Almarai'),
                                ),
                                GetBuilder<homecontroller>(
                                    builder: (controller) {
                                  return (Text(
                                    // "${controller.SavememberInComptlength}",
                                    "${controller.savememberInCompt[index]['voteNumber']}",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                        fontFamily: 'Almarai'),
                                  ));
                                }),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  height: 30,
                                  width: 70,
                                  child: RaisedButton(
                                    splashColor: MyColors.color3,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(25)),
                                    onPressed: () {
                                      setState(() {
                                        addCompitationVote(
                                            id,
                                            controller.savememberInCompt[index]
                                                ['id'],
                                            idSaveprefpref,
                                            context);
                                      });
                                    },
                                    child: Text("vote".tr,
                                        style: TextStyle(
                                            color:
                                                Color.fromARGB(255, 48, 45, 45),
                                            fontSize: 12,
                                            fontFamily: 'Almarai')),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    Positioned(
                      left: 30,
                      top: 0.0,
                      // (background container size) - (circle height / 2)
                      child: Center(
                        child: Container(
                          height: 56,
                          width: 56,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              image: DecorationImage(
                                image: controller.savememberInCompt[index]
                                            ['memberImageUrl'] ==
                                        null
                                    ? NetworkImage(
                                        "https://media.istockphoto.com/vectors/avatar-person-user-icon-blue-color-vector-id1216255389?k=20&m=1216255389&s=170667a&w=0&h=uklU-WnkSAvUCtqrB4vxbga1hfYfBWRcQQlEYKhhrdQ=")
                                    : NetworkImage(
                                        "http://212.24.108.54/wsaAdmin/images/${controller.savememberInCompt[index]['memberImageUrl']}"),
                                fit: BoxFit.cover,
                              )),
                        ),
                      ),
                    )
                  ],
                );
              }),
        )
      ],
    );
  }

  dialogForanswer(context) {
    var codeMarket;
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Container(
              margin: EdgeInsets.all(15),
              padding: EdgeInsets.all(15),
              width: MediaQuery.of(context).size.width,
              height: 500,
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Color(0xff414D72), Color(0xff121E39)]),
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 250,
                    width: 250,
                    decoration: const BoxDecoration(
                        color: MyColors.color1,
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "${controller.nameComp}",
                          style: TextStyle(
                              color: MyColors.color3,
                              fontSize: 18,
                              decoration: TextDecoration.none,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Almarai'),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                            "Winner is".tr +
                                " " +
                                controller.savegetComptWinnerNickName
                                    .toString(),
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                decoration: TextDecoration.none,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Almarai')),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: 105,
                          height: 74,
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color(0xff1A1E2B).withOpacity(0.5),
                          ),
                          child: Column(
                            children: [
                              Image.asset("assets/images/trophy.png"),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                controller.saveamount.toString(),
                                style: TextStyle(
                                    color: Colors.white,
                                    decoration: TextDecoration.none,
                                    fontSize: 18,
                                    fontFamily: 'Almarai'),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Number of Votes".tr,
                          style: TextStyle(
                              color: Colors.white,
                              decoration: TextDecoration.none,
                              fontSize: 14,
                              fontFamily: 'Almarai'),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "(" +
                              controller.savegetComptWinnerNumbeVote
                                  .toString() +
                              ")",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              decoration: TextDecoration.none,
                              fontFamily: 'Almarai'),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(winnerQustion[0]["question"].toString(),
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          decoration: TextDecoration.none,
                          fontFamily: 'Almarai')),
                  Text(controller.saveListWinnerAnswer[0]["answer"].toString(),
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          decoration: TextDecoration.none,
                          fontFamily: 'Almarai')),
                  SizedBox(
                    height: 20,
                  ),
                  Text(winnerQustion[1]["question"].toString(),
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          decoration: TextDecoration.none,
                          fontFamily: 'Almarai')),
                  Text(controller.saveListWinnerAnswer[1]["answer"].toString(),
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          decoration: TextDecoration.none,
                          fontFamily: 'Almarai')),
                ],
              ));
        });
  }
}
