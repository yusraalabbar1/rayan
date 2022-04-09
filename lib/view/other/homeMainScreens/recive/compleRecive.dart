import 'package:flutter/material.dart';
import 'package:rayan/utils/constant/color.dart';

class completRecive extends StatefulWidget {
  completRecive({Key? key}) : super(key: key);

  @override
  State<completRecive> createState() => _completReciveState();
}

class _completReciveState extends State<completRecive> {
  final formstate = GlobalKey<FormState>();

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
                expandedHeight: 200,
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
                                              child: Text("تم إيداع مبلغ ",
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
                                          height: 20,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Text("من حساب : ",
                                                style: TextStyle(
                                                    color: MyColors.color3,
                                                    fontSize: 13,
                                                    fontFamily: 'Almarai')),
                                            Text("Hussam alabd ullah",
                                                style: TextStyle(
                                                    color: MyColors.color3,
                                                    fontSize: 13,
                                                    fontFamily: 'Almarai')),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 30,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Text("تاريخ : ",
                                                style: TextStyle(
                                                    color: MyColors.color3,
                                                    fontSize: 13,
                                                    fontFamily: 'Almarai')),
                                            Text("25 / 01 /2021",
                                                style: TextStyle(
                                                    color: MyColors.color3,
                                                    fontSize: 11,
                                                    fontFamily: 'Almarai')),
                                            Text("الوقت :",
                                                style: TextStyle(
                                                    color: MyColors.color3,
                                                    fontSize: 13,
                                                    fontFamily: 'Almarai')),
                                            Text("09 : 39 AM",
                                                style: TextStyle(
                                                    color: MyColors.color3,
                                                    fontSize: 11,
                                                    fontFamily: 'Almarai')),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 30,
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
