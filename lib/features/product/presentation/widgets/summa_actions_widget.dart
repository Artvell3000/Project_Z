
import 'package:flutter/material.dart';
import 'package:project_z/shared/consts/text_style_for_elevation_button.dart';

class SummaActionsWidget extends StatelessWidget {
  const SummaActionsWidget({super.key, required this.summa});

  final String summa;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 11.0, vertical: 15),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 1),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$summa сум',
            style: const TextStyle(
                fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black),
          ),
          const SizedBox(height: 10),
          SizedBox(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  flex: 150,
                  child: ElevatedButton(
                    onPressed: () {
                      
                    },
                    child: const SizedBox(
                      height: 60,
                      child: Center(
                          child: Text(
                            'Savatchaga \nqoshish',
                            style: textStyleForElevationButton,
                            textAlign: TextAlign.center,
                          )),
                    ),
                  ),
                ),
                const Expanded(flex: 8, child: SizedBox()),
                Expanded(
                  flex: 150,
                  child: ElevatedButton(
                    onPressed: () {

                    },
                    child: const SizedBox(
                      height: 60,
                      child: Center(
                          child: Text(
                            'Sotib olish',
                            style: textStyleForElevationButton,
                            textAlign: TextAlign.center,
                          )),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}