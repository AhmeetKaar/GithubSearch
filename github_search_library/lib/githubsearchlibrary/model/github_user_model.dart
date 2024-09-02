class GithubUser { //Projeyi oluşturan kişinin veya reponun bilgilerini tutar.
  final String login;
  final String avatarUrl;

  const GithubUser({
    required this.login,  //login ismi
    required this.avatarUrl, // profil fotosu
  });

  // factory ile apı'den gelen json türündeki verileri map nesnesine dönüştürür.
  factory GithubUser.fromJson(Map<String,dynamic> json){
    return GithubUser(
      login: json['login'] as String,
      avatarUrl: json['avatar_url']  as String,
    );
  }
}

// data, domain, presentation

// persentation: UI Katmanı, Widget'lar, Bloc (ViewModel), FLutter kütüphanesie depenend eden şeyler. (domain'e depend eder)
// domain: Business Logic (Model'ler, Repository Interface'leri, UseCase'ler) - Hiçbir yere depend etmez
// data: (Repository concrete implementation, Network, Database, SharedPreference) (domain'e depend eder)
