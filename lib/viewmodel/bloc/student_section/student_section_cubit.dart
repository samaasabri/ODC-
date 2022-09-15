import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odc/viewmodel/bloc/student_section/student_section_state.dart';

import '../../../constant.dart';
import '../../../model/student_section_model.dart';
import '../../../network/dio_helper.dart';
import '../../../network/end_points.dart';

class StudentSectionCubit extends Cubit<StudentSectionStatus> {
  StudentSectionCubit() :super(StudentSectionInitial());

  static StudentSectionCubit get(context) => BlocProvider.of(context);

  StudentSectionModel ? studentSectionModel;

  Future<void> getSection() async {
    emit(StudentSectionLoading());
    try {
      await DioHelper.getData(url: sectionEndPoint, token: TOKEN).then((value) {
        studentSectionModel = StudentSectionModel.fromJson(value.data);
        emit(StudentSectionSuccess());
      });
    } catch (e) {

    }
  }
}