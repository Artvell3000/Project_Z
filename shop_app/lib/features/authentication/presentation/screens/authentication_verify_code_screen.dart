import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'package:project_z/app/app.dart';
import 'package:project_z/config/theme/button_style_extension.dart';
import 'package:project_z/config/theme/text_styles_extension.dart';
import 'package:project_z/core/di/di.dart';
import 'package:project_z/features/authentication/presentation/bloc/auth_screen_bloc.dart';
import 'package:project_z/features/authentication/presentation/widgets/loading_pin_code_input_widget.dart';
import 'package:project_z/features/authentication/presentation/widgets/widgets.dart';
import 'package:project_z/gen_locales/app_localizations.dart';

@RoutePage()
class AuthenticationVerifyCodeScreen extends StatefulWidget {
  const AuthenticationVerifyCodeScreen(this._username, {super.key});

  final String _username;

  @override
  State<AuthenticationVerifyCodeScreen> createState() => _AuthenticationVerifyCodeScreenState();
}

class _AuthenticationVerifyCodeScreenState extends State<AuthenticationVerifyCodeScreen> {

  late Timer _timer;

  @override
  void initState() {
    _startTimer();
    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer(const Duration(seconds: 120), () {
      if (mounted) {
        _goBack(context);
      }
    });
  }

  void _goBack(BuildContext context) {
    final router = AutoRouter.of(context);
    if (router.canPop()) {
      router.popForced();
    }
  }

  void _goToApp(BuildContext context) {
    _timer.cancel();
    RestartAppFunction.body(context);
  }


  void _onClickTelegram() {
    //todo
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;
    final textStyles = theme.extension<AppTextStyles>();
    final buttonStyles = theme.extension<AppButtonStyles>();
    final S = AppLocalizations.of(context);
    final bloc = BlocProvider.of<AuthScreenBloc>(context);

    return Scaffold(
      
    );
  }
}
