
import 'package:login_signup/ui/rest_ds.dart';


import 'login_response.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class LoginScreenContract {
  void onLoginSuccess(LoginResponse response);

  void onLoginError(String errorTxt);
}

class LoginScreenPresenter {
  LoginScreenContract _view;
  RestDatasource api = new RestDatasource();

  LoginScreenPresenter(this._view);

  doLogin(String username, String password) async{

    try
    {
      LoginResponse response= await api.login(username, password);
      if (response.status != "error") {
        _view.onLoginSuccess(response);
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('username', username);
    } else {
        _view.onLoginError("Invalid");
    }

    }
    catch (e)
    {
      _view.onLoginError(e.toString().substring(e.toString().indexOf(":")+1));

    }
  }
}
