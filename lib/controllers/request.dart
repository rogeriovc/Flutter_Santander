import 'dart:convert';

import 'package:http/http.dart' as http;

class Request {
  String BASE_URL = "http://santa.avanth.kinghost.net/api";
  String token = "";

  methodRequest(String route, String method, {dynamic body}) async {
    dynamic resposta;
    if (method == "GET") {
      await http.get(Uri.parse("$BASE_URL/$route"), headers: {
        "Accept": "application/json",
        "Content-Type": "application/json",
        "Authorization": "Bearer $token"
      }).then((http.Response response) {
        print(response.statusCode);
      });
    } else {
      await http
          .post(
        Uri.parse("$BASE_URL/$route"),
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/json"
        },
        body: jsonEncode(body),
      )
          .then((http.Response response) {
        //print(response.statusCode);
        //print(response.body);

        var respDecoded = jsonDecode(response.body);

        resposta = {"statusCode": response.statusCode, "body": respDecoded};
      });
    }
    return resposta;
  }
}
