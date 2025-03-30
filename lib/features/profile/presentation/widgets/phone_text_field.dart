import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_z/core/domain/entity/profile/profile.dart';
import 'package:project_z/features/profile/presentation/bloc/profile_screen_bloc.dart';

class ProfilePhoneTextField extends StatelessWidget {
  ProfilePhoneTextField({
    super.key,
    required BuildContext context,
    required this.profile
  }){
    _controllerFirstNum.text = profile.phoneFirstNum ?? '';
    _controllerLastNum.text = profile.phoneLastNum ?? '';
    _focusNodeFirst.addListener((){
      BlocProvider.of<ProfileScreenBloc>(context).add(
        ProfileScreenEvent.refresh(profile.copyWith(
          phoneFirstNum: _controllerFirstNum.text
        ))
      );
    });

    _focusNodeLast.addListener((){
      BlocProvider.of<ProfileScreenBloc>(context).add(
          ProfileScreenEvent.refresh(profile.copyWith(
              phoneLastNum: _controllerLastNum.text
          ))
      );
    });
  }

  final Profile profile;
  final TextEditingController _controllerLastNum = TextEditingController();
  final TextEditingController _controllerFirstNum = TextEditingController();
  final FocusNode _focusNodeFirst = FocusNode();
  final FocusNode _focusNodeLast = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Telefon',
          style: TextStyle(
            color: Color.fromRGBO(125, 125, 125, 1),
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 4),
        SizedBox(
          height: 40,
          child: Stack(
            children: [

              Align(
                alignment: Alignment.centerRight,
                child: SizedBox(
                  width: 300,
                  child: TextField(
                    keyboardType: TextInputType.number,
                    // onEditingComplete: (){
                    //   BlocProvider.of<ProfileScreenBloc>(context).add(
                    //       ProfileScreenEvent.refresh(profile.copyWith(
                    //           phoneLastNum: _controllerLastNum.text
                    //       ))
                    //   );
                    // },
                    controller: _controllerLastNum,
                    focusNode: _focusNodeLast,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color.fromRGBO(245, 245, 247, 1),
                      contentPadding: const EdgeInsets.only(
                        top: 15,
                        left: 30,
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
              ),

              Align(
                alignment: Alignment.centerLeft,
                child: SizedBox(
                  width: 65,
                  child: TextField(
                    keyboardType: TextInputType.number,
                    // onEditingComplete: (){
                    //   BlocProvider.of<ProfileScreenBloc>(context).add(
                    //       ProfileScreenEvent.refresh(profile.copyWith(
                    //           phoneFirstNum: _controllerFirstNum.text
                    //       ))
                    //   );
                    // },
                    controller: _controllerFirstNum,
                    focusNode: _focusNodeFirst,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color.fromRGBO(245, 245, 247, 1),
                      contentPadding: const EdgeInsets.only(
                        top: 12,
                        left: 12,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(
                          color: Color.fromRGBO(16, 53, 91, 1),
                          width: 1,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(
                          color: Color.fromRGBO(16, 53, 91, 1),
                          width: 1,
                        ),
                      ),
                    ),
                    style: const TextStyle(
                      color: Color.fromRGBO(16, 53, 91, 1),
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),


            ],
          ),
        ),
      ],
    );
  }
}