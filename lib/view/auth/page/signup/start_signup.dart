import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rayan/model/modeApi/modelSetting/getcountery.dart';
import 'package:rayan/model/modelJson/Country_model.dart';
import 'package:rayan/utils/constant/color.dart';
import 'package:rayan/utils/constant/url.dart';
import 'package:rayan/view/auth/widget/linkS_social_media.dart';
import 'package:rayan/view/auth/widget/themeWst.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:rayan/control/homecontroller.dart';
import 'package:footer/footer.dart';
import 'package:footer/footer_view.dart';

class login extends StatefulWidget {
  login({Key? key}) : super(key: key);

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  homecontroller controller = Get.put(homecontroller());
  GlobalKey<ScaffoldState> scaffoldkey = new GlobalKey<ScaffoldState>();
  GlobalKey<FormState> formstate = new GlobalKey<FormState>();
  var TelephoneNumber;
  var _selected;
  var codeotp;
  var countryname;
  var index;
  @override
  void initState() {
    super.initState();
  }

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
              child: ListView(
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  wstContainer(context),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding:
                        const EdgeInsets.only(left: 50, right: 50, bottom: 10),
                    child: Text(
                      "Country".tr,
                      style: Theme.of(context).textTheme.headline4,
                    ),
                  ),

                  // ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 30, right: 30, bottom: 10),
                    child: Center(
                      child: Container(
                        height: 65,
                        width: 330,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: MyColors.color2,
                          boxShadow: [
                            BoxShadow(spreadRadius: 0.8),
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            GetBuilder<homecontroller>(builder: (controller) {
                              return (Expanded(
                                child: DropdownButtonHideUnderline(
                                  child: ButtonTheme(
                                    alignedDropdown: true,
                                    child: DropdownButton<dynamic>(
                                      isDense: true,
                                      dropdownColor: MyColors.color2,
                                      hint: Text(
                                        "Select country".tr,
                                        style: TextStyle(
                                          color: MyColors.color4,
                                        ),
                                      ),
                                      value: _selected,
                                      onChanged: (newValue) {
                                        setState(() {
                                          _selected = newValue!;
                                          print(_selected);
                                          // print(myJsonCountry[
                                          //         int.parse(_selected)]
                                          //     ["countryCode"]);
                                          for (var i = 0;
                                              i < myJsonCountry.length;
                                              i++) {
                                            if (myJsonCountry[i]["id"] ==
                                                int.parse(_selected)) {
                                              codeotp = myJsonCountry[i]
                                                  ["countryCode"];
                                              print('==================');
                                              print(codeotp);
                                              controller.SaveCountryCode(
                                                  int.parse(codeotp));
                                              controller.SaveCountryCodeSignUp(
                                                  _selected);
                                              print(controller.saveCountryCode);
                                              countryname = myJsonCountry
                                                  .map((Map map) =>
                                                      map["countryDescAr"])
                                                  .toList();
                                              controller.SaveCountryName(
                                                  countryname[i]);
                                              //print(i);
                                              //print(int.parse(_selected) - 1);
                                              print(countryname[i]);
                                              controller.SaveCountryid(i);

                                              break;
                                            } else {
                                              print('==================');
                                              print("not found");
                                            }
                                          }
                                        });

                                        /* countryname = myJsonCountry
                                            .map((Map map) =>
                                                map["countryDescAr"])
                                            .toList();
                                        controller.SaveCountryName(countryname[
                                            int.parse(_selected) - 1]);*/
                                      },
                                      items: myJsonCountry.map((Map map) {
                                        return DropdownMenuItem<dynamic>(
                                          value: map["id"].toString(),
                                          child: Row(
                                            children: <Widget>[
                                              Container(
                                                  child: Image.network(
                                                baseUrlAdmin +
                                                    "/images/" +
                                                    map["countryFlag"],
                                                height: 20,
                                                width: 20,
                                              )),
                                              Container(
                                                  margin: const EdgeInsets.only(
                                                      right: 10, left: 10),
                                                  child: Text(
                                                      map["countryDescAr"],
                                                      style: const TextStyle(
                                                        color: MyColors.color3,
                                                      ))),
                                            ],
                                          ),
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                ),
                              ));
                            }),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding:
                        const EdgeInsets.only(left: 50, right: 50, bottom: 10),
                    child: Text(
                      "phone number".tr,
                      style: Theme.of(context).textTheme.headline4,
                    ),
                  ),

                  Padding(
                    padding:
                        const EdgeInsets.only(left: 30, right: 30, bottom: 10),
                    child: Center(
                      child: GetBuilder<homecontroller>(builder: (controller) {
                        return (TextFormField(
                          enabled:
                              controller.saveCountryCode == "" ? false : true,
                          style: TextStyle(color: MyColors.color3),
                          keyboardType: TextInputType.number,

                          decoration: InputDecoration(
                              hintText: "Enter Your Number Phone".tr,
                              suffixText: "${controller.saveCountryCode}+"),

                          validator: (text) {
                            if (text!.length > 15) {
                              return "can not enter bigest than 15";
                            }
                            if (text.length < 9) {
                              return "can not enter less than 9";
                            }
                          },
                          onSaved: (string) {
                            print("on saved");
                            TelephoneNumber = string;
                            controller.SaveNumberPhone("00" +
                                "${controller.saveCountryCode}" +
                                string!);

                            // controller.SaveNumberPhone("00221778821171");
                          },
                          // onChanged: (value) {
                          //    controller.SaveNumberPhone(int.parse(value));
                          // },
                        ));
                      }),
                    ),
                  ),
                  Container(
                    padding:
                        const EdgeInsets.only(left: 50, right: 50, bottom: 10),
                    child: Text(
                      "Marketing Code  (optional)".tr,
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
                          onSaved: (string) {
                            print("on saved");
                            TelephoneNumber = string;
                            controller.SaveCodeMarkting(string);
                            //function for know is Exist or no
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
                          bottom: 30, right: 30, left: 30, top: 30),
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
                            Navigator.of(context).pushNamed("signup");
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
                            left: 50, right: 50, bottom: 30),
                        child: Text(
                          "Do you have an Account?".tr,
                          style: Theme.of(context).textTheme.headline4,
                        ),
                      ),
                      InkWell(
                        child: Container(
                          alignment: Alignment.centerRight,
                          padding: const EdgeInsets.only(bottom: 30),
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
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      margin: EdgeInsets.only(bottom: 10),
                      child: Text(
                        "contact customer service".tr,
                        style: TextStyle(
                            fontSize: 13,
                            color: MyColors.color3,
                            fontFamily: 'Almarai'),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                        margin: EdgeInsets.only(bottom: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            mediatwit("twitter".tr),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              "-",
                              style: TextStyle(color: MyColors.color3),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            mediawhat("Whatsapp".tr),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              "-",
                              style: TextStyle(color: MyColors.color3),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            mediatele("Telegram".tr),
                            const SizedBox(
                              width: 5,
                            ),
                          ],
                        )),
                  ),
                ],
              ),
            ),
          ),
          // Align(
          //   alignment: Alignment.bottomCenter,
          //   child: Container(
          //     margin: EdgeInsets.only(bottom: 40),
          //     child: Text(
          //       "تواصل مع خدمة العملاء",
          //       style: TextStyle(
          //           fontSize: 13,
          //           color: Color(0xffF5F5F9),
          //           fontFamily: 'Almarai'),
          //     ),
          //   ),
          // ),

          // Align(
          //   alignment: Alignment.bottomCenter,
          //   child: Container(
          //       margin: EdgeInsets.only(bottom: 20),
          //       child: Row(
          //         mainAxisAlignment: MainAxisAlignment.center,
          //         children: [
          //           media("فيسبوك"),
          //           const SizedBox(
          //             width: 5,
          //           ),
          //           media("-"),
          //           const SizedBox(
          //             width: 5,
          //           ),
          //           media("واتساب"),
          //           const SizedBox(
          //             width: 5,
          //           ),
          //           media("-"),
          //           const SizedBox(
          //             width: 5,
          //           ),
          //           media("تلغرام"),
          //           const SizedBox(
          //             width: 5,
          //           ),
          //         ],
          //       )),
          // ),
        ],
      ),
    );
  }
}

/////////////////*
