import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:rayan/control/homecontroller.dart';
import 'package:rayan/utils/constant/color.dart';
import 'package:rayan/view/auth/widget/themeWst.dart';

import '../../../../model/modeApi/modelLogin/login_model.dart';

class oldLogin extends StatefulWidget {
  oldLogin({Key? key}) : super(key: key);

  @override
  State<oldLogin> createState() => _oldLoginState();
}

class _oldLoginState extends State<oldLogin> {
  GlobalKey<ScaffoldState> scaffoldkey = new GlobalKey<ScaffoldState>();
  GlobalKey<FormState> formstate = new GlobalKey<FormState>();

  homecontroller controller = Get.put(homecontroller());
  var email;
  var password;
  bool _isObscure = true;

  FocusNode myFocusNode = new FocusNode();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldkey,
      body: Stack(
        children: [
          // imageBackgroundContainer(),
          containerMaine(),
          Form(
            key: formstate,
            child: Container(
              decoration: boxDecorationMain(),
              child: ListView(
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  wstContainer(context),
                  SizedBox(
                    height: 50,
                  ),
                  Container(
                    alignment: Alignment.center,
                    padding:
                        const EdgeInsets.only(left: 50, right: 50, bottom: 10),
                    child: Text(
                      "Login".tr,
                      style: Theme.of(context).textTheme.headline4,
                    ),
                  ),
                  Container(
                    padding:
                        const EdgeInsets.only(left: 50, right: 50, bottom: 10),
                    child: Text(
                      "User Name".tr,
                      style: Theme.of(context).textTheme.headline4,
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 30, right: 30, bottom: 10),
                    child: Center(child:
                        GetBuilder<homecontroller>(builder: (controller) {
                      return (TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        style: TextStyle(color: MyColors.color3),
                        textInputAction: TextInputAction.next,
                        validator: (text) {
                          if (text!.length > 40) {
                            return "can not enter bigest than 40";
                          }
                          if (text.length < 2) {
                            return "can not enter less than 2";
                          }
                          return null;
                        },
                        onSaved: (string) {
                          email = string;
                          controller.SaveUserName(string);
                        },
                      ));
                    })),
                  ),
                  Container(
                    padding:
                        const EdgeInsets.only(left: 50, right: 50, bottom: 10),
                    child: Text(
                      "Pass Word".tr,
                      style: Theme.of(context).textTheme.headline4,
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 30, right: 30, bottom: 10),
                    child: Center(child:
                        GetBuilder<homecontroller>(builder: (controller) {
                      return (TextFormField(
                        textInputAction: TextInputAction.next,
                        style: TextStyle(color: MyColors.color3),
                        keyboardType: TextInputType.visiblePassword,
                        validator: (text) {
                          if (text!.length > 30) {
                            return "can not enter bigest than 30";
                          }
                          if (text.length < 2) {
                            return "can not enter less than 2";
                          }
                          return null;
                        },
                        obscureText: _isObscure,
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                              icon: Icon(_isObscure
                                  ? Icons.visibility_off
                                  : Icons.visibility),
                              onPressed: () {
                                setState(() {
                                  _isObscure = !_isObscure;
                                });
                              }),
                          labelStyle: TextStyle(
                              color: myFocusNode.hasFocus
                                  ? Color(0xffFAB10C)
                                  : Colors.black),
                        ),
                        onSaved: (string) {
                          password = string;
                          controller.SavePassWord(string);
                        },
                      ));
                    })),
                  ),
                  Row(
                    children: [
                      Container(
                        alignment: Alignment.centerRight,
                        padding: const EdgeInsets.only(
                            left: 50, right: 50, bottom: 10),
                        child: Text(
                          "Did you Forget Your Passord?".tr,
                          style: Theme.of(context).textTheme.headline4,
                        ),
                      ),
                      InkWell(
                        child: Container(
                          alignment: Alignment.centerRight,
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Text(
                            "Reset".tr,
                            style: Theme.of(context).textTheme.headline3,
                          ),
                        ),
                        onTap: () {
                          Navigator.of(context)
                              .pushNamed("emailForForgetPassword");
                        },
                      ),
                    ],
                  ),
                  Center(
                    child: Container(
                      width: double.infinity,
                      height: 55,
                      margin: const EdgeInsets.only(
                          bottom: 10, right: 30, left: 30, top: 10),
                      child: RaisedButton(
                        color: MyColors.color1,
                        elevation: 10,
                        splashColor: MyColors.color3,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                            side: BorderSide(color: MyColors.color1, width: 2)),
                        onPressed: () {
                          var formdata = formstate.currentState;
                          if (formdata!.validate()) {
                            formdata.save();
                            print(" validddddddddddddddd");
                            print("========information input==========");
                            print(email);
                            print(password);
                            print("========================");
                            send_inf_login(controller.userName,
                                controller.passWord, context);
                          } else {
                            print("not validddddddddddddddd");
                          }
                        },
                        child: Text(
                          "Login".tr,
                          style: TextStyle(
                              fontSize: 13,
                              color: MyColors.color3,
                              fontFamily: 'Almarai'),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
