import 'package:flutter/material.dart';
import 'package:project_z/shared/consts/text_style_title.dart';

class BasketItemWidget extends StatelessWidget {
  const BasketItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      width: 400,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Image.network(
                  'https://i.ibb.co/tw7Qn7yn/photo.png',
                  width: 100,
                  height: 100,
                  fit: BoxFit.contain,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Text(
                            '3 458 000 so\'m',
                            style: titleTextStyle,
                          ),
                          const SizedBox(width: 8.0),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(17.0),
                            ),
                            child: const Text(
                              '-36%',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 12.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4.0),
                      const Text(
                        'Smistetil SL77-001F...',
                        style: TextStyle(
                            fontSize: 14.0, color: Color.fromRGBO(97, 97, 97, 1), fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(height: 4.0),
                      const Text(
                        'Mahsulot kodi: 5389',
                        style: TextStyle(
                          color: Color.fromRGBO(130, 130, 130, 1),
                          fontWeight: FontWeight.w400,
                          fontSize: 14.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                      onPressed: () {
                        //todo unselect
                      },
                      icon: const Icon(Icons.check_circle, color: Color.fromRGBO(16, 53, 91, 1), size: 30.0)),
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            //todo remove one
                          },
                          icon: const Icon(
                            Icons.remove,
                            size: 30.0,
                            color: Colors.black,
                          )),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 17.0),
                        child: Text('3',
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.w600,
                              color: Color.fromRGBO(40, 47, 60, 1),
                            )),
                      ),
                      IconButton(
                        onPressed: () {
                          //todo add one
                        },
                        icon: const Icon(
                          Icons.add,
                          size: 30.0,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  IconButton(
                      onPressed: () {
                        //todo delete item
                      },
                      icon: const Icon(Icons.delete_outline, color: Color.fromRGBO(148, 153, 165, 1), size: 30.0)),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
