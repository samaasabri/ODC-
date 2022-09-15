import '../../../../model/register_model.dart';

abstract class RegisterState {}


class RegisterInitial extends RegisterState{}
class RegisterSucess extends RegisterState {
  RegisterModel registerModel;

  RegisterSucess({
    required this.registerModel,
  });
}


class RegisterFail extends RegisterState{}
class RegisterLoading extends RegisterState{}
class ChangeVisibilty extends RegisterState{}