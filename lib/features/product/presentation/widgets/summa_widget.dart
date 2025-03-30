import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:project_z/flutter_app_icons.dart';

class SummaInfoWidget extends StatelessWidget {
  const SummaInfoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(
                CustomIcons.box,
                size: 25,
                color: Color.fromRGBO(125, 125, 125, 1),
              ),
              const SizedBox(width: 8.0),
              RichText(
                text: const TextSpan(
                  children: [
                    TextSpan(
                      text: 'Способы получения: ',
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: Colors.black),
                    ),
                    TextSpan(
                      text: 'Доставка, \nсамовывоз',
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                          color: Colors.black),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 20.0),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(
                CustomIcons.wallet,
                size: 25,
                color: Color.fromRGBO(125, 125, 125, 1),
              ),
              const SizedBox(width: 8.0),
              RichText(
                text: const TextSpan(
                  children: [
                    TextSpan(
                      text: 'Способы оплаты: ',
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: Colors.black),
                    ),
                    TextSpan(
                      text: 'HUMO, UzCard, \nплатежные системы',
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                          color: Colors.black),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 20.0),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'assets/icons/guarantee.svg',
                width: 25,
                height: 25,
                color: const Color.fromRGBO(125, 125, 125, 1),
              ),
              const SizedBox(width: 8.0),
              const Expanded(
                child: Text(
                  'Гарантия на товар',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                  softWrap: true,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}