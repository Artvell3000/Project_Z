import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_z/core/domain/entity/custom_user/custom_user.dart';
import 'package:project_z/features/shell_widget/presentation/bloc/auth/auth_bloc.dart';

abstract class AuthFunctions {
  static bool isLoadedUser(BuildContext context) => BlocProvider.of<AuthBloc>(context).isLoaded;

  static void startAuth(BuildContext context) => BlocProvider.of<AuthBloc>(context).add(const AuthEvent.startAuth());

  static CustomUser? loadedUser(BuildContext context) =>
      BlocProvider.of<AuthBloc>(context).state.mapOrNull(loaded: (d) => d.user);

  static doItOrStartAuth(BuildContext context, void Function() ifLoaded) {
    if (isLoadedUser(context)) {
      ifLoaded();
    } else {
      startAuth(context);
    }
  }
}
