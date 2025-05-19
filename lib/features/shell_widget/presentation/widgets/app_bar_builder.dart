import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:project_z/features/shell_widget/presentation/bloc/shell_screen_bloc.dart';
import 'package:project_z/flutter_app_icons.dart';
import 'package:project_z/shared/consts/colors.dart';

class GeoText extends StatelessWidget {
  const GeoText(this.geo, {super.key});

  final String geo;

  @override
  Widget build(BuildContext context) {
    if (geo.isEmpty) {
      return const SizedBox();
    }
    return Text(': $geo', style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 12, color: Colors.white));
  }
}


class ShopAppBar extends StatefulWidget implements PreferredSizeWidget {
  const ShopAppBar({super.key});

  static const _bottomCircular = 20.0;

  @override
  State<ShopAppBar> createState() => _ShopAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(100);
}

class _ShopAppBarState extends State<ShopAppBar> {
  final FocusNode _searchFocusNode = FocusNode();
  OverlayEntry? _overlayEntry;

  @override
  void initState() {
    super.initState();
    _searchFocusNode.addListener(_handleFocusChange);
  }

  @override
  void dispose() {
    _searchFocusNode.removeListener(_handleFocusChange);
    _searchFocusNode.dispose();
    _overlayEntry?.remove();
    super.dispose();
  }

  void _handleFocusChange() {
    if (_searchFocusNode.hasFocus) {
      _showOverlay();
    } else {
      _hideOverlay();
    }
  }

  void _showOverlay() {
    if (_overlayEntry != null) return;

    final RenderBox appBarRenderBox = context.findRenderObject() as RenderBox;
    final Offset appBarPosition = appBarRenderBox.localToGlobal(Offset.zero);
    final double appBarHeight = appBarRenderBox.size.height;

    _overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        top: appBarPosition.dy + appBarHeight + 10,
        left: appBarPosition.dx + 20,
        width: MediaQuery.of(context).size.width - 40,
        child: Material(
          elevation: 4.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
            side: const BorderSide(
              color: Color.fromRGBO(197, 197, 197, 1),
              width: 1.0,
            ),
          ),
          clipBehavior: Clip.hardEdge,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: const Text('Предложение 1'),
                onTap: () {
                  _searchFocusNode.unfocus();
                },
              ),
              ListTile(
                title: const Text('Предложение 2'),
                onTap: () {
                  _searchFocusNode.unfocus();
                },
              ),
            ],
          ),
        ),
      ),
    );
    Overlay.of(context).insert(_overlayEntry!);
  }

  void _hideOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  final _textFiledBorder = OutlineInputBorder(
    borderSide: const BorderSide(
      color: Color.fromRGBO(16, 53, 91, 1),
      width: 1.0,
    ),
    borderRadius: BorderRadius.circular(16.0),
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(ShopAppBar._bottomCircular),
          bottomRight: Radius.circular(ShopAppBar._bottomCircular),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            spreadRadius: 2,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ColoredBox(
            color: mainColor,
            child: SizedBox(
              height: MediaQuery.of(context).padding.top + 30,
              width: double.infinity,
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, bottom: 5),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        CustomIcons.geo,
                        color: Colors.white,
                        size: 15,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 5),
                        child: Text(
                          'Uzbekiston',
                          style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w400),
                        ),
                      ),
                      BlocBuilder<ShellScreenBloc, ShellScreenState>(
                        buildWhen: (_, state) {
                          return state.maybeMap(
                            orElse: () => false,
                            loading: (d) => true,
                            loaded: (d) => true,
                            updated: (d) => true,
                          );
                        },
                        builder: (context, state) => state.maybeMap(
                          orElse: () => const SizedBox(),
                          loaded: (d) => GeoText(d.geo),
                          updated: (d) => GeoText(d.geo),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          ColoredBox(
            color: Colors.white,
            child: SizedBox(
              height: 60,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    //SvgPicture.asset('assets/app_bar/logo.svg', width: 30, color: mainColor),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 269 / 360,
                          child: TextField(
                            focusNode: _searchFocusNode,
                            decoration: InputDecoration(
                              hintText: 'Qidirish',
                              hintStyle: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Color.fromRGBO(125, 125, 125, 1),
                              ),
                              border: _textFiledBorder,
                              enabledBorder: _textFiledBorder,
                              focusedBorder: _textFiledBorder,
                              contentPadding: const EdgeInsets.only(left: 20, right: 10),
                              suffixIcon: FractionalTranslation(
                                translation: const Offset(-0.025, 0),
                                child: SvgPicture.asset(
                                  'assets/app_bar/search.svg',
                                  height: 46.0,
                                ),
                              ),
                              suffixIconConstraints: const BoxConstraints(
                                maxHeight: 46.0,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 5),
                        SvgPicture.asset(
                          'assets/app_bar/menu.svg',
                          height: 46.0,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}