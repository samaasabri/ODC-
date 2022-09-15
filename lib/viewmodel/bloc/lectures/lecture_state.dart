import 'package:odc/model/lecture_model.dart';

abstract class LectureState{}

class LectureInitial extends LectureState{}

class LectureSuceess extends LectureState
{


}

class LectureFail extends LectureState{}
class LectureLoading extends LectureState{}