import 'dart:io';
import 'dart:math';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:rayan/control/homecontroller.dart';
import 'package:rayan/model/modeApi/modelMedia/get_user_profile_withmedia.dart';
import 'package:rayan/model/modeApi/modelPorfile/image_upload.dart';
import 'package:rayan/model/modeApi/modelLogin/login_model.dart';
import 'package:rayan/utils/constant/color.dart';
import 'package:rayan/view/auth/widget/themeWst.dart';
import 'package:rayan/view/other/homeMainScreens/widget_winner.dart';
import 'package:rayan/view/other/setting/profile/dialog_edit.dart';
import 'package:rayan/view/other/setting/profile/widgetRowForProfil.dart';
import 'package:rayan/view/other/setting/profile/widgetrowOfLinkSocialMedia.dart';
import 'package:rayan/view/other/widget/design_appbar.dart';

class sittingProfile extends StatefulWidget {
  sittingProfile({Key? key}) : super(key: key);

  @override
  State<sittingProfile> createState() => _sittingProfileState();
}

class _sittingProfileState extends State<sittingProfile> {
  var username;
  var firstName;
  var midName;
  var lastName;
  var telephoneNumber;
  var countryId;
  getpref() async {
    SharedPreferences pres = await SharedPreferences.getInstance();
    setState(() {
      username = pres.getString('userName');
      firstName = pres.getString('firstName');
      midName = pres.getString('midName');
      lastName = pres.getString('lastName');
      telephoneNumber = pres.getString('telephoneNumber');
      countryId = pres.getInt('countryId');
    });
  }

  @override
  void initState() {
    super.initState();
    getpref();
  }

  homecontroller controller = Get.put(homecontroller());

