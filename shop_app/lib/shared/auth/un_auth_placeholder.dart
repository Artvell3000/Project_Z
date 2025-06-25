import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:project_z/core/routing/router.dart';
import 'package:project_z/gen_assets/assets.gen.dart';
import 'package:project_z/gen_locales/app_localizations.dart';


class UnAuthPlaceholder extends StatelessWidget {
  const UnAuthPlaceholder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final S = AppLocalizations.of(context);

    return Center(
        child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(Assets.img.authentication.unauth.path, width: 100,),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Text(S.unauthText),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: ElevatedButton(
                  onPressed: (){
                    AutoRouter.of(context).push(const AuthShellRoute());
                  },
                  child: Center(child: Text(S.unauthButtonText, style: const TextStyle(color: Colors.white),)),
                ),
              )
            ]
        )
    );
  }
}