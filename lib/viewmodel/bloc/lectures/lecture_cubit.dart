import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odc/viewmodel/bloc/lectures/lecture_state.dart';

import '../../../model/lecture_model.dart';
import '../../../network/dio_helper.dart';
import '../../../network/end_points.dart';

class LectureCubit extends Cubit<LectureState>{
  LectureCubit():super(LectureInitial());
  static LectureCubit get(context)=> BlocProvider.of(context);
  LectureModel ? lectureModel;

 Future <void> lecture() async {
   emit(LectureLoading());
   try {
     await DioHelper.getData(url: lectureEndPoint).then((value)  {
       lectureModel= LectureModel.fromJson(value.data);
        print(lectureModel.toString());
        emit(LectureSuceess());

      });
    }
    on DioError catch (e) {
      return e.response!.data;
    }
  }
}