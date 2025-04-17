import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'under_app_bar_widget_event.dart';
part 'under_app_bar_widget_state.dart';
part 'under_app_bar_widget_bloc.freezed.dart';

class UnderAppBarWidgetBloc extends Bloc<UnderAppBarWidgetEvent, UnderAppBarWidgetState> {
  UnderAppBarWidgetBloc() : super(const UnderAppBarWidgetState.hideSearch()) {
    on<_ErrorUnderAppBarWidgetEvent>(_handleError);
    on<_HideUnderAppBarWidgetEvent>(_handleHide);
    on<_ShowUnderAppBarWidgetEvent>(_handleShow);
    on<_StartUnderAppBarWidgetEvent>(_handleStartSearch);
  }

  // Обработка ошибки
  void _handleError(_ErrorUnderAppBarWidgetEvent event, Emitter<UnderAppBarWidgetState> emit,) {
    emit(UnderAppBarWidgetState.error(event.e.toString()));
  }

  // Скрытие поиска
  void _handleHide(_HideUnderAppBarWidgetEvent event, Emitter<UnderAppBarWidgetState> emit,) {
    emit(const UnderAppBarWidgetState.hideSearch());
  }

  // Показ поиска (без запроса)
  void _handleShow(_ShowUnderAppBarWidgetEvent event, Emitter<UnderAppBarWidgetState> emit,) {
    emit(const UnderAppBarWidgetState.showSearch());
  }

  // Начало поиска с запросом
  void _handleStartSearch(_StartUnderAppBarWidgetEvent event, Emitter<UnderAppBarWidgetState> emit,) {
    emit(UnderAppBarWidgetState.startSearch(event.query));
  }
}