import 'package:flutter/material.dart';
import 'package:project_z/shared/consts/text_style_for_elevation_button.dart';

class MessageWidget extends StatelessWidget {
  MessageWidget({super.key});

  final surnameController = TextEditingController();
  final phoneController = TextEditingController();
  final cityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Ariza qoldiring.',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Color.fromRGBO(16, 53, 91, 1),
                )),
            const SizedBox(
              height: 10,
              width: double.infinity,
            ),
            const Text('So\'rov qoldiring va bizning mutaxassislarimiz tez \norada siz bilan bog\'lanadi.',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                )),
            const SizedBox(
              height: 10,
            ),
            MessageTextField(
              hint: "Ism Familiya*",
              controller: surnameController,
            ),
            const SizedBox(
              height: 10,
            ),
            MessageTextField(
              hint: "Telefon raqam*",
              controller: phoneController,
            ),
            const SizedBox(
              height: 10,
            ),
            MessageTextField(
              hint: "Uzbekiston, Toshkent*",
              controller: cityController,
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {},
                child: const Center(
                  child: Text(
                    'Ariza qoldirish',
                    style: textStyleForElevationButton,
                  ),
                ))
          ],
        ),
      ),
    );
  }
}

class MessageTextField extends StatelessWidget {
  const MessageTextField({
    super.key,
    required this.hint,
    required this.controller,
  });

  final String hint;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: double.infinity,
      child: TextField(
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(
            color: Color.fromRGBO(125, 125, 125, 1), // Цвет hintText
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        ),
      ),
    );
  }
}
