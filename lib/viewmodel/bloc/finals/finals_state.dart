
import '../../../model/finals_model.dart';

abstract class FinalsState{}

class FinalsInitial extends FinalsState{}

class FinalsSuceess extends FinalsState
{
}

class FinalsFail extends FinalsState{}
class FinalsLoading extends FinalsState{}