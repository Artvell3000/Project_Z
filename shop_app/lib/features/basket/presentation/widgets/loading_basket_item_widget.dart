import 'package:flutter/material.dart';
import 'package:project_z/shared/widgets/loading_card.dart';

class LoadingBasketItemWidget extends StatelessWidget {
  const LoadingBasketItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 180,
      width: 400,
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                SizedBox(
                  height: 100,
                  width: 100,
                  child: LoadingCard(),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 30,
                        width: 200,
                        child: LoadingCard(),
                      ),
                      SizedBox(height: 4.0),
                      SizedBox(
                        height: 30,
                        width: 150,
                        child: LoadingCard(),
                      ),
                      SizedBox(height: 4.0),
                      SizedBox(
                        height: 30,
                        width: 100,
                        child: LoadingCard(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 8.0),
              child: SizedBox(
                height: 40,
                width: double.infinity,
                child: LoadingCard(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
