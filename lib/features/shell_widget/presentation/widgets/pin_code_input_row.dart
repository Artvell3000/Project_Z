import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'package:project_z/features/shell_widget/presentation/bloc/auth/auth_screen_bloc.dart';

class PinCodeInputRow extends StatefulWidget {
  const PinCodeInputRow({super.key, required this.toVerify});

  final void Function(String code) toVerify;

  @override
  _PinCodeInputRowState createState() => _PinCodeInputRowState();
}

class _PinCodeInputRowState extends State<PinCodeInputRow> with TickerProviderStateMixin {
  final List<FocusNode> _focusNodes = List.generate(6, (index) => FocusNode());
  final List<TextEditingController> _controllers = List.generate(6, (index) => TextEditingController());
  late AnimationController _controller;
  late Animation<Color?> _colorAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );

    _colorAnimation = ColorTween(
      begin: const Color.fromRGBO(245, 245, 247, 1),
      end: const Color.fromRGBO(253, 136, 136, 1.0),
    ).animate(_controller);
  }

  Future<void> _startAnimation() async {
    await _controller.forward();
    await _controller.reverse();
    _controller.reset();
  }

  @override
  void dispose() {
    _controller.dispose();
    for (var node in _focusNodes) {
      node.dispose();
    }
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  // Функция, которая вызывается, когда все поля заполнены
  void _checkAllFieldsFilled() {
    final allFilled = _controllers.every((controller) => controller.text.isNotEmpty);
    if (allFilled) {
      StringBuffer code = StringBuffer();
      for (final el in _controllers) {
        code.write(el.text);
      }
      widget.toVerify(code.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthScreenBloc, AuthScreenState>(
      listener: (context, state) {
        Logger().i('_startAnimation();');
        _startAnimation();
      },
      listenWhen: (_, state){
        Logger().i('state: $state');
        return state.mapOrNull(unsuccessVerifyCode: (d)=> true) ?? false;
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(6, (index) {
          return SizedBox(
            width: 50,
            height: 50,
            child: AnimatedBuilder(
              builder: (context, child) {
                return TextField(
                  controller: _controllers[index],
                  focusNode: _focusNodes[index],
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  maxLength: 1,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                  decoration: InputDecoration(
                    counterText: "",
                    filled: true,
                    fillColor: _colorAnimation.value,
                    enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromRGBO(197, 197, 197, 1),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(12))
                    ),
                    focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromRGBO(16, 53, 91, 1),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(12))
                    ),
                  ),
                  onChanged: (value) {
                    if (value.length == 1 && index < 5) {
                      _focusNodes[index + 1].requestFocus();
                    } else if (value.isEmpty && index > 0) {
                      _focusNodes[index - 1].requestFocus();
                    }
                    _checkAllFieldsFilled();
                  },
                );
              },
              animation: _controller,
            ),
          );
        }),
      ),
    );
  }
}
