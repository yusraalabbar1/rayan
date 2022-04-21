import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rayan/control/homecontroller.dart';
import 'package:rayan/model/modeApi/balance/rechargeBalanceFromUserToUser.dart';
import 'package:rayan/model/modeApi/balance/userBalance.dart';
import 'package:rayan/utils/constant/color.dart';

class sendMony extends StatefulWidget {
  sendMony({Key? key}) : super(key: key);

  @override
  State<sendMony> createState() => _sendMonyState();
}

class _sendMonyState extends State<sendMony> {
  final formstate = GlobalKey<FormState>();
  var uniqCode;
  var amountSend;
  homecontroller controller = Get.put(homecontroller());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: MyColors.color2,
        ),
        Container(
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                expandedHeight: 100,
                elevation: 0.0,
                backgroundColor: Colors.transparent,
              ),
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    Stack(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height,
                          width: MediaQuery.of(context).size.width,
                          color: Colors.transparent,
                        ),
                        Column(
                          children: [
                            Container(
                              height: 40,
                              width: MediaQuery.of(context).size.width,
                              color: Colors.transparent,
                            ),
                            Container(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: MediaQuery.of(context).size.height,
                                    width: MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(40),
                                        topLeft: Radius.circular(40),
                                      ),
                                      image: DecorationImage(
                                        image: AssetImage(
                                            "assets/images/background.png"),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    child: Form(
                                      key: formstate,
                                      child: Container(
                                        margin: EdgeInsets.all(20),
                                        child: Column(
                                          children: [
                                            SizedBox(
                                              height: 50,
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(
                                                  left: 30, right: 30),
                                              alignment: Alignment.centerRight,
                                              child: Text(
                                                "The amount you want to transfer"
                                                    .tr,
                                                style: TextStyle(
                                                    color: MyColors.color3,
                                                    fontSize: 14,
                                                    fontFamily: 'Almarai'),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            GetBuilder<homecontroller>(
                                                builder: (controller) {
                                              return (TextFormField(
                                                keyboardType:
                                                    TextInputType.number,
                                                style: const TextStyle(
                                                    color: MyColors.color3),
                                                validator: (text) {
                                                  if (text!.length > 40) {
                                                    return "can not enter bigest than 40";
                                                  }
                                                  if (text.length < 1) {
                                                    return "can not enter less than 1";
                                                  }
                                                  return null;
                                                },
                                                decoration:
                                                    const InputDecoration(
                                                  hintText: '00',
                                                ),
                                                onSaved: (string) {
                                                  amountSend = string;
                                                },
                                              ));
                                            }),
                                            SizedBox(
                                              height: 20,
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(
                                                  left: 30, right: 30),
                                              alignment: Alignment.centerRight,
                                              child: Text(
                                                "enter the transfer code for the Reciver"
                                                    .tr,
                                                style: TextStyle(
                                                    color: MyColors.color3,
                                                    fontSize: 14,
                                                    fontFamily: 'Almarai'),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            GetBuilder<homecontroller>(
                                                builder: (controller) {
                                              return (TextFormField(
                                                keyboardType:
                                                    TextInputType.text,
                                                style: const TextStyle(
                                                    color: MyColors.color3),
                                                validator: (text) {
                                                  if (text!.length > 40) {
                                                    return "can not enter bigest than 40";
                                                  }
                                                  if (text.length < 1) {
                                                    return "can not enter less than 1";
                                                  }
                                                  return null;
                                                },
                                                decoration:
                                                    const InputDecoration(
                                                  hintText: 'GDSJ20X',
                                                ),
                                                onSaved: (string) {
                                                  uniqCode = string;
                                                },
                                              ));
                                            }),
                                            SizedBox(
                                              height: 20,
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(
                                                  left: 30, right: 30),
                                              child: Row(
                                                children: [
                                                  Text("The current balance".tr,
                                                      style: TextStyle(
                                                          color:
                                                              MyColors.color3,
                                                          fontSize: 14,
                                                          fontFamily:
                                                              'Almarai')),
                                                  Text(
                                                      balanceForUser.toString(),
                                                      style: TextStyle(
                                                          color:
                                                              MyColors.color3,
                                                          fontSize: 14,
                                                          fontFamily:
                                                              'Almarai')),
                                                  Text("Dollar".tr,
                                                      style: TextStyle(
                                                          color:
                                                              MyColors.color3,
                                                          fontSize: 14,
                                                          fontFamily:
                                                              'Almarai'))
                                                ],
                                              ),
                                            ),
                                            Container(
                                              width: double.infinity,
                                              height: 60,
                                              margin: const EdgeInsets.only(
                                                  bottom: 10,
                                                  right: 30,
                                                  left: 30,
                                                  top: 20),
                                              child: RaisedButton(
                                                color: MyColors.color1,
                                                elevation: 10,
                                                splashColor: MyColors.color3,
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            25),
                                                    side: BorderSide(
                                                        color: MyColors.color1,
                                                        width: 2)),
                                                onPressed: () {
                                                  var formdata =
                                                      formstate.currentState;
                                                  if (formdata!.validate()) {
                                                    formdata.save();
                                                    AwesomeDialog(
                                                            context: context,
                                                            dialogType:
                                                                DialogType.INFO,
                                                            animType: AnimType
                                                                .RIGHSLIDE,
                                                            headerAnimationLoop:
                                                                true,
                                                            btnOkOnPress: () {
                                                              rechargeBalanceFromUserToUser(
                                                                  context,
                                                                  uniqCode,
                                                                  double.parse(
                                                                      amountSend));
                                                            },
                                                            body: Text(
                                                                "هل أنت منأكد أنك تريد التحويل ل ${uniqCode}??",
                                                                style: TextStyle(
                                                                    color: MyColors
                                                                        .color3,
                                                                    fontSize:
                                                                        14,
                                                                    fontFamily:
                                                                        'Almarai')),
                                                            dialogBackgroundColor:
                                                                MyColors.color2,
                                                            btnCancelColor:
                                                                Colors.red,
                                                            btnOkColor:
                                                                MyColors.color1)
                                                        .show();
                                                  } else {
                                                    print(
                                                        "not validddddddddddddddd");
                                                  }
                                                },
                                                child: Text(
                                                  "continue".tr,
                                                  style: TextStyle(
                                                      fontSize: 13,
                                                      color: MyColors.color3,
                                                      fontFamily: 'Almarai'),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Positioned(
                          // left: 46,
                          top: 0.0,
                          left: (MediaQuery.of(context).size.width) / 2 - 31,

                          // (background container size) - (circle height / 2)
                          child: Center(
                            child: CircleAvatar(
                              radius: 50,
                              backgroundColor: MyColors.color1,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(50),
                                child: Image.asset(
                                  "assets/images/logo.png",
                                  width: 60,
                                  height: 40,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            // Container(
                            //   height: 84.0,
                            //   width: 84.0,

                            //   child: Icon(
                            //     Icons.money_rounded,
                            //     size: 40,
                            //     color: Colors.white,
                            //   ),
                            //   decoration: BoxDecoration(
                            //       shape: BoxShape.circle,
                            //       color: Color.fromARGB(255, 201, 75, 134)),
                            // ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    ));
  }
}

Widget buildSliverAppBar() {
  return SliverAppBar(
    expandedHeight: 10,
    elevation: 0.0,
    flexibleSpace: FlexibleSpaceBar(
      centerTitle: true,
      background: Hero(
        tag: 1,
        child: Container(
          color: Colors.transparent,
        ),
      ),
    ),
  );
}
