class Repo {
  String fullName;
  String avatarUrl;
  String login;
  String description;
  String createdAt;
  int stargazersCount;
  String language;

  Repo({
    this.fullName,
    this.avatarUrl,
    this.login,
    this.description,
    this.createdAt,
    this.stargazersCount,
    this.language,
  });

  factory Repo.fromJson(Map<String, dynamic> json){
    return Repo(
      fullName: json['full_name'],
      avatarUrl: json['owner']['avatar_url'],
      login: json['owner']['login'],
      description: json['description'],
      createdAt: json['created_at'],
      stargazersCount: json['stargazers_count'],
      language: json['language'],
    );
  }
}
