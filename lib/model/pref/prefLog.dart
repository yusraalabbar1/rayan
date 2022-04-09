import 'package:shared_preferences/shared_preferences.dart';

var isStart = false;
getpref() async {
  SharedPreferences pres = await SharedPreferences.getInstance();
  print("************************");
  print(pres.getBool('isLogin'));
  print("************************");

  if (pres.getBool('isLogin') == null) {
    isStart = false;
  } else {
    isStart = pres.getBool('isLogin')!;
    print(isStart);
  }
}
