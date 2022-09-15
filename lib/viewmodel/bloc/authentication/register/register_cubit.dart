// import 'package:bloc/bloc.dart';
// import 'package:dio/dio.dart';
// import 'package:dio_helper/dio_helper.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// import 'package:odc/viewmodel/bloc/authentication/register/register_state.dart';
//
// import '../../../../model/register_model.dart';
// import '../../../../network/end_points.dart';
//
// class RegisterCubit extends Cubit<RegisterState>{
//
//   RegisterCubit():super(RegisterInitial());
//
//   static RegisterCubit get(context)=>BlocProvider.of(context);
//
//   Future<void> Register({
//     required String email,
//     required String password,
//     required String name,
//     required String gender,
//     required String phoneNumber,
//     required int unversityId,
//     required int gradeId,
//     required int roleId,
//
// })
//
// async {
// try{
//   emit(RegisterLoading());
//   DioHelper.(url: registerEndPoint, data: {
//     "email": email,
//     "password": password,
//     "name": name,
//     "gender": gender,
//     "phoneNumber": phoneNumber,
//     "universityId": unversityId,
//     "gradeId": gradeId,
//     "roleId": roleId
//   }).then((value){
//     emit(RegisterSucess(registerModel: RegisterModel()));
//   });
//
// }
//  on DioError catch (e)
//   {
//     return e.response!.data;
//   }
// }
//
//
//
//
//
// }