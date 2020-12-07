import 'dart:convert';
import 'package:github_repos_app/model/repo.dart';
import 'package:http/http.dart' as http;

class GithubApi {
  Future fetchRepos(String user) async {
    var response = await http.get('https://api.github.com/users/$user/repos');
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body) as List;
      return data.map((e) => Repo.fromJson(e)).toList();
    } else {
      return null;
    }
  }
}
