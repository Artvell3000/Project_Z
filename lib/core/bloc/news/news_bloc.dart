import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:project_z/core/domain/entity/news/news.dart';
import 'package:project_z/core/network/api/api_service.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'news_bloc.freezed.dart';
part 'news_event.dart';
part 'news_state.dart';

@injectable
class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final ApiService api;

  NewsBloc(this.api) : super(const NewsState.loading()) {
    Logger().i('[NewsBloc] init');
    on<NewsEvent>((event, emit) async {
      await event.map(
        load: (_) async => await _loadNews(emit),
        refresh: (_) async => await _loadNews(emit),
      );
    });

    add(const NewsEvent.load());
  }

  Future<void> _loadNews(Emitter<NewsState> emit) async {
    try {
      emit(const NewsState.loading());
      final news = await api.getNews();
      emit(NewsState.loaded(news));
    } catch (e) {
      emit(NewsState.error('Ошибка загрузки новостей: $e'));
    }
  }
}