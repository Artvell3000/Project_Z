import 'package:flutter/material.dart';

const elTextStyle = TextStyle(
  fontSize: 12,
  color: Color.fromRGBO(125, 125, 125, 1),
  fontWeight: FontWeight.w400,
);

class ProductCharacteristicsWidget extends StatelessWidget {
  const ProductCharacteristicsWidget({super.key, required this.info, required this.characteristics});
  final Map<String, String> info;
  final Map<String, String> characteristics;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(width: double.infinity,),
        const Text('Maxsulot xarakteristikasi', style: TextStyle(
            color: Colors.black,
          fontWeight: FontWeight.w700,
          fontSize: 16
        ),),
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: info.entries.map((e){
              return Text('${e.key}: ${e.value}', style: elTextStyle,);
            }).toList(),
          ),
        ),

        const Padding(
          padding: EdgeInsets.only(top: 30),
          child: Text('Maxsulot haqida maʼlumot', style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w700,
              fontSize: 16
          ),),
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: characteristics.entries.map((e){
            return Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Column(
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(e.key, style: elTextStyle,),
                      Text(e.value, style: elTextStyle,),
                    ],
                  ),
                  Container(color: const Color.fromRGBO(197, 197, 197, 1), height: 1, width: double.infinity,),
                ],
              ),
            );
          }).toList(),
        )
      ],
    );
  }
}
