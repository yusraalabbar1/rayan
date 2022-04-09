import 'package:rayan/model/modeApi/modelLogin/login_model.dart';
import 'package:rayan/view/other/home_page.dart';

String URL_BASE = "http://212.24.108.54/wsa/api";
String url_agent_all =
    "http://212.24.108.54/wsa/api/agent/filter-agent?countryId=${countryIdSaveprf}&cityId=${cityIdSavepref}";
// String url_agent_all =
//     'http://212.24.108.54/wsa/api/agent/filter-agent?countryId=${id_country}&cityId=${id_city}';
String url_change_password = 'http://212.24.108.54/wsa/api/user/changePassword';
String url_get_country = "http://212.24.108.54/wsa/api/lookup/Country";
String url_login = 'http://212.24.108.54/wsa/api/user/login';
String url_signu = "http://212.24.108.54/wsa/api/user/registration";
String url_social_media =
    'http://212.24.108.54/wsa/api/setting?settingName=setting.facebook';
String otp_time =
    'http://212.24.108.54/wsa/api/setting?settingName=setting.otp.expiry.time';
String otp_verify_pass = 'http://212.24.108.54/wsa/api/user/verifyOtp';
String otp_verify_signup = 'http://212.24.108.54/wsa/api/user/verifyOtp';
String socialAll = 'http://212.24.108.54/wsa/api/lookup/LookupValues';
String url_common_question = 'http://212.24.108.54/wsa/api/commonQuestion';
String all_compitition = "http://212.24.108.54/wsa/api/Competitions/filter";
String one_compitition =
    "http://212.24.108.54/wsa/api/Competitions/filter?name=${"f"}";
