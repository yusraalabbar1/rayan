import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class homecontroller extends GetxController {
  //information user
  // getAllpref() async {
  //   SharedPreferences pres = await SharedPreferences.getInstance();
  //   userId = pres.getInt('id')!;
  //   userName = pres.getString('userName')!;
  //   newPassword = pres.getString('password')!;
  //   saveFirstName = pres.getString('firstName')!;
  //   saveMidName = pres.getString('midName')!;
  //   saveLastName = pres.getString('lastName')!;
  //   saveCountryid = pres.getInt('countryId')!;
  //   savecityId = pres.getInt('cityId')!;
  //   saveimageProfile = pres.getString('imageProfile')!;
  //   savemarketingCodeeSavepref = pres.getString('marketingCode')!;
  //   saveNumberPhone = pres.getString('telephoneNumber')!;
  //   savepreuniqueCodepref = pres.getString('uniqueCode')!;
  // }

  String saveCountryName = "";
  int saveCountryid = 0;
  String saveNumberPhone = "";
  String savecityName = "";
  int savecityId = 0;
  String saveFirstName = "";
  String saveMidName = "";
  String saveLastName = "";
  String saveEmail = "";
  int saveCountryCode = 0;
  String userName = "";
  String passWord = "";
  int userId = 0;
  String newPassword = "";
  String saveEmailForNewPassWord = "";
//end
  String nameComp = "";
  double monyrComp = 0.0;
  String discrpComp = "";
  int indexAgent = 0;
  String nameFake = "";
  var i = 0;
  int indexCopititon = 0;
  int indexCopititonVote = 0;
  int indexWinner = 0;
  int i_agent = 0;
  var devicIdsave;
  var savePathImage;
  String saveLinkFace = "";
  String saveLinkInsta = "";
  String saveLinktele = "";
  int saveidComp = 0;
  var saveamount;
  List<Map> saveListNotifications = [];
  List<Map> saveMapCompitition = [];
  List<Map> savememberInCompt = [];
  List<Map> saveListWinner = [];
  List saveImagesAgents = [];
  List<Map> saveMediaAgents = [];
  List<Map> saveListWinnerQuestion = [];
  List<Map> saveListWinnerAnswer = [];

  var saveIsFinishComp;
  var saveCodeMarkting;
  var savecurrentTourName;
  var savecurrentTourTimeLimit;
  var saveUsersIsLogin;
  var saveMemberId;
  var saveimageProfile;
  var savemarketingCodeeSavepref;
  var savebalanceForUser;

  var saveMemberIdCompt;

  var saveImageComp;
  var savepreuniqueCodepref;
  var saveUserToken;

  var savegetComptWinnerNickName;
  var savegetComptWinnerNumbeVote;
  var savegetComptWinnerid;
  var savememberImageUrl;
  var saverecivedLog;
  var saveregisterLog;

  var saveCountryCodeSignUp;

  void SaveCountryCodeSignUp(string) {
    print("control value SaveCountryCodeSignUp is:");
    saveCountryCodeSignUp = string;
    update();
  }

  void SaverecivedLog(string) {
    print("control value SaverecivedLog is:");
    saverecivedLog = string;
    update();
  }

  void SaveregisterLog(string) {
    print("control value SaveregisterLog is:");
    saveregisterLog = string;
    update();
  }

  /********************************************* */
  void SavememberImageUrl(string) {
    print("control value savememberImageUrl is:");
    savememberImageUrl = string;
    update();
  }

  void incremental(count) {
    count = count++;
    update();
  }

  void SaveListWinnerAnswer(string) {
    print("control value SaveListWinnerAnswer is:");
    saveListWinnerAnswer = string;
    update();
  }

  void SavegetComptWinnerid(string) {
    print("control value SavegetComptWinnerid is:");
    savegetComptWinnerid = string;
    update();
  }

  void SavegetComptWinnerNumbeVote(string) {
    print("control value SavegetComptWinnerNumbeVote is:");
    savegetComptWinnerNumbeVote = string;
    update();
  }

  void SavegetComptWinnerNickName(string) {
    print("control value SavegetComptWinnerNickName is:");
    savegetComptWinnerNickName = string;
    update();
  }

  void SaveListWinnerQuestion(string) {
    print("control value SaveListWinnerQuestion is:");
    saveListWinnerQuestion = string;
    update();
  }

  void SaveUserToken(string) {
    print("control value saveUserToken is:");
    saveUserToken = string;
    update();
  }

  void SavepreuniqueCodepref(string) {
    print("control value savepreuniqueCodepref is:");
    savepreuniqueCodepref = string;
    update();
  }

  void SaveindexCopititon(string) {
    print("control value SaveindexCopititon is:");
    indexCopititon = string;
    update();
  }

  void SaveIdPageCopititio(string) {
    print("control value SaveIdPageCopititio is:");
    i = string;
    update();
  }

  void SaveindexCopititonVote(string) {
    print("control value SaveindexComp is:");
    indexCopititonVote = string;
    update();
  }

  void SaveImageComp(string) {
    print("control value SaveImageComp is:");
    saveImageComp = string;
    update();
  }

  void SaveMemberIdCompt(string) {
    print("control value saveMemberIdCompt is:");
    saveMemberIdCompt = string;
    update();
  }

  void SavemarketingCodeeSavepref(string) {
    print("control value savemarketingCodeeSavepref is:");
    savemarketingCodeeSavepref = string;
    update();
  }

  void SavebalanceForUser(string) {
    print("control value savebalanceForUser is:");
    if (string == null) {
      savebalanceForUser = "";
    } else {
      savebalanceForUser = string;
    }
    update();
  }

  void SaveimageProfile(string) {
    print("yusraaaaaaaaaaaaaaaaaaaaaaaaaaaaa");
    print(string);
    print("control value saveimageProfile is:");
    saveimageProfile = string;
    update();
  }

  void SaveMediaAgents(string) {
    print("control value SaveMediaAgents is:");
    saveMediaAgents = string;
    update();
  }

  void SaveImagesAgents(string) {
    print("control value SaveImagesAgents is:");
    saveImagesAgents = string;
    update();
  }

  void SaveIsFinishComp(string) {
    print("control value SaveIsFinishComp is:");
    saveIsFinishComp = string;
    update();
  }

  void SaveListWinner(string) {
    print("control value saveListWinner is:");
    saveListWinner = string;
    update();
  }

  var savememberInComptlength;

  void SavememberInComptlength(string) {
    print("control value SavememberInComptlength is:");
    savememberInComptlength = string;
    update();
  }

  void SavememberInCompt(string) {
    print("control value savememberInCompt is:");
    savememberInCompt = string;
    update();
  }

  void SaveMemberId(string) {
    print("control value saveMemberId is:");
    saveMemberId = string;
    update();
  }

  void Saveamount(string) {
    print("control value saveamount is:");
    saveamount = string;
    update();
  }

  void SavecurrentTourTimeLimit(string) {
    print("control value saveUsersIsLogin is:");
    savecurrentTourTimeLimit = string;
    update();
  }

  void SavecurrentTourName(string) {
    print("control value savecurrentTourName is:");
    savecurrentTourName = string;
    update();
  }

  void SaveUsersIsLogin(string) {
    print("control value SaveUsersIsLogin is:");
    saveUsersIsLogin = string;
    update();
  }

  void SaveCodeMarkting(string) {
    print("control value SaveCodeMarkting is:");
    saveCodeMarkting = string;
    update();
  }

  void SaveListNotifications(string) {
    print("control value SaveListNotifications is:");
    saveListNotifications = string;
    update();
  }

  void SaveMapCompitition(string) {
    print("control value SaveMapCompitition is:");
    saveMapCompitition = string;
    update();
  }

  void SaveidComp(string) {
    print("control value SaveidComp is:");
    saveidComp = string;
    update();
  }

  void SaveLinktele(string) {
    print("control value telegram is:");
    saveLinktele = string;
    update();
  }

  void SaveLinkInsta(string) {
    print("control value insta is:");
    saveLinkInsta = string;
    update();
  }

  void SaveLinkFace(string) {
    print("control value face is:");
    saveLinkFace = string;
    update();
  }

  void SavePathImage(string) async {
    print("wwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww");
    print(string);
    print("control value path image is:");
    savePathImage = string;
    update();
  }

  void SaveDeviceId(string) {
    print("control value devicIdsave is:");
    devicIdsave = string;
    update();
  }

  void Saveindexagent(string) {
    print("control value i_agent is:");
    i_agent = string;
    update();
  }

  void SaveindexWinner(string) {
    print("control value SaveindexWinner is:");
    indexWinner = string;
    update();
  }

  void SavenameFake(string) {
    print("control value nameFake is:");
    nameFake = string;
    update();
  }

  void IndexAgent(string) {
    print("control value indexAgent is:");
    indexAgent = string;
    update();
  }

  void SavediscrpComp(string) {
    print("control value SaveNewPassword is:");
    discrpComp = string;
    update();
  }

  void SavenameComp(string) {
    print("control value SaveNewPassword is:");
    nameComp = string;
    update();
  }

  void SavemonyrComp(string) {
    print("control value SaveNewPassword is:");
    monyrComp = string;
    update();
  }

  void SaveNewPassword(string) {
    print("control value SaveNewPassword is:");
    newPassword = string;
    update();
  }

  void SaveEmailForNewPassWord(string) {
    print("control value SaveNewPassword is:");
    saveEmailForNewPassWord = string;
    update();
  }

  void SaveUserId(string) {
    print("control value userid is:");
    userId = string;
    update();
  }

  void SaveUserName(string) {
    print("control value userName is:");
    userName = string;
    update();
  }

  void SavePassWord(string) {
    print("control value passWord is:");
    passWord = string;
    update();
  }

  void SaveCountryName(string) {
    print("control value SaveCountryName is:");
    saveCountryName = string;
    update();
  }

  void SaveCountryid(string) {
    print("control value SaveCountryid is :");
    saveCountryid = string;
    update();
  }

  void SaveCountryCode(string) {
    print("control value SaveCountryCode is :");
    saveCountryCode = string;
    update();
  }

  void SaveNumberPhone(string) {
    print("control value SaveNumberPhone is:");
    saveNumberPhone = string;
    update();
  }

  void SavecityName(string) {
    savecityName = string;
    update();
  }

  void SavecityId(string) {
    savecityId = string;
    update();
  }

  void SaveFirstName(string) {
    print("control value saveFirstName is:");
    saveFirstName = string;
    update();
  }

  void SaveMidName(string) {
    print("control value saveMidName is:");
    saveMidName = string;
    update();
  }

  void SaveLastName(string) {
    print("control value saveLastName is:");
    saveLastName = string;
    update();
  }

  void SaveEmail(string) {
    saveEmail = string;
    print("control value saveLastName is:");
    print(saveEmail);
    update();
  }
}
