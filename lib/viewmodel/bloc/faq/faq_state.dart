
import '../../../model/faqs_model.dart';

abstract class FAQStatus{}

class FAQInitial extends FAQStatus {}

class FAQSuccess extends FAQStatus{


}

class FAQFail extends FAQStatus{}

class FAQLoading extends FAQStatus{}