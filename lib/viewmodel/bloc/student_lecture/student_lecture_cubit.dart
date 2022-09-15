import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odc/viewmodel/bloc/student_lecture/student_lecture_state.dart';

import '../../../constant.dart';
import '../../../model/student_lecture_model.dart';
import '../../../network/dio_helper.dart';
import '../../../network/end_points.dart';

class StudentLectureCubit extends Cubit<StudentLectureStatus>{
  StudentLectureCubit():super(StudentLectureInitial());
  static StudentLectureCubit get(context)=> BlocProvider.of(context);

  StudentLetureModel ? studentLectureModel;

  Future<void>  getSection() async{
    emit(StudentLectureLoading());
    try {

      await DioHelper.getData(url: userSectionsEndPoint , token: TOKEN).then((value)  {
        studentLectureModel=StudentLetureModel.fromJson(value.data);
        emit(StudentLectureSuccess());
        print(studentLectureModel.toString());
      });

    }catch (e) {

    }}

  }
