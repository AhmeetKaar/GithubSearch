import 'package:github_search_library/githubsearchlibrary/model/search_item_model.dart';

class SearchResult {
  final List<SearchResultItem> items;

  const SearchResult({required this.items});
  // API'den gelen verileri Map türünde bir nesneye çevir
  factory SearchResult.fromJson(Map<String,dynamic> json) {
    final items = (json['items'] as List<dynamic>)
        .map(
          (dynamic item) =>
              SearchResultItem.fromJson(item as Map<String, dynamic>),
        )
        .toList();
      return SearchResult(items: items);
  }
}

/*

factory API'den gelen Json verisini kullanarak SearchResult adında bir nesneye çevirmemizi
sağlar.

dönüşüm yaptığı tür ise bir Map türüdür. Bu json türünün haritalanması anlamına
gelir.

Örnek json verisi:

{
  "items": [
    {
      "full_name": "flutter/flutter",
      "html_url": "https://github.com/flutter/flutter",
      "owner": {
        "login": "flutter",
        "avatar_url": "https://avatars.githubusercontent.com/u/14101776"
      }
    },
    {
      "full_name": "dart-lang/sdk",
      "html_url": "https://github.com/dart-lang/sdk",
      "owner": {
        "login": "dart-lang",
        "avatar_url": "https://avatars.githubusercontent.com/u/1609975"
      }
    }
  ]
}

bu örnekte olduğu gibi her şeyi parçalayarak modellerini oluşturuyoruz:

"items" için searchResult adında bir model oluşturduk ve items'in altında bulunan listelerin
anahtarlarını "fullName,htmlUrl,owner" için searchResultItem adında bir model tanımlıyoruz 
bu modelde liste içermeyen elemanları "fullName,htmlUrl" Stringe çeviriyoruz, sonrasında owner
adı verilen anahtar için githubUserModel adında bir yeni bir model oluşturup aynı işlemleri 
bu modelde tamamlıyoruz.

*/
