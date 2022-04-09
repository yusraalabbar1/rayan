import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rayan/control/homecontroller.dart';
import 'package:rayan/model/modeApi/modelLogin/login_model.dart';
import 'package:rayan/model/modeApi/modelSetting/return_id_froml_email.dart';
import 'package:rayan/model/modeApi/modelsCompt/post_quistion_winner.dart';
import 'package:rayan/utils/constant/color.dart';
import 'package:rayan/view/auth/widget/themeWst.dart';
import 'package:rayan/view/other/widget/design_appbar.dart';

class quistWinner extends StatefulWidget {
  quistWinner({Key? key}) : super(key: key);

  @override
  State<quistWinner> createState() => _quistWinnerState();
}

class _quistWinnerState extends State<quistWinner> {
  var qus;
  List listqus = [];
  GlobalKey<FormState> formstate = new GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        containerMaine(),
        Container(
          decoration: boxDecorationMain(),
        ),
        Form(
          key: formstate,
          child: ListView(
            children: [
              ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                physics: ScrollPhysics(),
                itemCount: controller.saveListWinnerQuestion.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    margin: EdgeInsets.all(15),
                    padding: EdgeInsets.all(15),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [Color(0xff414D72), Color(0xff121E39)]),
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: Column(
                      children: [
                        controller.saveListWinnerQuestion[index]["active"] ==
                                true
                            ? Text(
                                controller.saveListWinnerQuestion[index]
                                    ["question"],
                                style: TextStyle(
                                    color: Color.fromARGB(255, 234, 235, 241),
                                    fontSize: 14,
                                    height: 1.5,
                                    fontFamily: 'Almarai'))
                            : Text(""),
                        SizedBox(
                          height: 20,
                        ),
                        Center(child:
                            GetBuilder<homecontroller>(builder: (controller) {
                          return (TextFormField(
                            style: TextStyle(color: MyColors.color3),
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                              hintText: '',
                            ),
                            validator: (text) {
                              if (text!.length < 2) {
                                return "can not enter less than 2";
                              }
                              return null;
                            },
                            onSaved: (string) {
                              print("on saved");
                              qus = string;
                              listqus.add(qus);
                              controller.SaveFirstName(string);
                            },
                          ));
                        })),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  );
                },
              ),
              Center(
                child: Container(
                  width: double.infinity,
                  height: 55,
                  margin: const EdgeInsets.only(
                      bottom: 10, right: 30, left: 30, top: 10),
                  child: RaisedButton(
                    color: MyColors.color2,
                    elevation: 10,
                    splashColor: MyColors.color3,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                        side: BorderSide(color: MyColors.color1, width: 2)),
                    onPressed: () {
                      var formdata = formstate.currentState;
                      if (formdata!.validate()) {
                        formdata.save();
                        postQuistionWiner(
                            idSaveprefpref, listqus[0], listqus[1], context);
                      }
                      print(listqus);
                    },
                    child: const Text(
                      "ارسال",
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
        )
      ],
    ));
  }
}
