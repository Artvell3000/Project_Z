import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_z/core/di/di.dart';
import 'package:project_z/features/profile/presentation/bloc/profile_screen_bloc.dart';

@RoutePage()
class AuthShellScreen extends StatelessWidget {
  const AuthShellScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ProfileScreenBloc>(),
      child: const AutoRouter(),
    );
  }
}
