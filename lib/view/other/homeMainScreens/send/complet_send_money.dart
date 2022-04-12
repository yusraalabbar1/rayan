import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rayan/control/homecontroller.dart';
import 'package:rayan/utils/constant/color.dart';
import 'package:qr_flutter/qr_flutter.dart';

class CompletsendMoney extends StatefulWidget {
  CompletsendMoney({Key? key}) : super(key: key);

  @override
  State<CompletsendMoney> createState() => _CompletsendMoneyState();
}

class _CompletsendMoneyState extends State<CompletsendMoney> {
  final formstate = GlobalKey<FormState>();

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
                expandedHeight: 10,
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
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              alignment: Alignment.topRight,
                                              child: Text("amount".tr,
                                                  style: TextStyle(
                                                      color: MyColors.color3,
                                                      fontSize: 11,
                                                      fontFamily: 'Almarai')),
                                            ),
                                            Text("5000.00",
                                                style: TextStyle(
                                                    color: MyColors.color3,
                                                    fontSize: 38,
                                                    fontFamily: 'Almarai')),
                                            Container(
                                              alignment: Alignment.bottomLeft,
                                              child: Text("USD",
                                                  style: TextStyle(
                                                      color: MyColors.color3,
                                                      fontSize: 19,
                                                      fontFamily: 'Almarai')),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: Colors.white,
                                          ),
                                          child: QrImage(
                                            data: "1234567890",
                                            version: QrVersions.auto,
                                            size: 200.0,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Text("Transmitter Code:".tr,
                                                style: TextStyle(
                                                    color: MyColors.color3,
                                                    fontSize: 11,
                                                    fontFamily: 'Almarai')),
                                            Text("SS98120983kasd09lkaskld128",
                                                style: TextStyle(
                                                    color: MyColors.color3,
                                                    fontSize: 11,
                                                    fontFamily: 'Almarai')),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            RaisedButton(
                                              onPressed: () {},
                                              color: MyColors.color1,
                                              elevation: 10,
                                              splashColor: MyColors.color3,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(25),
                                                  side: BorderSide(
                                                      color: MyColors.color1,
                                                      width: 2)),
                                              child: Row(
                                                children: [
                                                  Icon(
                                                    Icons.share,
                                                    size: 11,
                                                    color: Colors.white,
                                                  ),
                                                  SizedBox(
                                                    width: 5,
                                                  ),
                                                  Text(
                                                    "Sharing".tr,
                                                    style: TextStyle(
                                                        color: MyColors.color3,
                                                        fontSize: 11,
                                                        fontFamily: 'Almarai'),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            RaisedButton(
                                              onPressed: () {},
                                              color: MyColors.color1,
                                              elevation: 10,
                                              splashColor: MyColors.color3,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(25),
                                                  side: BorderSide(
                                                      color: MyColors.color1,
                                                      width: 2)),
                                              child: Row(
                                                children: [
                                                  Icon(
                                                    Icons.copy,
                                                    size: 11,
                                                    color: Colors.white,
                                                  ),
                                                  SizedBox(
                                                    width: 5,
                                                  ),
                                                  Text("نسخ الرمز ",
                                                      style: TextStyle(
                                                          color:
                                                              MyColors.color3,
                                                          fontSize: 11,
                                                          fontFamily:
                                                              'Almarai')),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            RaisedButton(
                                              onPressed: () {},
                                              color: MyColors.color1,
                                              elevation: 10,
                                              splashColor: MyColors.color3,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(25),
                                                  side: BorderSide(
                                                      color: MyColors.color1,
                                                      width: 2)),
                                              child: Row(
                                                children: [
                                                  Icon(
                                                    Icons.screenshot,
                                                    size: 11,
                                                    color: Colors.white,
                                                  ),
                                                  SizedBox(
                                                    width: 5,
                                                  ),
                                                  Text("لقطة شاشة ",
                                                      style: TextStyle(
                                                          color:
                                                              MyColors.color3,
                                                          fontSize: 11,
                                                          fontFamily:
                                                              'Almarai')),
                                                ],
                                              ),
                                            ),
                                            RaisedButton(
                                              onPressed: () {},
                                              color: MyColors.color1,
                                              elevation: 10,
                                              splashColor: MyColors.color3,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(25),
                                                  side: BorderSide(
                                                      color: MyColors.color1,
                                                      width: 2)),
                                              child: Row(
                                                children: [
                                                  Icon(
                                                    Icons.download,
                                                    size: 11,
                                                    color: Colors.white,
                                                  ),
                                                  SizedBox(
                                                    width: 5,
                                                  ),
                                                  Text("تحميل PDF ",
                                                      style: TextStyle(
                                                          color:
                                                              MyColors.color3,
                                                          fontSize: 11,
                                                          fontFamily:
                                                              'Almarai')),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                          width: double.infinity,
                                          height: 44,
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
                                              Navigator.of(context)
                                                  .pushNamed("register1Main");
                                            },
                                            child: const Text(
                                              "العودة إلى المحفظة",
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
                                size: 40,
                                color: Colors.white,
                              ),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: MyColors.color1),
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
