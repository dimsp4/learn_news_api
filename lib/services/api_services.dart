import 'dart:convert';

import 'package:http/http.dart';
import 'package:learn_news_api/model/article_model.dart';

class ApiService {
  final endPointUrl =
      "https://newsapi.org/v2/everything?q=apple&from=2022-03-17&to=2022-03-17&sortBy=popularity&apiKey=028e70b349484a649171195ca796b7ba";

  Future<List<Article>> getArticle() async {
    Response res = await get(Uri.parse(endPointUrl));

    if (res.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(res.body);

      List<dynamic> body = json['articles'];

      List<Article> articles =
          body.map((dynamic item) => Article.fromJson(item)).toList();

      return articles;
    } else {
      throw ("Cant get article.");
    }
  }
}
