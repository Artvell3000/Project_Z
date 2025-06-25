import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:project_z/features/authentication/presentation/bloc/auth_screen_bloc.dart';
import 'package:project_z/config/theme/text_styles_extension.dart';


class TextFieldForPhone extends StatefulWidget {
  const TextFieldForPhone({super.key, required this.initText, required this.onPhoneEntered});

  final String initText;
  final void Function(String phone) onPhoneEntered;


  @override
  State<TextFieldForPhone> createState() => _TextFieldForPhoneState();
}

class _TextFieldForPhoneState extends State<TextFieldForPhone> with TickerProviderStateMixin {
  final _phoneRegex = RegExp(r'^\+998 \(\d{2}\) \d{3} \d{2} \d{2}$');

  final _phoneMask = MaskTextInputFormatter(
    mask: '+998 (##) ### ## ##',
    filter: {"#": RegExp(r'[0-9]')},
  );

  final TextEditingController _controller = TextEditingController();
  //final FocusNode _focus = FocusNode();
  late AnimationController _controllerAnimation;
  late Animation<Color?> _colorAnimation;

  Future<void> _startAnimation() async {
    await _controllerAnimation.forward();
    await _controllerAnimation.reverse();
    _controllerAnimation.reset();
  }

  @override
  void initState() {
    super.initState();
    _controllerAnimation = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );

    _colorAnimation = ColorTween(
      begin: const Color.fromRGBO(245, 245, 247, 1),
      end: const Color.fromRGBO(250, 148, 148, 1.0),
    ).animate(_controllerAnimation);


    _controller.text = (_phoneRegex.hasMatch(widget.initText)) ? widget.initText : '';
    //_focus.addListener(_onFocusChanged);
  }

  @override
  void dispose() {
    _controllerAnimation.dispose();
    _controller.dispose();
    //_focus.removeListener(_onFocusChanged);
    //_focus.dispose();
    super.dispose();
  }

  // void _onFocusChanged() {
  //   if (!_focus.hasFocus) {
  //     if (_phoneRegex.hasMatch(_controller.text)) {
  //       widget.onPhoneEntered(_controller.text);
  //     } else {
  //       _startAnimation();
  //     }
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    final textStyles = Theme.of(context).extension<AppTextStyles>();
    return BlocListener<AuthScreenBloc, AuthScreenState>(
      listener: (context, state) {
        state.mapOrNull(
          unsuccessSendCode: (d) => _startAnimation()
        );
      },
      child: AnimatedBuilder(
        animation: _controllerAnimation,
        builder: (context, child) {
          return TextField(
            keyboardType: TextInputType.phone,
            inputFormatters: [_phoneMask],
            controller: _controller,
            onChanged: (phone){
              widget.onPhoneEntered(phone);
            },
            //focusNode: _focus,
            style: textStyles?.textField ?? AppTextStyles.defaultTextField,
            decoration: InputDecoration(
              filled: true,
              fillColor: _colorAnimation.value,
              contentPadding: const EdgeInsets.only(
                  top: 15,
                  left: 15,
                  right: 15
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(
                  color: Color.fromRGBO(197, 197, 197, 1),
                  width: 1,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(
                  color: Color.fromRGBO(197, 197, 197, 1),
                  width: 1,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(
                  color: Color.fromRGBO(197, 197, 197, 1),
                  width: 1,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
