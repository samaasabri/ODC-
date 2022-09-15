import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odc/model/lecture_model.dart';
import 'package:odc/viewmodel/bloc/lectures/lecture_state.dart';

import '../../../constant.dart';
import '../../../network/dio_helper.dart';
import '../../../network/end_points.dart';

class LectureCubit extends Cubit<LectureState>{

  LectureCubit():super(LectureInitial());
  static LectureCubit get(context)=> BlocProvider.of(context);

  LectureModel ? lectureModel;

  Future<void>  getLecture() async {
    emit(LectureLoading());
    try {
      await DioHelper.getData(url: lectureEndPoint, token: TOKEN).then((value) {
        lectureModel = LectureModel.fromJson(value.data);
        emit(LectureSuceess());
        print(lectureModel.toString());
      });
    } catch (e) {

    }
  }

}