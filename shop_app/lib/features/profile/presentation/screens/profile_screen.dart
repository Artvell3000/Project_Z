import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:logger/logger.dart';
import 'package:project_z/core/di/di.dart';
import 'package:project_z/features/profile/presentation/bloc/profile_screen_bloc.dart';
import 'package:project_z/features/profile/presentation/widgets/widgets.dart';
import 'package:project_z/features/shell_widget/presentation/bloc/shell_screen_bloc.dart';
import 'package:project_z/flutter_app_icons.dart';
import 'package:project_z/l10n/app_localizations.dart';
import 'package:project_z/shared/auth/un_auth_placeholder.dart';
import 'package:project_z/shared/consts/colors.dart';
import 'package:project_z/shared/consts/text_style_title.dart';
import 'package:project_z/shared/widgets/loading_card.dart';

@RoutePage()
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  final loadingWidget =
  const SizedBox(width: double.infinity, height: 200, child: Center(child: CircularProgressIndicator()));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => getIt<ProfileScreenBloc>(),
        child: BlocListener<ShellScreenBloc, ShellScreenState>(
          listener: (context, state) {
            state.mapOrNull(
                loaded: (d) {
                  BlocProvider.of<ProfileScreenBloc>(context).add(const ProfileScreenEvent.refresh());
                }
            );
          },
          child: BlocListener<ProfileScreenBloc, ProfileScreenState>(
            listener: (context, state) {
              Logger().i(state.toString());
            },
            child: BlocBuilder<ProfileScreenBloc, ProfileScreenState>(
              builder: (context, state) {
                final isUnAuth = state.mapOrNull(
                  needAuth: (d) => true
                ) ?? false;
                if(isUnAuth){
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 30, bottom: 80),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                AppLocalizations.of(context)!.profileTitle,
                                style: titleTextStyle,
                              ),
                              const LanguageSwitch()
                            ],
                          ),
                        ),
                        const UnAuthPlaceholder(),
                      ],
                    ),
                  );
                }

                return SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Column(children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 30, bottom: 20),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              AppLocalizations.of(context)!.profileTitle,
                              style: titleTextStyle,
                            ),
                            const LanguageSwitch()
                          ],
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.white),
                        padding: const EdgeInsets.only(left: 15, right: 15, top: 12, bottom: 19),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const Icon(CustomIcons.information),
                                Text(
                                  AppLocalizations.of(context)!.profileUserInfoTitle,
                                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black),
                                )
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 13),
                              child: Text(
                                AppLocalizations.of(context)!.profileFullNameLabel,
                                style: const TextStyle(
                                  color: Color.fromRGBO(125, 125, 125, 1),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            BlocBuilder<ProfileScreenBloc, ProfileScreenState>(
                              builder: (BuildContext context, ProfileScreenState state) {
                                return state.whenOrNull(
                                    loading: () {
                                      return const SizedBox(
                                        width: double.infinity,
                                        height: 50,
                                        child: LoadingCard(),
                                      );
                                    },
                                    loaded: (profile) {
                                      return ProfileSurnameTextField(
                                        context: context,
                                        name: profile.fullName ?? '',
                                        onFullNameEntered: (name) {
                                          BlocProvider.of<ProfileScreenBloc>(context)
                                              .add(ProfileScreenEvent.refreshFullName(name));
                                        },
                                      );
                                    },
                                    error: (e) =>
                                        Center(
                                          child: Text(e.toString()),
                                        )) ?? const SizedBox();
                              },
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Text(
                                AppLocalizations.of(context)!.profilePhoneLabel,
                                style: const TextStyle(
                                  color: Color.fromRGBO(125, 125, 125, 1),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            BlocBuilder<ProfileScreenBloc, ProfileScreenState>(
                              builder: (BuildContext context, ProfileScreenState state) {
                                return state.whenOrNull(
                                    loading: () {
                                      return const SizedBox(
                                        width: double.infinity,
                                        height: 50,
                                        child: LoadingCard(),
                                      );
                                    },
                                    loaded: (profile) {
                                      return ProfilePhoneTextField(
                                        phone: profile.username ?? '',
                                        onPhoneEntered: (phone) {
                                          BlocProvider.of<ProfileScreenBloc>(context)
                                              .add(ProfileScreenEvent.refreshUsername(phone));
                                        },
                                      );
                                    },
                                    error: (e) =>
                                        Center(
                                          child: Text(e.toString()),
                                        )) ?? const SizedBox();
                              },
                            ),
                          ],
                        ),
                      ),
                      BlocBuilder<ProfileScreenBloc, ProfileScreenState>(
                        builder: (context, state) {
                          return state.whenOrNull(
                            loading: () => const SizedBox(),
                            loaded: (user) {
                              return AddGeoContainer(
                                userIsNull: user == null,
                                town: user.town ?? '',
                                district: user.district ?? '',
                                onDistinctEntered: (distinct) {
                                  BlocProvider.of<ProfileScreenBloc>(context)
                                      .add(ProfileScreenEvent.refreshDistrict(distinct));
                                },
                                onTownEntered: (town) {
                                  BlocProvider.of<ProfileScreenBloc>(context).add(ProfileScreenEvent.refreshTown(town));
                                },
                              );
                            },
                            error: (e) =>
                                Center(
                                  child: Text(e.toString()),
                                ),

                          ) ?? const SizedBox();
                        },
                      ),
                    ]),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

