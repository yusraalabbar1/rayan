import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rayan/model/modeApi/modelAgent/api_all_agents.dart';
import 'package:rayan/model/modeApi/modelLogin/login_model.dart';
import 'package:rayan/model/modeApi/modelSetting/model_numberNoti.dart';
import 'package:rayan/view/other/folderEmpty/file_empty.dart';
import 'package:rayan/control/homecontroller.dart';
import 'package:rayan/model/modeApi/balance/commissionBalance.dart';
import 'package:rayan/model/modeApi/balance/userBalancLog.dart';
import 'package:rayan/model/modeApi/balance/userBalance.dart';
import 'package:rayan/view/other/agentsScreens/agents_main.dart';
import 'package:rayan/view/other/drawer_main.dart';
import 'package:rayan/view/other/homeMainScreens/home_main.dart';
import 'package:rayan/view/other/register1Screens/register1_main.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class homePage extends StatefulWidget {
  homePage({Key? key}) : super(key: key);

  @override
  State<homePage> createState() => _homePageState();
}

homecontroller controller = Get.put(homecontroller());
final List<Widget> widgetOptions = <Widget>[
  agentsMain(),
  // pageEmpty(),
  register1Main(),
  homeMain(),
];

class _homePageState extends State<homePage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  int _page = 0;
  int numberOfNotification = 0;
  late String identifier;
  final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
  final FirebaseMessaging _fcm = FirebaseMessaging.instance;
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  Future<void> getNumberOfNotification() async {
    // get deviceid
    if (Platform.isAndroid) {
      var build = await deviceInfoPlugin.androidInfo;
      identifier = build.androidId!;
    } else {
      IosDeviceInfo iosInfo = await deviceInfoPlugin.iosInfo;
      identifier = iosInfo.identifierForVendor!;
    }

    int result = await getNumberOfNotificationServices(identifier);
    if (numberOfNotification != result) {
      setState(() {
        numberOfNotification = result;
      });
    }
  }

  Future sta() async {
    allAgent = [];
    await send_inf_loginupdate(usernamepref, passPref);
    await getpreflog();
    await getAllAgents(tokenloginresult, countryIdSaveprf, cityIdSavepref);
    await userBalanc();
    await userBalancLog();
    await comissionBalanc();
  }

  @override
  void initState() {
    super.initState();
    sta();
  }

///////////////////////////////////
  homecontroller controller = Get.put(homecontroller());
  var lim;

  int _selectedIndex = 2;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

//////////////////////////////////////
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      drawer: Drawer(
        child: drawerMain(context),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        index: 2,
        height: 60.0,
        items: <Widget>[
          InkWell(
            child: Image.asset(
              "assets/images/agents.png",
              width: 28,
              height: 28,
            ),
          ),
          // InkWell(
          //   child: Image.asset(
          //     "assets/images/winningcup.png",
          //     width: 28,
          //     height: 28,
          //   ),
          // ),
          InkWell(
            child: Image.asset(
              "assets/images/register1.png",
              width: 28,
              height: 28,
            ),
          ),
          InkWell(
            child: Image.asset(
              "assets/images/home.png",
              width: 28,
              height: 28,
            ),
          ),
        ],
        color: Color(0xff1C2948),
        backgroundColor: Colors.transparent,
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 500),
        onTap: _onItemTapped,
        letIndexChange: (index) => true,
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          allAgent = [];
          //winner = [];
          await send_inf_loginupdate(usernamepref, passPref);
          await getpreflog();
          await getAllAgents(
              tokenloginresult, countryIdSaveprf, cityIdSavepref);
          //await getWinner(tokenloginresult);

          await userBalanc();
          await userBalancLog();
          await comissionBalanc();
        },
        child: Center(
          child: widgetOptions.elementAt(_selectedIndex),
        ),
      ),
    );
  }
}
