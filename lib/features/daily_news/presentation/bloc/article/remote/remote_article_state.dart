import 'package:equatable/equatable.dart';
import 'package:news_app/features/daily_news/domain/entities/article_entity.dart';

abstract class RemoteArticleState extends Equatable {
  final List<ArticleEntity>? articles;
  final Exception? error;
  const RemoteArticleState({this.articles, this.error});

  @override
  List<Object?> get props => [articles!, error!];
}

class RemoteArticleLoading extends RemoteArticleState {
  const RemoteArticleLoading();
}

class RemoteArticleLoaded extends RemoteArticleState {
  const RemoteArticleLoaded(List<ArticleEntity> articles)
      : super(articles: articles);
}

class RemoteArticleError extends RemoteArticleState {
  const RemoteArticleError(Exception error) : super(error: error);
}
