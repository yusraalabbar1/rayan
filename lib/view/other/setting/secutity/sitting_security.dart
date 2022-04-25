import 'package:flutter/material.dart';
import 'package:rayan/view/auth/widget/themeWst.dart';
import 'package:rayan/view/other/widget/design_appbar.dart';

class sittingSecurity extends StatefulWidget {
  sittingSecurity({Key? key}) : super(key: key);

  @override
  State<sittingSecurity> createState() => _sittingSecurityState();
}

class _sittingSecurityState extends State<sittingSecurity> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        containerMaine(),
        Container(
          decoration: boxDecorationMain(),
        ),
        rowAppbar(context),
        ListView(
          shrinkWrap: true,
          children: [
            // rowAppbar(context),
            SizedBox(
              height: 60,
            ),
            Container(
                height: 150,
                margin: EdgeInsets.all(15),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Color(0xff414D72), Color(0xff121E39)]),
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      Expanded(
                          child: Row(
                        children: [
                          IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.lock,
                                color: Colors.white,
                              )),
                          Text("الأمان والخصوصية",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 13,
                                  fontFamily: 'Almarai'))
                        ],
                      )),
                      Row(
                        children: [
                          Expanded(
                              child: Container(
                            alignment: Alignment.topRight,
                            child: Text("كلمة المرور",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 13,
                                    fontFamily: 'Almarai')),
                          )),
                          Expanded(
                              child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                alignment: Alignment.topLeft,
                                child: Text("تغيير",
                                    style: TextStyle(
                                        color: Color(0xff707070),
                                        fontSize: 13,
                                        fontFamily: 'Almarai')),
                              ),
                              IconButton(
                                  onPressed: () {
                                    Navigator.of(context)
                                        .pushNamed("emailForForgetPassword");
                                    // Navigator.of(context)
                                    //     .pushNamed("emailForForgetPassword");
                                  },
                                  icon: Icon(
                                    Icons.navigate_next,
                                    color: Colors.white,
                                  ))
                            ],
                          ))
                        ],
                      ),
                      Container(
                        height: 2,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                colors: [
                                  Color.fromARGB(255, 32, 53, 104),
                                  Color(0xff414D72)
                                ]),
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                      ),
                      SizedBox(
                        height: 20,
                      )
                    ],
                  ),
                )),
          ],
        )
      ],
    ));
  }
}
