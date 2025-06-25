import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_screen_event.dart';
part 'auth_screen_state.dart';
part 'auth_screen_bloc.freezed.dart';

class AuthScreenBloc extends Bloc<AuthScreenEvent, AuthScreenState> {
  AuthScreenBloc() : super(_Initial()) {
    on<AuthScreenEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
