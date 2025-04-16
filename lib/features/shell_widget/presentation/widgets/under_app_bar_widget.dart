import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:project_z/core/routing/router.dart';
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
                  onTap: () {

                  },
                  padding: const EdgeInsets.only(right: 5),
                  child: const Icon(
                    CustomIcons.search,
                    color: Colors.white,
                    size: 20.0,
                  ),
                ),
                UnderAppBarActionButton(
                  child: SvgPicture.asset(
                    'assets/icons/menu.svg',
                    height: 20.0,
                  ),
                  onTap: () {
                    AutoRouter.of(context).push(const MenuRoute());
                  },
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
    required this.child,
    required this.onTap,
    this.padding,
  });

  final Widget child;
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
              child: child,
            )),
      ),
    );
  }
}
