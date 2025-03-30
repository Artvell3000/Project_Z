import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_z/core/domain/entity/profile/profile.dart';
import 'package:project_z/features/profile/presentation/bloc/profile_screen_bloc.dart';

class ProfileSurnameTextField extends StatelessWidget {
  ProfileSurnameTextField({
    super.key,
    required BuildContext context,
    required this.profile
  }){
    _controller.text = profile.surname ?? '';
    _focusNode.addListener((){
      if(!_focusNode.hasFocus){
        BlocProvider.of<ProfileScreenBloc>(context).add(
          ProfileScreenEvent.refresh(
            profile.copyWith(surname: _controller.text)
          )
        );
      }
    });
  }
  final Profile profile;
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Ism va familiya',
          style: TextStyle(
            color: Color.fromRGBO(125, 125, 125, 1),
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 4),
        SizedBox(
          height: 40,
          child: TextField(
            focusNode: _focusNode,
            controller: _controller,
            decoration: InputDecoration(
              filled: true,
              fillColor: const Color.fromRGBO(245, 245, 247, 1),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 12,
              ),
              border: OutlineInputBorder(
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
            style: const TextStyle(
              color: Colors.black,
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  }
}