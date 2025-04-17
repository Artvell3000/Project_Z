import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:project_z/core/routing/router.dart';
import 'package:project_z/flutter_app_icons.dart';

const String textLogo = 'Logo \ncompany';



const searchTextStyle = TextStyle(
  color: Colors.black,
  fontWeight: FontWeight.w400,
  fontSize: 16,
);

final textFieldDecoration =  InputDecoration(
  hintText: 'Qidirish',
  hintStyle: const TextStyle(
    color: Color.fromRGBO(125, 125, 125, 1),
    fontWeight: FontWeight.w400,
    fontSize: 16,
  ),
  filled: true,
  fillColor: Colors.white,
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(14),
    borderSide: const BorderSide(
      color: Color.fromRGBO(16, 53, 91, 1),
      width: 1.0,
    ),
  ),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(14),
    borderSide: const BorderSide(
      color: Color.fromRGBO(16, 53, 91, 1),
      width: 1.0,
    ),
  ),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(14),
  ),
);

class UnderAppBarWidget extends StatefulWidget {
  const UnderAppBarWidget({
    super.key,
  });

  @override
  State<UnderAppBarWidget> createState() => _UnderAppBarWidgetState();
}

class _UnderAppBarWidgetState extends State<UnderAppBarWidget> {

  final FocusNode _textFieldFocusNode = FocusNode();
  final TextEditingController _textController = TextEditingController();

  @override
  void dispose() {
    _textFieldFocusNode.dispose();
    _textController.dispose();
    super.dispose();
  }

  bool tapedOnSearch = false;

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if(tapedOnSearch) _textFieldFocusNode.requestFocus();
    });
    return ColoredBox(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 14),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: SizedBox(
                height: 57,
                child: (tapedOnSearch) ? SizedBox(
                  width: 290,
                  child: TextField(
                    focusNode: _textFieldFocusNode,
                    decoration: textFieldDecoration,
                    style: searchTextStyle,
                  )): const Text(
                  textLogo,
                  style: TextStyle(
                    color: Color.fromRGBO(16, 53, 91, 1),
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  UnderAppBarActionButton(
                    onTap: () {
                      setState(() {
                        tapedOnSearch = !tapedOnSearch;
                      });
                    },
                    padding: const EdgeInsets.only(right: 5),
                    child: const Icon(
                      CustomIcons.search,
                      color: Colors.white,
                      size: 25.0,
                    ),
                  ),
                  UnderAppBarActionButton(
                    child: SvgPicture.asset(
                      'assets/icons/menu.svg',
                      height: 25.0,
                    ),
                    onTap: () {
                      AutoRouter.of(context).push(const MenuRoute());
                    },
                  ),
                ],
              ),
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
        width: 56,
        height: 56,
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
