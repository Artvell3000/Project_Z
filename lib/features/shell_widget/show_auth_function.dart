// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:logger/logger.dart';
// import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
// import 'package:project_z/core/bloc/auth/auth_bloc.dart';
// import 'package:project_z/core/bloc/profile/profile_bloc.dart';
// import 'package:project_z/shared/consts/text_field_style.dart';
// import 'package:project_z/shared/consts/text_style_for_elevation_button.dart';
// import 'package:project_z/shared/consts/text_style_title.dart';
//
// import 'auth_widget.dart';
//
// final phoneMask = MaskTextInputFormatter(
//   mask: '+998 (##) ### ## ##',
//   filter: {"#": RegExp(r'[0-9]')},
// );
//
// abstract class ShowAuthFunction {
//   static final TextEditingController controllerPhone = TextEditingController();
//   static final TextEditingController controllerSurname =
//       TextEditingController();
//   static String phone = '';
//   static String name = '';
//
//   static void body(BuildContext context) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//             contentPadding: EdgeInsets.zero,
//             backgroundColor: Colors.white,
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(10),
//             ),
//             content: const AuthAlertWidget());
//       },
//     );
//   }
// }
//
// class AuthAlertWidget extends StatefulWidget {
//   const AuthAlertWidget({super.key});
//
//   @override
//   State<AuthAlertWidget> createState() => _AuthAlertWidgetState();
// }
//
// class _AuthAlertWidgetState extends State<AuthAlertWidget> {
//   bool isReadyToSend = false;
//   static final TextEditingController controllerPhone = TextEditingController();
//   static final TextEditingController controllerSurname = TextEditingController();
//   String phone = '';
//   String name = '';
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
//       child: (!isReadyToSend)
//           ? Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     const Text("Telefon raqamingizni kiriting",
//                         style: titleTextStyle),
//                     IconButton(
//                       icon: const Icon(Icons.close_rounded,
//                           size: 30, color: Color.fromRGBO(16, 53, 91, 1)),
//                       onPressed: () => Navigator.pop(context),
//                     ),
//                   ],
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(top: 12),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     mainAxisSize: MainAxisSize.max,
//                     children: [
//                       const Text('Ism va familiya', style: textStyleForLabel),
//                       TextField(
//                         controller: controllerSurname,
//                         style: textStyleForTextFieldStyle,
//                         decoration: textFieldDecoration,
//                       )
//                     ],
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(top: 12),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     mainAxisSize: MainAxisSize.max,
//                     children: [
//                       const Text('Telefon', style: textStyleForLabel),
//                       TextField(
//                         controller: controllerPhone,
//                         style: textStyleForTextFieldStyle,
//                         decoration: textFieldDecoration,
//                         keyboardType: TextInputType.phone,
//                         inputFormatters: [phoneMask],
//                       )
//                     ],
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(top: 12),
//                   child: ElevatedButton(
//                       onPressed: () {
//                         if (controllerSurname.text.length > 10 &&
//                             controllerPhone.text.length == 19) {
//                           setState(() {
//                             phone = controllerPhone.text;
//                             //BlocProvider.of<AuthBloc>(context).add(AuthEvent.send(phone));
//                             isReadyToSend = true;
//                           });
//                         }
//                       },
//                       child: const Center(
//                           child: Text('Ro\'yxatdan o\'tish',
//                               style: textStyleForElevationButton))),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(top: 12),
//                   child: Center(
//                     child: RichText(
//                       text: const TextSpan(
//                         children: [
//                           TextSpan(
//                             text: "Akkauntingiz yo'q? ",
//                             style: TextStyle(
//                               fontWeight: FontWeight.w500,
//                               fontSize: 12,
//                               color: Color.fromRGBO(129, 129, 129, 1),
//                             ),
//                           ),
//                           TextSpan(
//                             text: "Avtorizatsiyadan o'tish",
//                             style: TextStyle(
//                               fontWeight: FontWeight.w500,
//                               fontSize: 12,
//                               color: Color.fromRGBO(16, 53, 91, 1),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             )
//           : BlocBuilder<AuthBloc, AuthState>(
//               builder: (context, state) {
//                 return state.mapOrNull(
//                     loading:(d) => const SizedBox(width: 200, height: 200, child: Center(child: CircularProgressIndicator(),),),
//                     errorSend: (d) => SizedBox(width: 200, height: 200, child: Center(child:Text(d.message),),),
//                     wasSend: (d){
//                       Logger().i('[Auth code] ${d.code}');
//                       return Column(
//                         mainAxisSize: MainAxisSize.min,
//                         children: [
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               FractionalTranslation(
//                                 translation: const Offset(-0.1, 0),
//                                 child: TextButton(
//                                   onPressed: () {
//                                     setState(() {
//                                       isReadyToSend = false;
//                                     });
//                                   },
//                                   child: const Row(
//                                     mainAxisSize: MainAxisSize.min,
//                                     // Занимаем только необходимое пространство
//                                     children: [
//                                       Icon(
//                                         Icons.chevron_left_outlined,
//                                         color: Colors.black,
//                                         size: 36,
//                                       ),
//                                       SizedBox(width: 1),
//                                       // Небольшой отступ между иконкой и текстом
//                                       Text(
//                                         'Kodni kiriting',
//                                         style: titleTextStyle,
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                               IconButton(
//                                 icon: const Icon(Icons.close_rounded,
//                                     size: 30, color: Color.fromRGBO(16, 53, 91, 1)),
//                                 onPressed: () => Navigator.pop(context),
//                               ),
//                             ],
//                           ),
//                           const Align(
//                               alignment: Alignment.centerLeft,
//                               child: Text(
//                                 'Telefonni tasdiqlash uchun \nCompanyBot 6 xonali kod yuborildi',
//                                 style: textStyleForLabel,
//                               )),
//                           Padding(
//                             padding: const EdgeInsets.only(top: 10),
//                             child: PinCodeInputScreen(
//                               toVerify: () {
//
//                               },
//                             ),
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.only(top: 12),
//                             child: ElevatedButton(
//                               style: ElevatedButton.styleFrom(
//                                 backgroundColor: Colors.white,
//                                 side: const BorderSide(
//                                   color:
//                                   Color.fromRGBO(197, 197, 197, 1),
//                                   width: 1,
//                                 ),
//                                 shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(12),
//                                 ),
//                                 padding: EdgeInsets.symmetric(vertical: 12),
//                               ),
//                               onPressed: () {
//                                 // Действие при нажатии
//                               },
//                               child: const SizedBox(
//                                 width: double.infinity,
//                                 child: Center(
//                                   child: Text(
//                                     'Telegram Bot',
//                                     style: TextStyle(
//                                       color: Color.fromRGBO(16, 53, 91, 1),
//                                       fontWeight: FontWeight.w700,
//                                       fontSize: 12,
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.only(top: 12),
//                             child: ElevatedButton(
//                               style: ElevatedButton.styleFrom(
//                                 shape: RoundedRectangleBorder(
//                                   borderRadius:
//                                   BorderRadius.circular(12),
//                                 ),
//                                 padding:
//                                 EdgeInsets.zero,
//                               ),
//                               onPressed: () {},
//                               child: Container(
//                                 width: double.infinity,
//                                 padding: const EdgeInsets.symmetric(vertical: 12),
//                                 child: const Center(
//                                   child: Text(
//                                     'Ro\'yxatdan o\'tish',
//                                     style: textStyleForElevationButton,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ),
//                           const Padding(
//                             padding: EdgeInsets.only(top: 12),
//                             child: Center(
//                               child: Text(
//                                 'Agar kod kelmasa, siz 120 soniya orqali\nangisini olishingiz mumkin',
//                                 textAlign: TextAlign.center,
//                                 style: textStyleForLabel,
//                               ),
//                             ),
//                           )
//                         ],
//                       );
//                     }
//                 ) ?? const SizedBox();
//               },
//             ),
//     );
//   }
// }
