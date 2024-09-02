import 'package:equatable/equatable.dart';
import 'package:github_search_library/githubsearchlibrary/model/search_item_model.dart';

sealed class GithubSearchState extends Equatable{
  const GithubSearchState();

  @override
  List<Object> get props => [];
}

final class SearchStateEmpty extends GithubSearchState {}

final class SearchStateLoading extends GithubSearchState {}

final class SearchStateSuccess extends GithubSearchState {
  const SearchStateSuccess(this.items);

  final List<SearchResultItem> items;

  @override
  List<Object> get props => [items];

  @override
  String toString() => 'SearchStateSuccess {items: ${items.length}}';
}

final class SearchStateError extends GithubSearchState{
  const SearchStateError(this.error);

  final String error;

  @override
  List<Object> get props => [error];

}

/*

State management'ın tam olarak başladığı nokta burasıdır burada uygulamanın hangi aşamada olduğunu bildirmek
için uygulama durumları ele alınmış ve o durumlara özgün işlemler bazı paketlerle yapılacaktır.

*/