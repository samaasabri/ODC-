import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odc/viewmodel/bloc/terms/terms_state.dart';
import '../../../model/terms.dart';
import '../../../network/dio_helper.dart';
import '../../../network/end_points.dart';



class TermsCubit extends Cubit<TermsStatus>{
  TermsCubit():super(TermsInitial());
  static TermsCubit get(context)=> BlocProvider.of(context);

  TermsModel ? termsModel;
  Future<void> term() async{
    try {
      emit(TermsLoading());
     await DioHelper.getData(url: termsEndPoint).then((value)  {
       termsModel= TermsModel.fromJson(value.data);
        emit(TermsSuccess());
      });
    }
    on DioError catch (e) {
      return e.response!.data;
    }
  }
}