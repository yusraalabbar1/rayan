import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rayan/control/homecontroller.dart';
import 'package:rayan/model/modeApi/modelSetting/return_id_froml_email.dart';
import 'package:rayan/utils/constant/color.dart';
import 'package:rayan/view/auth/widget/themeWst.dart';

class emailForForgetPassword extends StatefulWidget {
  emailForForgetPassword({Key? key}) : super(key: key);

  @override
  State<emailForForgetPassword> createState() => _emailForForgetPasswordState();
}

class _emailForForgetPasswordState extends State<emailForForgetPassword> {
  homecontroller controller = Get.put(homecontroller());
  GlobalKey<FormState> formstate = new GlobalKey<FormState>();
  var email;
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
                      'User Name'.tr,
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
                          keyboardType: TextInputType.emailAddress,
                          onSaved: (string) {
                            print("on saved");
                            email = string;

                            controller.SaveEmailForNewPassWord(string);
                          },
                          validator: (text) {
                            if (text!.length < 2) {
                              return "can not enter less than 2";
                            }
                            return null;
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
                            getUserIdFromEmail(email, context);
                            // Navigator.of(context).pushNamed("passwordNew");
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
