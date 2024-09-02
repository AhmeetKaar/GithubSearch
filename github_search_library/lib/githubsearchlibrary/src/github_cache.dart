import 'package:github_search_library/githubsearchlibrary/model/search_res_model.dart';
import 'package:github_search_library/githubsearchlibrary/src/github_client.dart';

class GithubCache {
  final _cache = <String,SearchResult>{};
  // set metodu, verilen key ile ilişkilendirilen SearchResult sonucunu _cache map'ine ekler ya da mevcut anahtar varsa değeri günceller."
  void set(String key, SearchResult result) => _cache[key] = result;
  // get metodunun parametresinde key arandığı zaman cache mapinde bulunan o key'in bilgileri eklenir.
  SearchResult? get(String key) => _cache[key];
  // bu satırda cache'de aranan key'in daha önce var olup olmadığı sorgulanır.
  bool controlCache(String key) => _cache.containsKey(key);
  // aranan veya istenen key'i cache map'inden kaldırır.
  void remove(String key) => _cache.remove(key);
}

/*

Bu sınıfın önemi aranan anahtar kelime daha önce arandıysa cache mapine eklenir ve bir sonraki aramalarda aynı
key tekrar aranırsa apı'lerle uğraşmamak için cache'te bulunan veriler ekrana verilir.

*/

class GithubRepo {

  // GithubCache sınıfının nesnelerini kullanabilmek için bir değişken atıyoruz.
  final GithubCache cache;
  // GithubClient sınıfının nesnelerini kullanabilmek için bir değişken atıyoruz.
  final GithubClient client;

  const GithubRepo(this.cache,this.client);
  
  Future<SearchResult> search(String key) async {
    final cachedRes = cache.get(key);
    // parametreye gelen argüman cache.get ile cached res değerinde tutulur
    // eğer sonuç null değilse tutulan değer döndürülür.
    if(cachedRes != null){
      return cachedRes;
    }
    // 
    final result = await client.search(key);
    cache.set(key,result);
    return result;
  }
}
