import 'package:flutter/material.dart';
import 'package:rayan/utils/constant/color.dart';

class choisReceive extends StatefulWidget {
  choisReceive({Key? key}) : super(key: key);

  @override
  State<choisReceive> createState() => _choisReceiveState();
}

class _choisReceiveState extends State<choisReceive> {
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
                                          height: 50,
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
                                                  .pushNamed("code");
                                            },
                                            child: const Text(
                                              "استقبال بكود التحويل",
                                              style: TextStyle(
                                                  fontSize: 13,
                                                  color: MyColors.color3,
                                                  fontFamily: 'Almarai'),
                                            ),
                                          ),
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
                                                  .pushNamed("qr");
                                            },
                                            child: const Text(
                                              " قراءة الـ QR ",
                                              style: TextStyle(
                                                  fontSize: 13,
                                                  color: MyColors.color3,
                                                  fontFamily: 'Almarai'),
                                            ),
                                          ),
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
                                                  .pushNamed("gallary");
                                            },
                                            child: const Text(
                                              "فتح المعرض",
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
                                Icons.menu,
                                size: 40,
                                color: Colors.white,
                              ),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color.fromARGB(255, 201, 75, 134)),
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
