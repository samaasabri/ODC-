import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../model/news.dart';
import '../../../network/dio_helper.dart';
import '../../../network/end_points.dart';
import 'news_state.dart';


class NewsCubit extends Cubit<NewsState>{
  NewsCubit():super(NewsInitial());
  static NewsCubit get(context)=> BlocProvider.of(context);
  NewsModel ? newsModel;

  Future<void> news() async{
    emit(NewsLoading());
    try {

     await DioHelper.getData(url: newsEndPoint).then((value)  {
       newsModel= NewsModel.fromJson(value.data);

        emit(NewsSuceess());
      });
    }
    on DioError catch (e) {
      return e.response!.data;
    }
  }
}