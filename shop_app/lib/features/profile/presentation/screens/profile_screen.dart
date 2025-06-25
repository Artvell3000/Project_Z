import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:logger/logger.dart';
import 'package:project_z/config/theme/text_styles_extension.dart';
import 'package:project_z/core/di/di.dart';
import 'package:project_z/features/profile/presentation/bloc/profile_screen_bloc.dart';
import 'package:project_z/features/profile/presentation/widgets/widgets.dart';
import 'package:project_z/features/shell_widget/presentation/bloc/shell_screen_bloc.dart';
import 'package:project_z/gen_assets/assets.gen.dart';
import 'package:project_z/gen_locales/app_localizations.dart';
import 'package:project_z/shared/auth/un_auth_placeholder.dart';
import 'package:project_z/shared/functions/show_alert_dialog/show_cant_change_phone_alert_dialog_function.dart';
import 'package:project_z/shared/widgets/loading_card.dart';

@RoutePage()
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textStyles = theme.extension<AppTextStyles>();
    final S = AppLocalizations.of(context);

    return Scaffold(
      body: BlocProvider(
          create: (context) => getIt<ProfileScreenBloc>(),
          child: Padding(
            padding: const EdgeInsets.only(top: 30.0, left: 10, right: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(S.profileTitle, style: textStyles!.heading),
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  child: ProfileContainer(
                    textStyles: textStyles,
                    title: S.profileUserInfoTitle,
                    iconTitleProvider: Assets.icons.profile.userInfo.keyName,
                    label1: S.profileFullNameLabel,
                    textFormField1: TextFormField(),
                    label2: S.profilePhoneLabel,
                    textFormField2: PhoneStub(phone: '', colorScheme: theme.colorScheme,),
                  ),
                ),
                GeoContainer(textStyles: textStyles, S: S)
              ],
            ),
          )),
    );
  }
}

class GeoContainer extends StatefulWidget {
  const GeoContainer({
    super.key,
    required this.textStyles,
    required this.S, this.town, this.distinct,
  });

  final AppTextStyles? textStyles;
  final AppLocalizations S;
  final String? town;
  final String? distinct;

  @override
  State<GeoContainer> createState() => _GeoContainerState();
}

class _GeoContainerState extends State<GeoContainer> {
  bool showInfo = false;

  @override
  void initState() {
    showInfo = widget.distinct != null || widget.town != null;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return (showInfo) ? ProfileContainer(
      textStyles: widget.textStyles,
      title: widget.S.profileGeoTitle,
      iconTitleProvider: Assets.icons.shared.geo.keyName,
      label1: widget.S.profileDistinct,
      textFormField1: Container(),
      label2: widget.S.profileTown,
      textFormField2: Container(),
    ) : ElevatedButton(onPressed: (){
      setState(() {
        showInfo = true;
      });
    }, child: Center(child: Text(widget.S.profileAddGeo)));
  }
}

class PhoneStub extends StatefulWidget {
  const PhoneStub(
      {super.key, required this.phone, this.textStyles, this.colorScheme});

  final String phone;
  final AppTextStyles? textStyles;
  final ColorScheme? colorScheme;

  @override
  State<PhoneStub> createState() => _PhoneStubState();
}

class _PhoneStubState extends State<PhoneStub> {
  final showAlert = ShowChangePhoneAlertDialogFunction();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => showAlert(context),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: const Color(0xFFF5F5F7),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: const Color(0xFFC5C5C5),
                width: 1,
              ),
            ),
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 84.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  '880 80 80',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                    fontWeight: FontWeight.w400
                  ),
                ),
              ),
            ),
          ),
          Container(
                  width: 70,
                  decoration: BoxDecoration(
                    color: const Color(0xFFF5F5F7),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: widget.colorScheme?.primary ?? Colors.red,
                      width: 1,
                    ),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    '+998',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: widget.colorScheme?.primary,
                    ),
                  ),
                )
        ],
      ),
    );
  }
}

class ProfileContainer extends StatelessWidget {
  const ProfileContainer({
    super.key,
    required this.textStyles,
    required this.title,
    required this.label1,
    required this.label2,
    required this.textFormField1,
    required this.textFormField2, required this.iconTitleProvider,
  });

  final String title;
  final String label1;
  final String label2;
  final Widget textFormField1;
  final Widget textFormField2;
  final AppTextStyles? textStyles;
  final String iconTitleProvider;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(
          14, 12, 14, 19), // Отступы: слева 14, сверху 12, справа 14, снизу 19
      decoration: BoxDecoration(
        color: Colors.white, // Цвет фона контейнера
        borderRadius: BorderRadius.circular(10), // Закругление углов на 10
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SvgPicture.asset(
                iconTitleProvider,
                width: 20,
              ),
              Padding(
                  padding: const EdgeInsets.only(left: 6),
                  child: Text(title, style: textStyles?.heading))
            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 13, 0, 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(label1, style: textStyles?.label),
                SizedBox(height: 40, child: textFormField1)
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(label2, style: textStyles?.label),
              SizedBox(height: 40, child: textFormField2)
            ],
          )
        ],
      ),
    );
  }
}
