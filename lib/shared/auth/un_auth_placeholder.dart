import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:project_z/core/routing/router.dart';

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
              SvgPicture.asset('assets/authentication/unauthentication.svg', width: 300,),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: ElevatedButton(
                  onPressed: (){
                    AutoRouter.of(context).push(const AuthenticationSendCodeRoute());
                  },
                  child: const Center(child: Text('Xato hisobotini yuboring', style: TextStyle(color: Colors.white),)),
                ),
              )
            ]
        )
    );
  }
}