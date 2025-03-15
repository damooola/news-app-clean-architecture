import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/features/daily_news/presentation/bloc/article/remote/remote_article_bloc.dart';
import 'package:news_app/features/daily_news/presentation/bloc/article/remote/remote_article_state.dart';
import 'package:news_app/features/daily_news/presentation/widgets/article_card.dart';

class DailyNews extends StatelessWidget {
  const DailyNews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buidBody(),
    );
  }
}

PreferredSizeWidget? _buildAppBar() {
  return AppBar(
    title: const Text('Daily News',
        style: TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.bold,
          letterSpacing: 1.5,
        )),
    backgroundColor: Colors.white,
  );
}

Widget _buidBody() {
  return BlocBuilder<RemoteArticleBloc, RemoteArticleState>(
    builder: (_, state) {
      if (state is RemoteArticleLoading) {
        return const Center(child: CupertinoActivityIndicator());
      } else if (state is RemoteArticleLoaded) {
        return ListView.builder(
          itemCount: state.articles!.length,
          itemBuilder: (context, index) {
            final article = state.articles![index];
            return ArticleCard(article: article);
          },
        );
      } else if (state is RemoteArticleError) {
        return Center(child: Text(state.error!.message!));
      } else {
        return const SizedBox.shrink();
      }
    },
  );
}
