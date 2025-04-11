import 'package:flutter/material.dart';
import 'package:project_z/flutter_app_icons.dart';

const String textLogo = 'Logo \ncompany';

class UnderAppBarWidget extends StatelessWidget {
  const UnderAppBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 14),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              textLogo,
              style: TextStyle(
                color: Color.fromRGBO(16, 53, 91, 1),
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                UnderAppBarActionButton(
                  iconData: CustomIcons.search,
                  onTap: () {},
                  padding: const EdgeInsets.only(right: 5),
                ),
                UnderAppBarActionButton(
                  iconData: Icons.menu,
                  onTap: () {},
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class UnderAppBarActionButton extends StatelessWidget {
  const UnderAppBarActionButton({
    super.key,
    required this.iconData,
    required this.onTap,
    this.padding,
  });

  final IconData iconData;
  final void Function() onTap;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding != null ? padding! : const EdgeInsets.all(0.0),
      child: SizedBox(
        width: 46,
        height: 46,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            )),
            onPressed: onTap,
            child: Center(
              child: Icon(
                iconData,
                color: Colors.white,
                size: 20.0,
              ),
            )),
      ),
    );
  }
}
