import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odc/constant.dart';


import '../../../model/finals_model.dart';

import '../../../network/dio_helper.dart';
import '../../../network/end_points.dart';
import 'finals_state.dart';

class FinalsCubit extends Cubit<FinalsState>{
  FinalsCubit():super(FinalsInitial());
  static FinalsCubit get(context)=> BlocProvider.of(context);
    FinalModel ? finalModel;


  Future<void> getFinals()async{
    emit(FinalsLoading());
    try {

      await DioHelper.getData(url: examsEndPoint,token: TOKEN).then((value)  {
        finalModel = FinalModel.fromJson(value.data);
        emit(FinalsSuceess());
      });
    }
    on DioError catch (e) {
      return e.response!.data;
    }
  }
}