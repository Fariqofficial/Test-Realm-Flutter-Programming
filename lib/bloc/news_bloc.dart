import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:test_android_programming_apps/models/news/article_model.dart';
import 'package:test_android_programming_apps/service/news/news_service.dart';

part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  NewsBloc() : super(NewsInitial()) {
    on<NewsEvent>((event, emit) async {
      if (event is GetNewsByQuery) {
        try {
          emit(NewsLoading());
          final articles = await NewsService().getNewsByQuery(event.query);
          emit(NewsSuccess(articles));
        } catch (e) {
          emit(NewsFailure(e.toString()));
        }
      }
    });
  }
}
