import 'dart:async';
import 'dart:convert';



import 'login_response.dart';
import 'network_util.dart';

class RestDatasource {
  NetworkUtil _netUtil = new NetworkUtil();
  static final BASE_URL = "https://beta.fembuddy.com/";
  static final LOGIN_URL = BASE_URL + "fem_login_v1";
  //static final _API_KEY = "somerandomkey";

  Future<LoginResponse> login(String username, String password) {
    String jwt;
    return _netUtil.post(LOGIN_URL, body: {
      "username": username,
      "password": password
    }).then((dynamic res) {
      print(res.toString());
      LoginResponse response = new LoginResponse.fromJson(res);
      //int statusCode = res["status_code"];
      //if (statusCode < 200 || statusCode > 400 || res == null) {

        print("succeeded");
        return new LoginResponse.fromJson(res);

      //var body = json.decode(res.body);
      //print(res.toString());
      //if(res["error"]) throw new Exception(res["error_msg"]);
      //return new User.map(res["user"]);
      //return new User(username,password);
      //return new User.map(res["user"]);
      //return new Future.value(new User(username, password));
  });
  }
}