class AddGeoContainer extends StatefulWidget {
  const AddGeoContainer({
    super.key,
    required this.town,
    required this.district,
    required this.onTownEntered,
    required this.onDistinctEntered,
    required this.userIsNull,
  });

  final bool userIsNull;
  final String town;
  final String district;
  final void Function(String town) onTownEntered;
  final void Function(String distinct) onDistinctEntered;

  @override
  State<AddGeoContainer> createState() => _AddGeoContainerState();
}

class _AddGeoContainerState extends State<AddGeoContainer> {
  bool hasClickedAddGeo = false;

  @override
  Widget build(BuildContext context) {
    bool showTextFields = widget.town != '' || widget.district != '' || hasClickedAddGeo;
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.white),
        child: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, top: 13, bottom: 15),
          child: Column(
            children: [
              Row(
                children: [
                  const Icon(CustomIcons.geo),
                  Text(
                    AppLocalizations.of(context)!.profileGeoTitle,
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: (!showTextFields)
                    ? SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          ///проверка auth
                          //todo
                        });
                      },
                      child: const Text(
                        '+ Manzil qo’shish',
                        style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16, color: Colors.white),
                      )),
                )
                    : Column(
                  children: [
                    ProfileTextField(
                      town: widget.town,
                      onEntered: widget.onTownEntered,
                      label: AppLocalizations.of(context)!.profileTown,
                      isDistrictSelector: true,
                      districts: const [
                        'Toshkent',
                        'Toshkent viloyati',
                        'Samarqand',
                        'Farg’ona',
                        'Buxoro',
                        'Xorazm',
                        'Andijon',
                        'Navoiy',
                        'Qashqadaryo',
                        'Jizzax',
                        'Surxondaryo',
                        'Namangan',
                        'Sirdaryo',
                        'Xiva'
                      ],
                      context: context,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: ProfileTextField(
                        district: widget.district,
                        onEntered: widget.onDistinctEntered,
                        label: AppLocalizations.of(context)!.profileDistinct,
                        isDistrictSelector: true,
                        districts: const [
                          'Olmazor tumani',
                          'Bektemir tumani',
                          'Mirobod tumani',
                          'Mirzo Ulug‘bek tumani',
                          'Sergeli tumani',
                          'Chilonzor tumani',
                          'Shayxontohur tumani',
                          'Yunusobod tumani',
                          'Yakkasaroy tumani',
                          'Yashnobod tumani',
                          'Uchtepa tumani'
                        ],
                        context: context,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
