import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_z/core/domain/entity/custom_user/custom_user.dart';
import 'package:project_z/features/profile/presentation/bloc/profile_screen_bloc.dart';
import 'package:project_z/shared/functions/checker_phone.dart';

class ProfilePhoneTextField extends StatelessWidget {
  ProfilePhoneTextField({
    super.key,
    required BuildContext context,
    required this.phone, required this.onPhoneEntered
  }){
    _controllerFirstNum.text = (phone == '')? '+998' : phone.substring(0,5);
    _controllerLastNum.text = (phone == '')? '' : phone.substring(5,19);
    _focusNodeFirst.addListener((){
      final result = _controllerFirstNum.text + _controllerLastNum.text;
      if(CheckerPhone.isUzPhoneNumber(result)){
        onPhoneEntered(result);
      }
    });

    _focusNodeLast.addListener((){
      final result = _controllerFirstNum.text + _controllerLastNum.text;
      if(CheckerPhone.isUzPhoneNumber(result)){
        onPhoneEntered(result);
      }
    });
  }

  final void Function(String phone) onPhoneEntered;
  final TextEditingController _controllerLastNum = TextEditingController();
  final TextEditingController _controllerFirstNum = TextEditingController();
  final FocusNode _focusNodeFirst = FocusNode();
  final FocusNode _focusNodeLast = FocusNode();
  final String phone;


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
                    controller: _controllerLastNum,
                    focusNode: _focusNodeLast,
                    decoration: decorationFirst,
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
                    controller: _controllerFirstNum,
                    focusNode: _focusNodeFirst,
                    decoration: decorationLast,
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

var decorationFirst = InputDecoration(
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
);

var decorationLast = InputDecoration(
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
);