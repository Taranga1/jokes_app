import 'dart:convert';

import 'package:http/http.dart' as http;

class Jokes {
  Future getjokes() async {
    String url =
        "https://sv443.net/jokeapi/v2/joke/Any?blacklistFlags=sexist&type=single"; // link of the json file
    var response = await http.get(url, headers: {"accept": "application/json"});
    var data = json.decode(response
        .body); //no use of data if there is no  data backward of [] array
    return data;
  }
}
