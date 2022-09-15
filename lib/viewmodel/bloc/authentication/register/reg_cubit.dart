import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:odc/model/login_model.dart';
import 'package:odc/model/register_model.dart';
import 'package:odc/network/dio_exceptions.dart';
import 'package:odc/network/dio_helper.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odc/viewmodel/bloc/authentication/register/register_state.dart';


import 'package:odc/network/end_points.dart';

class RegisterCubit extends Cubit<RegisterState>{


 RegisterCubit() : super(RegisterInitial());
  static RegisterCubit get(context)=> BlocProvider.of(context);

 bool visiblePassword1=false,visiblePassword2=false;

 void changePasswordVisibilty(){
   visiblePassword1=!visiblePassword1;
   emit(ChangeVisibilty());
 }

 void changePasswordVisibilty2(){
   visiblePassword2=!visiblePassword2;
   emit(ChangeVisibilty());
 }

  Future<void> register({
    required String email,
    required String password,
    required String name,
    // required String gender,
    required String phoneNumber,
    // required int unversityId,
    // required int gradeId,
    // required int roleId,
  })
  async {
    try {
      emit(RegisterLoading());
     await DioHelper.postData(url: registerEndPoint, data: {
       "name": name,
       "email": email,
        "password": password,
        "gender": 'm',
        "phoneNumber": phoneNumber,
        "universityId":1,
        "gradeId": 4,
         "roleId": 2
      }).then((value){
        print(value.data);
       emit(RegisterSucess(registerModel: RegisterModel()));
      });


    }
    on DioError catch (e) {
      print(e.response!.data);
      emit(RegisterFail());
      return e.response!.data;

    }
  }



}