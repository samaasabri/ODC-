import 'package:odc/model/login_model.dart';

abstract class LoginState{}

class LoginInitial extends LoginState{}

class PasswordVisilbity extends LoginState{}
class LoginSuceess extends LoginState
{
  loginModel loignMOdel;
  LoginSuceess({
    required this.loignMOdel,
});

}

class LoginFail extends LoginState{}
class LoginLoading extends LoginState{}