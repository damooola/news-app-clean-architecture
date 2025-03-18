import 'package:flutter/material.dart';
import 'package:news_app/core/utils/url_launcher_util.dart';
import 'package:news_app/features/daily_news/domain/entities/article_entity.dart';

class ArticleCard extends StatelessWidget {
  final ArticleEntity article;

  const ArticleCard({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => launchArticleUri(context, article),
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (article.urlToImage != null)
                Image.network(article.urlToImage!),
              const SizedBox(height: 8.0),
              Text(
                article.title ?? 'No Title',
                style: const TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8.0),
              Text(
                article.description ?? 'No Description',
                style: const TextStyle(
                  fontSize: 14.0,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 8.0),
              Text(
                'By ${article.author ?? 'Unknown'}',
                style: const TextStyle(
                  fontSize: 12.0,
                  fontStyle: FontStyle.italic,
                ),
              ),
              const SizedBox(height: 8.0),
              Text(
                article.publishedAt ?? 'No Date',
                style: const TextStyle(
                  fontSize: 12.0,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
