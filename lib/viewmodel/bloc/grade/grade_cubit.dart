import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odc/constant.dart';

import '../../../model/grade_model.dart';
import '../../../network/dio_helper.dart';
import '../../../network/end_points.dart';
import 'grade_state.dart';

class GradeCubit extends Cubit<GradeState>{
  GradeCubit():super(GradeInitial());
  static GradeCubit get(context)=> BlocProvider.of(context);
  GradeModel ? gradeModel;

  Future<void> news() async{
    emit(GradeLoading());
    try {

      await DioHelper.getData(url: gradeEndPoint,token: TOKEN).then((value)  {
        gradeModel= GradeModel.fromJson(value.data);

        emit(GradeSuceess());
      });
    }
    on DioError catch (e) {
      return e.response!.data;
    }
  }
}