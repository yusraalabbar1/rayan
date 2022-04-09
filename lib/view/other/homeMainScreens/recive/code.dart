import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rayan/control/homecontroller.dart';
import 'package:rayan/utils/constant/color.dart';

class code extends StatefulWidget {
  code({Key? key}) : super(key: key);

  @override
  State<code> createState() => _codeState();
}

class _codeState extends State<code> {
  final formstate = GlobalKey<FormState>();

  homecontroller controller = Get.put(homecontroller());
  @override
  Widget build(BuildContext context) {
    var nameFake;
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
                expandedHeight: 350,
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
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          height: 60,
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(
                                              left: 30, right: 30),
                                          alignment: Alignment.centerRight,
                                          child: Text(
                                            "كود التحويل",
                                            style: TextStyle(
                                                color: MyColors.color3,
                                                fontSize: 18,
                                                fontFamily: 'Almarai'),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(30.0),
                                          child: Form(
                                            key: formstate,
                                            child: GetBuilder<homecontroller>(
                                                builder: (controller) {
                                              return (TextFormField(
                                                style: const TextStyle(
                                                    color: MyColors.color3),
                                                validator: (text) {
                                                  if (text!.length > 100) {
                                                    return "can not enter bigest than 40";
                                                  }
                                                  if (text.length < 2) {
                                                    return "can not enter less than 2";
                                                  }
                                                  return null;
                                                },
                                                decoration:
                                                    const InputDecoration(
                                                  hintText:
                                                      'bfezhjfjknkfene56e5f61efdknvk',
                                                ),
                                                onSaved: (string) {
                                                  nameFake = string;
                                                  controller.SavenameFake(
                                                      string);
                                                },
                                              ));
                                            }),
                                          ),
                                        ),
                                        Container(
                                          width: double.infinity,
                                          height: 60,
                                          margin: const EdgeInsets.only(
                                              bottom: 10,
                                              right: 30,
                                              left: 30,
                                              top: 10),
                                          child: RaisedButton(
                                            color: MyColors.color1,
                                            elevation: 10,
                                            splashColor: MyColors.color3,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(25),
                                                side: BorderSide(
                                                    color: MyColors.color1,
                                                    width: 2)),
                                            onPressed: () {
                                              var formdata =
                                                  formstate.currentState;
                                              if (formdata!.validate()) {
                                                formdata.save();
                                                Navigator.of(context)
                                                    .pushNamed("completRecive");
                                              } else {
                                                print(
                                                    "not validddddddddddddddd");
                                              }
                                            },
                                            child: const Text(
                                              "استمرار",
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
                            child: Container(
                              height: 84.0,
                              width: 84.0,
                              child: Icon(
                                Icons.money_rounded,
                                color: Colors.white,
                                size: 30,
                              ),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color(0xff70D1AA)),
                            ),
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
    expandedHeight: 350,
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
