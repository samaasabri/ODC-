import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odc/model/section_model.dart';
import 'package:odc/network/dio_helper.dart';
import 'package:odc/viewmodel/bloc/sections/section_state.dart';

import '../../../constant.dart';
import '../../../network/end_points.dart';

class SectionCubit extends Cubit<SectionStatus>{
  SectionCubit():super(SectionInitial());
  static SectionCubit get(context)=> BlocProvider.of(context);

SectionModel ? sectionModel;

Future<void>  getSection() async{
  emit(SectionLoading());
  try {

   await DioHelper.getData(url: sectionEndPoint , token: TOKEN).then((value)  {
     sectionModel=SectionModel.fromJson(value.data);
      emit(SectionSuccess());
      print(sectionModel.toString());
    });

  }catch (e) {

  }
}

}