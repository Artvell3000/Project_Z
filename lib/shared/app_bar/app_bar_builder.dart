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

class ShopAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ShopAppBar({super.key});

  static const _bottomCircular = 20.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      //decoration: const BoxDecoration(
      // borderRadius: BorderRadius.only(
      //   bottomLeft: Radius.circular(_bottomCircular),
      //   bottomRight: Radius.circular(_bottomCircular),
      // ),
      // boxShadow: [
      //   BoxShadow(
      //     color: Colors.black.withOpacity(0.1),
      //     blurRadius: 8,
      //     spreadRadius: 2,
      //     offset: const Offset(0, 4),
      //   ),
      // ],
      //),

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
                              updated: (d) => GeoText(d.geo)))
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
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                  SvgPicture.asset('assets/app_bar/logo.svg', width: 30, color: mainColor),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SvgPicture.asset(
                        'assets/app_bar/search.svg',
                        height: 46.0,
                      ),
                      const SizedBox(width: 5),
                      SvgPicture.asset(
                        'assets/app_bar/menu.svg',
                        height: 46.0,
                      ),
                    ],
                  )
                ]),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(100);
}
