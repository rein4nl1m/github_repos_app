import 'package:flutter/material.dart';
import 'package:github_repos_app/model/repo.dart';
import 'package:github_repos_app/services/github_api.dart';
import 'package:github_repos_app/ui/widgets/custom_card_repo.dart';
import 'package:github_repos_app/ui/widgets/custom_form.dart';
import 'package:github_repos_app/ui/widgets/user_header.dart';
import 'package:github_repos_app/utils/constants.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController _searchController = TextEditingController();
  GithubApi githubApi = GithubApi();
  var _repositories = List<Repo>();
  bool _isLoading = false;

  Future<void> fetchRepos() async {
    if (_isLoading) return;
    if (_repositories.isNotEmpty) {
      _repositories.clear();
    }

    setState(() {
      _isLoading = true;
    });

    var response = await githubApi.fetchRepos(_searchController.text);
    if (response != null) {
      setState(() {
        _repositories += response;
      });
    }
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: EdgeInsets.all(8),
          child: kLogo,
        ),
        title: const Text('Github Repos'),
        backgroundColor: Colors.black,
        actions: [
          FlatButton(
            child: Text(
              'Limpar',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            onPressed: () {
              FocusScope.of(context).unfocus();
              setState(() {
                _repositories.clear();
                _isLoading = false;
              });
              _searchController.clear();
            },
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          if (_repositories.isEmpty)
            CustomForm(
              controller: _searchController,
              onSearch: fetchRepos,
            ),
          if (_repositories.isNotEmpty)
            Expanded(
              flex: 1,
              child: UserHeader(
                login: _repositories[0].login,
                avatarUrl: _repositories[0].avatarUrl,
                total: _repositories.length,
              ),
            ),
          if (_repositories.isNotEmpty)
            Expanded(
              flex: 2,
              child: ListView.builder(
                itemCount: _repositories.length,
                itemBuilder: (context, index) {
                  return CustomCardRepo(
                    title: _repositories[index].fullName,
                    description: _repositories[index].description,
                    stargazersCount: _repositories[index].stargazersCount,
                    language: _repositories[index].language,
                    createdAt: _repositories[index].createdAt,
                  );
                },
              ),
            ),
          if (_isLoading) CircularProgressIndicator()
        ],
      ),
    );
  }
}
