
import 'package:github_search_library/githubsearchlibrary/model/github_user_model.dart';

class SearchResultItem {
  final String fullName;
  final String htmlUrl;
  final GithubUser owner;

  const SearchResultItem({
    required this.fullName,  // arama yapılırken girilen isim.
    required this.htmlUrl,   // arama yapıldıktan sonra döndürülen url.
    required this.owner,    // projenın sahıbını ıfade eden gıthubuser nesnesini oluşturur.
  });

  factory SearchResultItem.fromJson(Map<String,dynamic> json){
    return SearchResultItem(
      fullName: json['full_name'] as String,
      htmlUrl: json['html_url'] as String,
      owner: GithubUser.fromJson(json['owner'] as Map<String,dynamic>)
    );
  }
}
