import 'package:latihan_kuis/basenetwork.dart';

class ApiDataSource {
  static ApiDataSource instance = ApiDataSource();

  Future<Map<String, dynamic>> loadNews() {
return BaseNetwork.get("articles");
}
 Future<Map<String, dynamic>> loadBlog() {
return BaseNetwork.get("blogs");
}
 Future<Map<String, dynamic>> loadReports() {
return BaseNetwork.get("reports");
}


  loadDetaiUser(int idUser) {}

}