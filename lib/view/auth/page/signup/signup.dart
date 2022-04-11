import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rayan/model/modeApi/modelSetting/getcountery.dart';
import 'package:rayan/utils/constant/color.dart';
import 'package:rayan/view/auth/widget/themeWst.dart';

import 'package:rayan/control/homecontroller.dart';

class signup extends StatefulWidget {
  signup({Key? key}) : super(key: key);

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
  homecontroller controller = Get.put(homecontroller());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("signup:************");

    myJsonCity = [];
    getCity(controller.saveCountryid - 1);
  }

  GlobalKey<FormState> formstate = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var firstName, midName, lastName;
    return Scaffold(
      body: Stack(
        children: [
          // imageBackgroundContainer(),
          containerMaine(),
          Container(
            decoration: boxDecorationMain(),
            child: Form(
              key: formstate,
              child: ListView(
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  wstContainer(context),
                  Container(
                    padding:
                        const EdgeInsets.only(left: 50, right: 50, bottom: 10),
                    child: Text(
                      "First Name".tr,
                      style: Theme.of(context).textTheme.headline4,
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 30, right: 30, bottom: 10),
                    child: Center(child:
                        GetBuilder<homecontroller>(builder: (controller) {
                      return (TextFormField(
                        style: TextStyle(color: MyColors.color3),
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          hintText: '',
                        ),
                        validator: (text) {
                          if (text!.length > 15) {
                            return "can not enter bigest than 15";
                          }
                          if (text.length < 2) {
                            return "can not enter less than 2";
                          }
                        },
                        onChanged: (value) {
                          // do something
                        },
                        onSaved: (string) {
                          print("on saved");
                          firstName = string;
                          controller.SaveFirstName(string);
                        },
                      ));
                    })),
                  ),
                  Container(
                    padding:
                        const EdgeInsets.only(left: 50, right: 50, bottom: 10),
                    child: Text(
                      "Name father".tr,
                      style: Theme.of(context).textTheme.headline4,
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 30, right: 30, bottom: 10),
                    child: Center(child:
                        GetBuilder<homecontroller>(builder: (controller) {
                      return (TextFormField(
                        style: TextStyle(color: MyColors.color3),
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          hintText: '',
                        ),
                        onChanged: (value) {
                          // do something
                        },
                        validator: (text) {
                          if (text!.length > 15) {
                            return "can not enter bigest than 15";
                          }
                          if (text.length < 2) {
                            return "can not enter less than 2";
                          }
                        },
                        onSaved: (string) {
                          print("on saved");
                          midName = string;
                          controller.SaveMidName(string);
                        },
                      ));
                    })),
                  ),
                  Container(
                    padding:
                        const EdgeInsets.only(left: 50, right: 50, bottom: 10),
                    child: Text(
                      "Last Name".tr,
                      style: Theme.of(context).textTheme.headline4,
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 30, right: 30, bottom: 10),
                    child: Center(child:
                        GetBuilder<homecontroller>(builder: (controller) {
                      return (TextFormField(
                        style: TextStyle(color: MyColors.color3),
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          hintText: '',
                        ),
                        onChanged: (value) {
                          // do something
                        },
                        validator: (text) {
                          if (text!.length > 15) {
                            return "can not enter bigest than 15";
                          }
                          if (text.length < 2) {
                            return "can not enter less than 2";
                          }
                        },
                        onSaved: (string) {
                          print("on saved");
                          lastName = string;
                          controller.SaveLastName(string);
                        },
                      ));
                    })),
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
                        splashColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                            side: BorderSide(color: MyColors.color1, width: 2)),
                        onPressed: () {
                          // Navigator.of(context).pushNamed("completSignUp");
                          var formdata = formstate.currentState;
                          if (formdata!.validate()) {
                            formdata.save();
                            Navigator.of(context).pushNamed("completSignUp");
                          }
                        },
                        child: Text(
                          "continue".tr,
                          style: TextStyle(
                              fontSize: 13,
                              color: MyColors.color3,
                              fontFamily: 'Almarai'),
                        ),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        alignment: Alignment.centerRight,
                        padding: const EdgeInsets.only(
                            left: 30, right: 50, bottom: 10),
                        child: Text(
                          "Do you have an Account?".tr,
                          style: Theme.of(context).textTheme.headline4,
                        ),
                      ),
                      InkWell(
                        child: Container(
                          alignment: Alignment.centerRight,
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Text(
                            "Login".tr,
                            style: Theme.of(context).textTheme.headline3,
                          ),
                        ),
                        onTap: () {
                          Navigator.of(context).pushNamed("oldLogin");
                        },
                      ),
                    ],
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
