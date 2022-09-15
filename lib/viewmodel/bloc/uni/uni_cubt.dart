import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odc/constant.dart';
import 'package:odc/viewmodel/bloc/uni/uni_state.dart';

import '../../../model/university_model.dart';
import '../../../network/dio_helper.dart';
import '../../../network/end_points.dart';

class UniCubit extends Cubit<UniState>{
  UniCubit():super(UniInitial());
  static UniCubit get(context)=> BlocProvider.of(context);
  UniModel ? uniModel;

  Future<void> news() async{
    emit(UniLoading());
    try {

      await DioHelper.getData(url: universityEndPoint,token: TOKEN).then((value)  {
        uniModel= UniModel.fromJson(value.data);

        emit(UniSuceess());
      });
    }
    on DioError catch (e) {
      return e.response!.data;
    }
  }
}