  Future<void> _showChoiceDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              "Choose option",
              style: TextStyle(color: Colors.blue),
            ),
            content: SingleChildScrollView(
              child: ListBody(
                children: [
                  Divider(
                    height: 1,
                    color: Colors.blue,
                  ),
                  ListTile(
                    onTap: () {
                      _openGallery(context);
                    },
                    title: Text("Gallery"),
                    leading: Icon(
                      Icons.account_box,
                      color: Colors.blue,
                    ),
                  ),
                  Divider(
                    height: 1,
                    color: Colors.blue,
                  ),
                  ListTile(
                    onTap: () {
                      _openCamera(context);
                    },
                    title: Text("Camera"),
                    leading: Icon(
                      Icons.camera,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  var _image;
  void _openGallery(BuildContext context) async {
    String fileName = "";
    final pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
    );
    setState(() {
      if (pickedFile != null) {
        imageFile = pickedFile;
        print("************************");
        print(imageFile);

        fileName = imageFile!.path.split('/').last;
        // controller.SavePathImage(fileName);

      } else {
        print("not select image");
      }
    });
    print(fileName);
    await Upload(File(imageFile!.path), fileName);
    Navigator.pop(context);
  }

  void _openCamera(BuildContext context) async {
    String fileName = "";
    final pickedFile = await ImagePicker().getImage(
      source: ImageSource.camera,
    );
    setState(() {
      if (pickedFile != null) {
        imageFile = pickedFile;
        print("************************");
        print(imageFile);

        fileName = imageFile!.path.split('/').last;
        // controller.SavePathImage(fileName);

      } else {
        print("not select image");
      }
    });
    print(fileName);
    await Upload(File(imageFile!.path), fileName);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        containerMaine(),
        Container(
          decoration: boxDecorationMain(),
        ),
        // rowAppbar(context),
        ListView(
          shrinkWrap: true,
          children: [
            // rowAppbar(context),
            Container(
              margin: EdgeInsets.all(15),
              height: 500,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Color(0xff414D72), Color(0xff121E39)]),
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: GetBuilder<homecontroller>(builder: (controller) {
                    return Column(
                      children: [
                        SizedBox(
                          height: 30,
                        ),
                        Row(
                          children: [
                            Expanded(
                                flex: 1,
                                child: GetBuilder<homecontroller>(
                                    builder: (controller) {
                                  return (Container(
                                    alignment: Alignment.topRight,
                                    width: 44,
                                    height: 44,
                                    child: CircleAvatar(
                                      radius: 50,
                                      backgroundColor: MyColors.color1,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(50),
                                        child: (controller.savePathImage ==
                                                null)
                                            ? Icon(Icons.image_not_supported)
                                            : Image.network(
                                                controller.savePathImage,
                                                width: 44,
                                                height: 44,
                                                fit: BoxFit.fitHeight,
                                              ),
                                      ),
                                    ),
                                  ));
                                })),
                            Expanded(
                                flex: 1,
                                child: Text(
                                    usernamepref == null
                                        ? ""
                                        : usernamepref.toString().length > 5
                                            ? '${usernamepref.toString().substring(0, 5)}...'
                                            : usernamepref.toString(),
                                    style: TextStyle(
                                        color: Color(0xff707070),
                                        fontSize: 13,
                                        fontFamily: 'Almarai'))
                                //  Text(
                                //     usernamepref == null ? "" : usernamepref,
                                //     style: TextStyle(
                                //         color: Colors.white,
                                //         fontSize: 13,
                                //         fontFamily: 'Almarai'))
                                ),
                            Expanded(
                                flex: 2,
                                child: Container(
                                  width: 127,
                                  height: 37,
                                  child: RaisedButton.icon(
                                    onPressed: () {
                                      print('Button Clicked.');
                                      _showChoiceDialog(context);
                                      // Navigator.of(context).pushNamed("UploadImageScreen");
                                    },
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(25.0))),
                                    label: Text(
                                      "تغيير الصورة الشخصية",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 11,
                                          fontFamily: 'Almarai'),
                                    ),
                                    icon: Icon(
                                      Icons.camera_alt,
                                      color: Colors.white,
                                    ),
                                    textColor: Colors.white,
                                    splashColor: Colors.white,
                                    color: Color(0xff464699),
                                  ),
                                )),
                          ],
                        ),

                        Row(
                          children: [
                            Expanded(
                                child: Container(
                              alignment: Alignment.topRight,
                              child: Text("اسم المستخدم",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 13,
                                      fontFamily: 'Almarai')),
                            )),
                            Expanded(
                                child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                  alignment: Alignment.topLeft,
                                  margin: EdgeInsets.all(20),
                                  child: Text(
                                      controller.userName == null
                                          ? ""
                                          : controller.userName,
                                      style: TextStyle(
                                          color: Color(0xff707070),
                                          fontSize: 13,
                                          fontFamily: 'Almarai')),
                                ),
                                Container(
                                  child: Text(""),
                                )
                              ],
                            ))
                          ],
                        ),
                        Container(
                          height: 2,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                  colors: [
                                    Color.fromARGB(255, 32, 53, 104),
                                    Color(0xff414D72)
                                  ]),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                        ),
                        Row(
                          children: [
                            Expanded(
                                child: Container(
                              alignment: Alignment.topRight,
                              child: Text("الاسم الأول",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 13,
                                      fontFamily: 'Almarai')),
                            )),
                            Expanded(
                                child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                  margin: EdgeInsets.all(20),
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                      controller.saveFirstName == null
                                          ? ""
                                          : controller.saveFirstName.toString(),
                                      style: TextStyle(
                                          color: Color(0xff707070),
                                          fontSize: 13,
                                          fontFamily: 'Almarai')),
                                ),
                                Container(
                                  child: Text(""),
                                )
                              ],
                            ))
                          ],
                        ),
                        Container(
                          height: 2,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                  colors: [
                                    Color.fromARGB(255, 32, 53, 104),
                                    Color(0xff414D72)
                                  ]),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                        ),
                        Row(
                          children: [
                            Expanded(
                                child: Container(
                              alignment: Alignment.topRight,
                              child: Text("اسم الأب",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 13,
                                      fontFamily: 'Almarai')),
                            )),
                            Expanded(
                                child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                  margin: EdgeInsets.all(20),
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                      controller.saveMidName == null
                                          ? ""
                                          : controller.saveMidName.toString(),
                                      style: TextStyle(
                                          color: Color(0xff707070),
                                          fontSize: 13,
                                          fontFamily: 'Almarai')),
                                ),
                                Container(
                                  child: Text(""),
                                )
                              ],
                            ))
                          ],
                        ),
                        Container(
                          height: 2,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                  colors: [
                                    Color.fromARGB(255, 32, 53, 104),
                                    Color(0xff414D72)
                                  ]),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                        ),
                        Row(
                          children: [
                            Expanded(
                                child: Container(
                              alignment: Alignment.topRight,
                              child: Text("الكنية",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 13,
                                      fontFamily: 'Almarai')),
                            )),
                            Expanded(
                                child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                  margin: EdgeInsets.all(20),
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                      controller.saveLastName == null
                                          ? ""
                                          : controller.saveLastName
                                                      .toString()
                                                      .length >
                                                  5
                                              ? '${controller.saveLastName.toString().substring(0, 5)}...'
                                              : controller.saveLastName
                                                  .toString(),
                                      style: TextStyle(
                                          color: Color(0xff707070),
                                          fontSize: 13,
                                          fontFamily: 'Almarai')),
                                ),
                                Container(
                                  child: Text(""),
                                )
                              ],
                            ))
                          ],
                        ),
                        Container(
                          height: 2,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                  colors: [
                                    Color.fromARGB(255, 32, 53, 104),
                                    Color(0xff414D72)
                                  ]),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                        ),
                        Row(
                          children: [
                            Expanded(
                                child: Container(
                              alignment: Alignment.topRight,
                              child: Text("كود التحويل",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 13,
                                      fontFamily: 'Almarai')),
                            )),
                            Expanded(
                                child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                  margin: EdgeInsets.all(20),
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                      controller.saveCountryid.toString() ==
                                              null
                                          ? ""
                                          : controller.savepreuniqueCodepref
                                              .toString(),
                                      style: TextStyle(
                                          color: Color(0xff707070),
                                          fontSize: 13,
                                          fontFamily: 'Almarai')),
                                ),
                                // Container(
                                //   child: Text(""),
                                // )
                                InkWell(
                                    onTap: () async {
                                      // await Clipboard.setData(ClipboardData(
                                      //   text: controller.savepreuniqueCodepref
                                      //       .toString(),
                                      // )

                                      await Clipboard.setData(ClipboardData(
                                              text: controller
                                                  .savepreuniqueCodepref
                                                  .toString()))
                                          .then((_) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                                content: Text(
                                                    "تم نسخ كود التحويل")));
                                      });
                                    },
                                    child: Icon(
                                      Icons.copy,
                                      color: Colors.white,
                                      size: 20,
                                    ))
                              ],
                            ))
                          ],
                        ),
                        Container(
                          height: 2,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                  colors: [
                                    Color.fromARGB(255, 32, 53, 104),
                                    Color(0xff414D72)
                                  ]),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                        ),
                        Row(
                          children: [
                            Expanded(
                                child: Container(
                              alignment: Alignment.topRight,
                              child: Text("رقم الهاتف",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 13,
                                      fontFamily: 'Almarai')),
                            )),
                            Expanded(
                                child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                  alignment: Alignment.topLeft,
                                  margin: EdgeInsets.all(20),
                                  child: Text(
                                      controller.saveNumberPhone == null
                                          ? ""
                                          : controller.saveNumberPhone,
                                      style: TextStyle(
                                          color: Color(0xff707070),
                                          fontSize: 13,
                                          fontFamily: 'Almarai')),
                                ),
                                Container(
                                  child: Text(""),
                                )
                              ],
                            ))
                          ],
                        ),
                        Container(
                          height: 2,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                  colors: [
                                    Color.fromARGB(255, 32, 53, 104),
                                    Color(0xff414D72)
                                  ]),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                        ),

                        // Container(
                        //   height: 2,
                        //   decoration: BoxDecoration(
                        //       gradient: LinearGradient(
                        //           begin: Alignment.centerLeft,
                        //           end: Alignment.centerRight,
                        //           colors: [
                        //             Color.fromARGB(255, 32, 53, 104),
                        //             Color(0xff414D72)
                        //           ]),
                        //       borderRadius:
                        //           BorderRadius.all(Radius.circular(20))),
                        // ),
                        // Row(
                        //   children: [
                        //     Expanded(
                        //         child: Container(
                        //       alignment: Alignment.topRight,
                        //       child: Text("رقم الواتساب",
                        //           style: TextStyle(
                        //               color: Colors.white,
                        //               fontSize: 13,
                        //               fontFamily: 'Almarai')),
                        //     )),
                        //     Expanded(
                        //         child: Row(
                        //       mainAxisAlignment: MainAxisAlignment.end,
                        //       children: [
                        //         Container(
                        //           alignment: Alignment.topLeft,
                        //           child: Text("رابط",
                        //               style: TextStyle(
                        //                   color: Color(0xff707070),
                        //                   fontSize: 13,
                        //                   fontFamily: 'Almarai')),
                        //         ),
                        //         IconButton(
                        //             onPressed: () {},
                        //             icon: Icon(
                        //               Icons.navigate_next,
                        //               color: Colors.white,
                        //             ))
                        //       ],
                        //     ))
                        //   ],
                        // ),
                        // Container(
                        //   height: 2,
                        //   decoration: BoxDecoration(
                        //       gradient: LinearGradient(
                        //           begin: Alignment.centerLeft,
                        //           end: Alignment.centerRight,
                        //           colors: [
                        //             Color.fromARGB(255, 32, 53, 104),
                        //             Color(0xff414D72)
                        //           ]),
                        //       borderRadius:
                        //           BorderRadius.all(Radius.circular(20))),
                        // ),
                        SizedBox(
                          height: 30,
                        ),
                        InkWell(
                          child: Text("تعديل المعلومات",
                              style: TextStyle(
                                  color: MyColors.color1,
                                  fontSize: 13,
                                  fontFamily: 'Almarai')),
                          onTap: () {
                            showLoading(context);
                          },
                        )
                      ],
                    );
                  })),
            ),
            /* Container(
                margin: EdgeInsets.all(15),
                height: 300,
                width: MediaQuery.of(context).size.width,
                child: Stack(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          height: 30,
                          width: 148,
                          color: Colors.transparent,
                        ),
                        Expanded(
                          child: Container(
                              height: MediaQuery.of(context).size.width,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      Color(0xff414D72),
                                      Color(0xff121E39)
                                    ]),
                              ),
                              child: widgetrowOfLinkSocialMedia(context)),
                        )
                      ],
                    ),
                    Positioned(
                      // left: 46,
                      top: 0.0,
                      left: (MediaQuery.of(context).size.width) / 2 - 31,

                      // (background container size) - (circle height / 2)
                      child: Center(
                        child: Container(
                          height: 63.0,
                          width: 63.0,
                          child: Icon(
                            Icons.book,
                            color: Colors.white,
                          ),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color.fromARGB(255, 216, 99, 153)),
                        ),
                      ),
                    )
                  ],
                ))*/
          ],
        )
      ],
    ));
  }
}
