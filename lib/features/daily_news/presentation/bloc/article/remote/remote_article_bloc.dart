import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/resources/data_state.dart';
import 'package:news_app/features/daily_news/domain/usecases/get_article.dart';
import 'package:news_app/features/daily_news/presentation/bloc/article/remote/remote_article_event.dart';
import 'package:news_app/features/daily_news/presentation/bloc/article/remote/remote_article_state.dart';

class RemoteArticleBloc extends Bloc<RemoteArticleEvent, RemoteArticleState> {
  final GetArticlesUseCase getArticleUseCase;

  RemoteArticleBloc(this.getArticleUseCase)
      : super(const RemoteArticleLoading()) {
    on<GetRemoteArticles>(_onGetRemoteArticles);
  }

  Future<void> _onGetRemoteArticles(
    GetRemoteArticles event,
    Emitter<RemoteArticleState> emit,
  ) async {
    emit(const RemoteArticleLoading());

    final dataState = await getArticleUseCase();
    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      emit(RemoteArticleLoaded(dataState.data!));
    } else if (dataState is DataFailed) {
      emit(RemoteArticleError(dataState.error as Exception));
    }
  }
}
