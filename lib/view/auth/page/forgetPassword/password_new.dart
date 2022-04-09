import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rayan/control/homecontroller.dart';
import 'package:rayan/model/modeApi/modelLogin/verify_model_forget_password.dart';
import 'package:rayan/utils/constant/color.dart';
import 'package:rayan/view/auth/widget/themeWst.dart';

class passwordNew extends StatefulWidget {
  passwordNew({Key? key}) : super(key: key);

  @override
  State<passwordNew> createState() => _passwordNewState();
}

class _passwordNewState extends State<passwordNew> {
  homecontroller controller = Get.put(homecontroller());
  GlobalKey<FormState> formstate = new GlobalKey<FormState>();

  bool _isObscure = true;
  var password;
  FocusNode myFocusNode = new FocusNode();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // imageBackgroundContainer(),
          containerMaine(),
          Container(
            decoration: boxDecorationMain(),
            child: Form(
              key: formstate,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  wstContainer(context),
                  Container(
                    alignment: Alignment.centerRight,
                    padding:
                        const EdgeInsets.only(left: 30, right: 50, bottom: 10),
                    child: Text(
                      "New password".tr,
                      style: Theme.of(context).textTheme.headline4,
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 30, right: 30, bottom: 10),
                    child: Center(
                      child: GetBuilder<homecontroller>(builder: (controller) {
                        return (TextFormField(
                          style: TextStyle(color: MyColors.color3),
                          obscureText: _isObscure,
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                                icon: Icon(_isObscure
                                    ? Icons.visibility
                                    : Icons.visibility_off),
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
                            print("on saved");
                            password = string;
                            controller.SaveNewPassword(string);
                          },
                          onChanged: (value) {
                            // do something
                          },
                        ));
                      }),
                    ),
                  ),
                  Center(
                    child: Container(
                      width: double.infinity,
                      height: 55,
                      margin: EdgeInsets.only(
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
                            generate();
                            Navigator.of(context).pushNamed("pinPassword");
                          }
                        },
                        child: Text(
                          "Reset".tr,
                          style: TextStyle(
                              fontSize: 13,
                              color: MyColors.color3,
                              fontFamily: 'Almarai'),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
