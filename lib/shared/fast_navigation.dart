import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:project_z/core/routing/router.dart';

class FastNavigation extends StatelessWidget {
  const FastNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        TextButton(
          onPressed: () {
            AutoRouter.of(context).back();
          },
          style: TextButton.styleFrom(
            foregroundColor: Colors.black,
            textStyle: const TextStyle(fontWeight: FontWeight.w400),
          ),
          child: const Row(
            children: [
              Icon(Icons.arrow_back_ios, size: 16),
              Text('Ortga', style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.black
              ),),
            ],
          ),
        ),


        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: TextButton(
            style: TextButton.styleFrom(
              backgroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 5),
              minimumSize: const Size(90, 30), // Высота 30
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            onPressed: () {
              AutoRouter.of(context).push(const HomeRoute());
            },
            child: const Text(
              'Bosh sahifa',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 12,
                color: Color.fromRGBO(167, 167, 167, 1),
              ),
            ),
          ),
        ),

        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: TextButton(
            style: TextButton.styleFrom(
              backgroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 5),
              minimumSize: const Size(120, 30), // Высота 30
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            onPressed: () {
              AutoRouter.of(context).push(SearchRoute());
            },
            child: const Text(
              'Mening sahifam',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 12,
                color: Color.fromRGBO(167, 167, 167, 1),
              ),
            ),
          ),
        )
      ],
    );
  }
}