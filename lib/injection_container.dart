
import 'package:get_it/get_it.dart';
import 'package:news_app/features/daily_news/data/data_sources/remote/news_api_service.dart';
import 'package:news_app/features/daily_news/data/repository/article_repository_impl.dart';
import 'package:news_app/features/daily_news/domain/repository/article_repository.dart';
import 'package:news_app/features/daily_news/domain/usecases/get_article.dart';
import 'package:news_app/features/daily_news/presentation/bloc/article/remote/remote_article_bloc.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  // Register NewsApiService next as it depends on Dio
  sl.registerSingleton<NewsApiService>(NewsApiService());

  // Register ArticleRepositoryImpl next as it depends on NewsApiService
  sl.registerSingleton<ArticleRepository>(ArticleRepositoryImpl(sl()));

  // Register GetArticlesUseCase next as it depends on ArticleRepository
  sl.registerSingleton<GetArticlesUseCase>(GetArticlesUseCase(sl()));

  // Register RemoteArticleBloc last as it depends on GetArticlesUseCase
  sl.registerFactory<RemoteArticleBloc>(() => RemoteArticleBloc(sl()));
}
