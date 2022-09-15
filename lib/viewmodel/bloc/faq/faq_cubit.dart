import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odc/viewmodel/bloc/faq/faq_state.dart';

import '../../../model/faqs_model.dart';

import '../../../network/dio_helper.dart';
import '../../../network/end_points.dart';




class FAQCubit extends Cubit<FAQStatus>{
  FAQCubit():super(FAQInitial());
  static FAQCubit get(context)=> BlocProvider.of(context);
  FAQsModel ? faqModel;
  Future<void>  faq() async{
    emit(FAQLoading());
    try {
      DioHelper.getData(url: faqEndPoint).then((value)  {
        faqModel = FAQsModel.fromJson(value.data);
        emit(FAQSuccess());
      });
    }
    on DioError catch (e) {
      return e.response!.data;
    }
  }
}