import 'dart:convert';
import 'package:http/http.dart' as http;

class NetworkHelper {
  final String url;

  NetworkHelper(this.url);

  Future getData() async {
    print(url);
    http.Response response = await http.get(
      Uri.encodeFull(url),
      headers: {"Accept": "application/json"},
    );
    if (response.statusCode == 200) {
      //print(jsonDecode(response.body));
      return jsonDecode(response.body);
    } else {
      print(response.statusCode);
    }
  }
}
