
import '../../../model/terms.dart';

abstract class TermsStatus{}

class TermsInitial extends TermsStatus {}

class TermsSuccess extends TermsStatus{


}

class TermsFail extends TermsStatus{}

class TermsLoading extends TermsStatus{}