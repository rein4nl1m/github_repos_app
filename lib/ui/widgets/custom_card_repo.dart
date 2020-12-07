import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:github_repos_app/utils/formatters.dart';

class CustomCardRepo extends StatelessWidget {
  final String title;
  final String description;
  final String language;
  final int stargazersCount;
  final String createdAt;

  const CustomCardRepo({
    Key key,
    this.title,
    this.description,
    this.stargazersCount,
    this.language,
    this.createdAt,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        height: 100,
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AutoSizeText(
                  title ?? " ",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                  minFontSize: 12,
                  maxLines: 1,
                ),
                Row(
                  children: <Widget>[
                    Text(
                      '$stargazersCount',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.amber,
                      ),
                    ),
                    Icon(
                      Icons.grade,
                      color: Colors.amber,
                    )
                  ],
                )
              ],
            ),
            Text(
              description ?? " ",
              style: TextStyle(
                fontSize: 12,
              ),
              softWrap: true,
              overflow: TextOverflow.ellipsis,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  language ?? " ",
                  style: TextStyle(fontSize: 14),
                ),
                Text(
                  "Criado em ${dateFormatted(createdAt) ?? " "}",
                  style: TextStyle(fontSize: 12),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
