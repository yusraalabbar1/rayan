import 'package:rayan/model/modeApi/modelLogin/login_model.dart';
import 'package:rayan/view/other/home_page.dart';

String URL_BASE = "http://94.127.214.222/WsaAPI/api";
String baseUrlAdmin = "http://94.127.214.222/WsaAdministration";
String url_agent_all = URL_BASE +
    "/agent/filter-agent?countryId=${countryIdSaveprf}&cityId=${cityIdSavepref}";
// String url_agent_all =
//     'http://212.24.108.54/wsa/api/agent/filter-agent?countryId=${id_country}&cityId=${id_city}';
String url_change_password = URL_BASE + "/user/changePassword";
String url_get_country = URL_BASE + "/lookup/Country";
String url_login = URL_BASE + '/user/login';
String url_signu = URL_BASE + "/user/registration";
String url_social_media = URL_BASE + '/setting?settingName=setting.facebook';
String otp_time = URL_BASE + '/setting?settingName=setting.otp.expiry.time';
String otp_verify_pass = URL_BASE + '/user/verifyOtp';
String otp_verify_signup = URL_BASE + '/user/verifyOtp';
String socialAll = URL_BASE + '/lookup/LookupValues';
String url_common_question = URL_BASE + '/commonQuestion';
String all_compitition = URL_BASE + "/Competitions/filter";
String one_compitition = URL_BASE + "/Competitions/filter?name=${"f"}";
String commissionUrl =
    URL_BASE + '/user/userCommissionBalances?UserId=${idSaveprefpref}';
