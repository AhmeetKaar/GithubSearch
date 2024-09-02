import 'dart:convert';

import 'package:github_search_library/githubsearchlibrary/model/search_res_model.dart';
import 'package:http/http.dart' as http;

class GithubClient {
  final String baseUrl;
  final http.Client httpClient;

  GithubClient(
      {http.Client? httpClient,
      this.baseUrl = 'https://api.github.com/search/repositories?q='})
      : httpClient = httpClient ?? http.Client();
// httpClient'in null olup olmama durumu kontrol edilir eğer null'sa yeni bir http.Client nesnesi atanır bu nesneyle birlikte get,post,put gibi http isteklerini kullanmamızı sağlar

  Future<SearchResult> search(String key) async {
    //uri parse etmek url'yi alıp öyle bir url olup olmadığını kontrol eder eğer geçerliyse bunu dart dilinin uri türüne dönüştürür ve işlenebilir hale gelir
    final response = await httpClient.get(Uri.parse('$baseUrl$key'));
    // json.decode response'tan dönen değerin body'sini alır map veya list gibi veri yapıları haline getirir.
    final result = json.decode(response.body) as Map<String, dynamic>;

    try {
      if (response.statusCode == 200) {
        return SearchResult.fromJson(result);
      } else {
        throw Exception("ERROR: Return => ${response.statusCode}.");
      }
    } catch (error) {
      throw Exception("ERROR: Return => ${response.statusCode}.");
    }
  }
}
