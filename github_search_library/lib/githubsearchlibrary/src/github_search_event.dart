import "package:equatable/equatable.dart";

sealed class GithubSearchEvent extends Equatable{
  const GithubSearchEvent();
}

final class TextChanged extends GithubSearchEvent{
  const TextChanged({required this.text});
  final String text;
  
  @override
  List<Object?> get props => [text];

  @override
  String toString() => 'TextChanged {text: $text}';
}

/*

props aynı sınıfın farklı nesnelerini karşılaştırır örneğin;

void main(){
  final event1 = TextChange(text: "Flutter");
  final event2 = TextChange(text: "Dart");
  final event3 = TextChange(text: "Flutter");

  print(event1 == event2);
  // false döner
  print(event1 == event3);
  //true döner

}
*/