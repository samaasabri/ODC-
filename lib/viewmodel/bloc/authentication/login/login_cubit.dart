import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:odc/model/login_model.dart';
import 'package:odc/network/dio_exceptions.dart';
import 'package:odc/network/dio_helper.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../constant.dart';
import 'login_state.dart';
import 'package:odc/network/end_points.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  static LoginCubit get(context) => BlocProvider.of(context);
  bool visiblePassword = false;

  void changePasswordVisibilty() {
    visiblePassword = !visiblePassword;
    emit(PasswordVisilbity());
  }

  Future<void> login({required String email, required String password}) async {
    try {
      emit(LoginLoading());
      DioHelper.postData(url: loginEndPoint, data: {
        "email": email,
        "password": password,
      }).then((value) {
        print(value.data);
        TOKEN = value.data['data']['accessToken'];
        print(TOKEN);
        emit(LoginSuceess(loignMOdel: loginModel()));
      });
    } on DioError catch (e) {
      return e.response!.data;
      emit(LoginFail());
    }
  }
}
