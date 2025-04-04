import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_z/features/shell_widget/presentation/bloc/auth/auth_bloc.dart';

class AuthShell extends StatelessWidget {
  const AuthShell({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: (){
            BlocProvider.of<AuthBloc>(context).add(const AuthEvent.hide());
          },
          child: const ColoredBox(color: Color.fromRGBO(125, 125, 125, 0.5), child: SizedBox.expand()),
        ),
        Center(
          child: Card(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
              child: child,
            ),
          ),
        )
      ],
    );
  }
}