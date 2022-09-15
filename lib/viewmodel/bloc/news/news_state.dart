
import '../../../model/news.dart';

abstract class NewsState{}

class NewsInitial extends NewsState{}

class NewsSuceess extends NewsState
{
}

class NewsFail extends NewsState{}
class NewsLoading extends NewsState{}