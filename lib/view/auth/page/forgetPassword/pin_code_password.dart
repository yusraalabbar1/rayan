import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:rayan/control/homecontroller.dart';
import 'package:rayan/model/modeApi/modelLogin/login_model.dart';
import 'package:rayan/model/modeApi/modelLogin/verify_model_forget_password.dart';
import 'package:rayan/model/modeApi/modelSetting/return_id_froml_email.dart';
import 'package:rayan/view/auth/widget/themeWst.dart';

class pinPassword extends StatefulWidget {
  pinPassword({Key? key}) : super(key: key);

  @override
  State<pinPassword> createState() => _pinPasswordState();
}

class _pinPasswordState extends State<pinPassword> {
  homecontroller controller = Get.put(homecontroller());
  TextEditingController textEditingController = TextEditingController();
  // ..text = "123456";

  // ignore: close_sinks
  StreamController<ErrorAnimationType>? errorController;

  bool hasError = false;
  String currentText = "";
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    errorController = StreamController<ErrorAnimationType>();
    super.initState();

    // _controller = AnimationController(
    //     vsync: this,
    //     duration: Duration(
    //         seconds:
    //             levelClock) // gameData.levelClock is a user entered number elsewhere in the applciation
    //     );
  }

  @override
  void dispose() {
    errorController!.close();

    super.dispose();
  }

  // snackBar Widget
  snackBar(String? message) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message!),
        duration: Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(children: [
        containerMaine(),
        Container(
            decoration: boxDecorationMain(),
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: ListView(
                children: <Widget>[
                  SizedBox(height: 30),
                  Container(
                    height: MediaQuery.of(context).size.height / 3,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: Image.asset("assets/images/illustration-3.png"),
                    ),
                  ),
                  SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Text('Phone Number Verification',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                            color: Color.fromARGB(255, 230, 234, 243)),
                        textAlign: TextAlign.center),
                  ),
                  GetBuilder<homecontroller>(builder: (controller) {
                    return (Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30.0, vertical: 8),
                      child: RichText(
                        text: TextSpan(
                            text: "Enter the code sent to ",
                            children: [
                              TextSpan(
                                  text: " ${controller.saveNumberPhone}",
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 93, 120, 179),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15)),
                            ],
                            style: TextStyle(
                                color: Color.fromARGB(255, 102, 136, 215),
                                fontSize: 15)),
                        textAlign: TextAlign.center,
                      ),
                    ));
                  }),
                  SizedBox(
                    height: 20,
                  ),
                  Form(
                    key: formKey,
                    child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 30),
                        child: Container(
                          color: Colors.transparent,
                          margin: EdgeInsets.all(10),
                          child: PinCodeTextField(
                            backgroundColor: Colors.transparent,
                            appContext: context,
                            pastedTextStyle: TextStyle(
                              color: const Color(0xff121E39),
                              fontWeight: FontWeight.bold,
                            ),
                            length: 4,
                            obscureText: true,
                            // obscuringCharacter: '*',
                            // obscuringWidget: FlutterLogo(
                            //   size: 24,
                            // ),
                            blinkWhenObscuring: true,
                            animationType: AnimationType.fade,
                            validator: (v) {
                              if (v!.length < 4) {
                                return "can not enter less than 4";
                              } else {
                                return null;
                              }
                            },
                            pinTheme: PinTheme(
                              shape: PinCodeFieldShape.box,
                              borderRadius: BorderRadius.circular(5),
                              fieldHeight: 50,
                              fieldWidth: 40,
                              activeFillColor: Colors.white,
                            ),
                            cursorColor: Color.fromARGB(255, 118, 138, 185),
                            animationDuration: Duration(milliseconds: 300),
                            enableActiveFill: true,
                            errorAnimationController: errorController,
                            controller: textEditingController,
                            keyboardType: TextInputType.number,
                            // boxShadows: [
                            //   BoxShadow(
                            //     offset: Offset(0, 1),
                            //     color: Colors.black12,
                            //     blurRadius: 10,
                            //   )
                            // ],
                            onCompleted: (v) {
                              print("Completed");
                            },
                            // onTap: () {
                            //   print("Pressed");
                            // },
                            onChanged: (value) {
                              print(value);
                              setState(() {
                                currentText = value;
                              });
                            },
                            beforeTextPaste: (text) {
                              print("Allowing to paste $text");
                              //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                              //but you can show anything you want here, like your pop up saying wrong paste format or etc
                              return true;
                            },
                          ),
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      hasError ? "*Please fill up all the cells properly" : "",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  // Padding(
                  //     padding: const EdgeInsets.only(right: 40, left: 40),
                  //     child: Row(
                  //       children: [
                  //         Text(
                  //           "الوقت المتبقي: ",
                  //           style: TextStyle(
                  //             color: Color.fromARGB(255, 255, 255, 255),
                  //             fontSize: 12,
                  //           ),
                  //         ),
                  //         SizedBox(
                  //           width: 20,
                  //         ),
                  //         Countdown(
                  //           animation: StepTween(
                  //             begin:
                  //                 levelClock, // THIS IS A USER ENTERED NUMBER
                  //             end: 0,
                  //           ).animate(_controller),
                  //         ),
                  //       ],
                  //     )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Didn't receive the code? ",
                        style: TextStyle(
                            color: Color.fromARGB(137, 132, 162, 227),
                            fontSize: 15),
                      ),
                      TextButton(
                          onPressed: () => snackBar("OTP resend!!"),
                          child: Text(
                            "RESEND",
                            style: TextStyle(
                                color: Color(0xff6268F1),
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ))
                    ],
                  ),
                  SizedBox(
                    height: 14,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: 16.0, horizontal: 30),
                    child: ButtonTheme(
                      height: 50,
                      child: TextButton(
                        onPressed: () {
                          formKey.currentState!.validate();
                          // conditions for validating
                          if (currentText.length != 4) {
                            errorController!.add(ErrorAnimationType
                                .shake); // Triggering error shake animation
                            setState(() => hasError = true);
                          } else {
                            setState(
                              () {
                                print("dddddddddddddd");
                                hasError = false;
                                verifyModelPassword(idSaveprefpref, currentText,
                                    context, controller.newPassword);
                              },
                            );
                          }
                        },
                        child: Center(
                            child: Text(
                          "VERIFY".toUpperCase(),
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        )),
                      ),
                    ),
                    decoration: BoxDecoration(
                      color: Color(0xff6268F1),
                      borderRadius: BorderRadius.circular(5),
                      // boxShadow: [
                      //   BoxShadow(
                      //       color: Color(0xff6268F1),
                      //       offset: Offset(1, -2),
                      //       blurRadius: 5),
                      //   BoxShadow(
                      //       color: Color(0xff6268F1),
                      //       offset: Offset(-1, 2),
                      //       blurRadius: 5)
                      // ]
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Flexible(
                          child: TextButton(
                        child: Text("Clear"),
                        onPressed: () {
                          textEditingController.clear();
                        },
                      )),
                      Flexible(
                          child: TextButton(
                        child: Text("Set Text"),
                        onPressed: () {
                          setState(() {
                            textEditingController.text = "0000";
                          });
                        },
                      )),
                    ],
                  )
                ],
              ),
            ))
      ]),
    );
  }
}

class Countdown extends AnimatedWidget {
  Countdown({Key? key, required this.animation})
      : super(key: key, listenable: animation);
  Animation<int> animation;

  @override
  build(BuildContext context) {
    Duration clockTimer = Duration(seconds: animation.value);

    String timerText =
        '${clockTimer.inMinutes.remainder(60).toString()}:${clockTimer.inSeconds.remainder(60).toString().padLeft(2, '0')}';

    print('animation.value  ${animation.value} ');
    print('inMinutes ${clockTimer.inMinutes.toString()}');
    print('inSeconds ${clockTimer.inSeconds.toString()}');
    print(
        'inSeconds.remainder ${clockTimer.inSeconds.remainder(60).toString()}');

    return Text(
      "$timerText",
      style: TextStyle(
        fontSize: 20,
        color: Color.fromARGB(255, 191, 187, 221),
      ),
    );
  }
}
