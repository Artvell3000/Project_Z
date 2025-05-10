import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:project_z/core/routing/router.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class UnAuthPlaceholder extends StatelessWidget {
  const UnAuthPlaceholder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset('assets/authentication/unauth.svg', width: 100,),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Text(AppLocalizations.of(context)!.unauthText),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: ElevatedButton(
                  onPressed: (){
                    AutoRouter.of(context).push(const AuthenticationSendCodeRoute());
                  },
                  child: Center(child: Text(AppLocalizations.of(context)!.unauthButtonText, style: const TextStyle(color: Colors.white),)),
                ),
              )
            ]
        )
    );
  }
}