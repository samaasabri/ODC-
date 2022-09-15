import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odc/viewmodel/bloc/student_exam/student_exam_state.dart';

import '../../../constant.dart';
import '../../../model/student_exam_model.dart';
import '../../../network/dio_helper.dart';
import '../../../network/end_points.dart';

class StudentExamCubit extends Cubit<StudentExamStatus>{
  StudentExamCubit():super(StudentExamInitial());
  static StudentExamCubit get(context)=> BlocProvider.of(context);

  StudentExamModel ? studentExamModel;

  Future<void>  getSection() async{
    emit(StudentExamLoading());
    try {

      await DioHelper.getData(url: sectionEndPoint , token: TOKEN).then((value)  {
        studentExamModel=StudentExamModel.fromJson(value.data);
        emit(StudentExamSuccess());

      });

    }catch (e) {

    }
  }

}