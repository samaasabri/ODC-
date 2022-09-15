import 'package:odc/model/section_model.dart';

abstract class SectionStatus{}

class SectionInitial extends SectionStatus {}

class SectionSuccess extends SectionStatus{

}

class SectionFail extends SectionStatus{}

class SectionLoading extends SectionStatus{}