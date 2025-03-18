import 'package:flutter/material.dart';
import 'package:news_app/features/daily_news/domain/entities/article_entity.dart';
import 'package:url_launcher/url_launcher_string.dart';

Future<void> launchArticleUri(
    BuildContext context, ArticleEntity article) async {
  {
    if (article.url != null) {
      // Open the article in a webview
      final url = article.url!;
      if (await canLaunchUrlString(url)) {
        await launchUrlString(url, mode: LaunchMode.inAppBrowserView);
      } else {
        // Handle the case where the URL cannot be launched
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Could not launch $url',
              style: const TextStyle(color: Colors.white),
            ),
            backgroundColor: Colors.red,
            action: SnackBarAction(
              label: 'Retry',
              textColor: Colors.white,
              onPressed: () {
                launchArticleUri(context, article);
              },
            ),
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        );
      }
    }
  }
}
