import 'package:flutter/material.dart';
import 'package:rayan/model/modeApi/balance/commissionBalance.dart';
import 'package:rayan/model/modeApi/balance/userBalancLog.dart';
import 'package:rayan/model/modeApi/balance/userBalance.dart';
import 'package:rayan/model/modeApi/modelAgent/api_all_agents.dart';
import 'package:rayan/model/modeApi/modelLogin/login_model.dart';
import 'package:rayan/model/modeApi/modelsCompt/getWinner.dart';
import 'package:rayan/utils/constant/color.dart';
import 'package:rayan/view/auth/widget/themeWst.dart';

class welcom extends StatefulWidget {
  welcom({Key? key}) : super(key: key);

  @override
  State<welcom> createState() => _welcomState();
}

class _welcomState extends State<welcom> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  Future sta() async {
    allAgent = [];
    winner = [];
    await send_inf_loginupdate(usernamepref, passPref);
    await getpreflog();
    await getAllAgents(tokenloginresult, countryIdSaveprf, cityIdSavepref);
    //await getWinner(tokenloginresult);

    await userBalanc();
    await userBalancLog();
    await comissionBalanc();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    sta();
  }

  Future<bool> _onwillPop() async {
    return (await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            backgroundColor: MyColors.color2,
            title: new Text('الخروج من التطبيق',
                style: TextStyle(
                    color: Colors.white, fontSize: 13, fontFamily: 'Almarai')),
            content: new Text(' هل أنت متأكد من الخروج',
                style: TextStyle(
                    color: Colors.white, fontSize: 13, fontFamily: 'Almarai')),
            actions: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RaisedButton(
                    color: MyColors.color1,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                        side: BorderSide(color: MyColors.color1, width: 2)),
                    child: Text("نعم",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                            fontFamily: 'Almarai')),
                    onPressed: () {
                      Navigator.of(context).pop(true);
                    },
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  RaisedButton(
                    color: Color.fromARGB(255, 231, 38, 64),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                        side: BorderSide(
                            color: Color.fromARGB(255, 231, 38, 64), width: 2)),
                    child: Text("لا",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                            fontFamily: 'Almarai')),
                    onPressed: () {
                      Navigator.of(context).pop(false);
                    },
                  ),
                ],
              )
            ],
          ),
        )) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
          body: Stack(
            children: [
              // imageBackgroundContainer(),
              containerMaine(),
              Container(
                decoration: boxDecorationMain(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    wstContainer1(context),
                    Container(
                      margin: const EdgeInsets.only(bottom: 40),
                      child: const Text(
                        "",
                        style: TextStyle(
                            fontSize: 12,
                            color: MyColors.color3,
                            fontFamily: 'Almarai'),
                      ),
                    ),
                    Center(
                      child: buttonStart(MyColors.color2, MyColors.color1,
                          "هيا لنبدأ", MyColors.color3, context, "homePage"),
                    ),
                  ],
                ) /* add child content here */,
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  margin: EdgeInsets.only(bottom: 20),
                  child: Text(
                    "جميع الحقوق محفوظة لدى التطبيق 2022",
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
        onWillPop: _onwillPop);
  }
}
