

import '../model/model.dart';
import 'package:http/http.dart' as http;


class RemoteService {
  Future<List<Post>?> getPosts() async {
    var client = http.Client();

    var uri = Uri.parse("https://63347899ea0de5318a039283.mockapi.io/intesa/mobil/post");
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return postFromJson(json);
    }
    return null;
  }
}
