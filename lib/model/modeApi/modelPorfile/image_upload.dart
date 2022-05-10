import 'dart:convert';
import 'dart:io';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rayan/control/homecontroller.dart';
import 'package:http/http.dart' as http;
import 'package:rayan/model/modeApi/modelLogin/login_model.dart';
import 'package:dio/dio.dart' as dio;
import 'package:rayan/model/modelJson/addMember.dart';
import 'package:http_parser/http_parser.dart';
import 'package:async/async.dart';
import 'package:http_parser/http_parser.dart';
import 'package:rayan/utils/constant/url.dart';

Future uploadImage(File file, fileName) async {
  Map<String, dynamic> fields = {
    'userId': idSaveprefpref.toString(),
  };
  print(tokenloginresult);
  print(idSaveprefpref);
  print(fileName);
  print(file);
  print(file.runtimeType);
  Map<String, String> headers = {
    "Authorization": "Bearer ${tokenloginresult}",
    "Content-Type": "multipart/form-data"
  };
  // prepare to calling api
  var uploadImageRequest = MultipartRequest(
      'POST', Uri.parse(baseUrlAdmin + '/api/UserImage/updateUserProfile'));
  // add header
  uploadImageRequest.headers.addAll(headers);
  if (file != null) {
    uploadImageRequest.files.add(http.MultipartFile.fromBytes(
        'file', file.readAsBytesSync(),
        filename: fileName));
  }
  fields.forEach((k, v) => uploadImageRequest.fields[k] = v);
  // calling api
  var response = await uploadImageRequest.send();
  final responseString = await response.stream.bytesToString();
  print(response.statusCode);
  if (response.statusCode == 200) {
    var responseBody = jsonDecode(responseString);
    print(responseString);
  } else {}
}

//  var formData = dio.FormData.fromMap({'userId': idSaveprefpref.toString()});
//   formData.files
//       .add(MapEntry('file', await dio.MultipartFile.fromFile(file.path)));
//   var response = await dioHelper.dio.post('', data: formData);

Future uploadImage1(file, fileName) async {
  homecontroller controller = Get.put(homecontroller());
  var headers = {
    "Authorization": "Bearer ${tokenloginresult}",
    "Content-Type": "multipart/form-data"
  };
  var postUri = Uri.parse(baseUrlAdmin + "/api/UserImage/updateUserProfile");
  var request = http.MultipartRequest("POST", postUri);
  request.headers.addAll(headers);
  request.fields['userId'] = idSaveprefpref.toString();
  request.files.add(http.MultipartFile.fromBytes(
      'file', File(file!.path).readAsBytesSync(),
      filename: fileName));
  // http.StreamedResponse response = await request.send();

  request.send().then((response) async {
    var res = await http.Response.fromStream(response);
    AddMember c = AddMember.fromJson(jsonDecode(res.body));
    print(c.isSuccess);
    print(c.message);
    print(response.statusCode);

    if (response.statusCode == 200) {
      print("Uploaded!");
      // controller.SavePathImage(
      //     "http://212.24.108.54/wsaAdmin/images/user/" + fileName);
    }
  });
}

// Future uploadImage(File file, fileName) async {
//   homecontroller controller = Get.put(homecontroller());
//   print(file.path);
//   var headers = {
//     'Authorization': "Bearer $tokenloginresult",
//     "Content-Type": "multipart/form-data"
//   };
//   var request = http.MultipartRequest(
//       'POST',
//       Uri.parse(
//           'http://212.24.108.54/wsaAdmin/api/UserImage/updateUserProfile'));
//   request.fields.addAll({'userId': idSaveprefpref.toString()});
//   request.files.add(http.MultipartFile('file',
//       File(file.path).readAsBytes().asStream(), File(file.path).lengthSync(),
//       filename: file.path.split("/").last));
//   request.headers.addAll(headers);

//   http.StreamedResponse response = await request.send();

//   if (response.statusCode == 200) {
//     // controller.SavePathImage(
//     //     "http://212.24.108.54/wsaAdmin/images/" + imageProfileSavepref);
//     print(await response.stream.bytesToString());
//   } else {
//     print(response.reasonPhrase);
//   }
// }

Upload(File imageFile, fileName) async {
  homecontroller controller = Get.put(homecontroller());
  var stream =
      new http.ByteStream(DelegatingStream.typed(imageFile.openRead()));
  var length = await imageFile.length();
  var headers = {
    'Authorization': "Bearer ${tokenloginresult}",
    "Content-Type": "multipart/form-data"
  };
  var uri = Uri.parse(baseUrlAdmin + '/api/UserImage/updateUserProfile');

  var request = http.MultipartRequest("POST", uri);
  var multipartFile = http.MultipartFile('file', stream, length,
      filename: fileName, contentType: MediaType('image', 'jpg'));
  //contentType: new MediaType('image', 'png'));
  request.fields.addAll({'userId': idSaveprefpref.toString()});
  request.files.add(multipartFile);
  request.headers.addAll(headers);
  var response = await request.send();
  print(response.statusCode);
  response.stream.transform(utf8.decoder).listen((value) async {
    if (response.statusCode == 200) {
      send_inf_loginupdate(usernamepref, passPref);
      getpreflog();
      // controller.SavePathImage(
      //     "http://212.24.108.54/wsaAdmin/images/user/" + fileName);
      //getpreflog();
    }

    print(value);
  });
}

// Future uploadImage(File file, fileName) async {
//   print(fileName);
//   print(file);
//   var headers = {
//     'Authorization': "Bearer ${tokenloginresult}",
//     "Content-Type": "multipart/form-data"
//   };
//   var request = http.MultipartRequest(
//       'POST',
//       Uri.parse(
//           'http://212.24.108.54/wsaAdmin/api/UserImage/updateUserProfile'));
//   request.fields.addAll({'userId': idSaveprefpref.toString()});
//   request.files.add(await http.MultipartFile.fromPath('file', file.path));
//   request.headers.addAll(headers);

//   http.StreamedResponse response = await request.send();

//   if (response.statusCode == 200) {
//     print(await response.stream.bytesToString());
//   } else {
//     print(response.reasonPhrase);
//   }
// }

// Future uploadImage(file, fileName) async {
//   String path = file.path;
//   Map<String, String> data = {'userId': idSaveprefpref.toString()};

//   Map<String, String> headers = {
//     'X-Requested-With': 'XMLHttpRequest',
//     'authorization': "Bearer $tokenloginresult",
//   };

//   var request = http.MultipartRequest(
//     'POST',
//     Uri.parse('http://212.24.108.54/wsaAdmin/api/UserImage/updateUserProfile'),
//   );
//   request.fields.addAll(data);
//   request.headers.addAll(headers);
//   var multipartFile = await http.MultipartFile.fromPath(
//       'file', path); //returns a Future<MultipartFile>
//   request.files.add(multipartFile);
//   http.StreamedResponse response = await request.send();
//   final respStr = await response.stream.bytesToString();
//   var jsonData = jsonDecode(respStr);
//   if (response.statusCode == 200) {
//     print("200");
//     // success
//   } else {
//     // error
//   }
// }
