import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_z/core/di/di.dart';
import 'package:project_z/data/data_entity/custom_user_json.dart';
import 'package:project_z/features/product/presentation/widgets/widgets.dart';
import 'package:project_z/features/profile/presentation/bloc/profile_screen_bloc.dart';
import 'package:project_z/features/profile/presentation/widgets/widgets.dart';
import 'package:project_z/flutter_app_icons.dart';
import 'package:project_z/shared/scaffolds/z_scaffold.dart';


@RoutePage()
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ProfileScreenBloc>(),
      child: ZScaffold(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 12.0),
              child: FastNavigation(),
            ),
            const SizedBox(
              height: 30,
            ),
            const Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Mening sahifam',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.black),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white),
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 15, right: 15, top: 12, bottom: 19),
                  child: Column(
                    children: [
                      const Row(
                        children: [
                          Icon(CustomIcons.information),
                          Text(
                            'Sizning ma\'lumotlaringiz',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.black),
                          )
                        ],
                      ),
                      BlocBuilder<ProfileScreenBloc, ProfileScreenState>(
                        builder:
                            (BuildContext context, ProfileScreenState state) {
                          return state.when(
                              loading: () => const Center(
                                    child: CircularProgressIndicator(),
                                  ),
                              loaded: (profile) {
                                return Padding(
                                  padding: const EdgeInsets.only(top: 13),
                                  child: ProfileSurnameTextField(
                                    context: context,
                                    profile: profile,
                                  ),
                                );
                              },
                              error: (message) => Center(
                                    child: Text(message),
                                  ));
                        },
                      ),
                      BlocBuilder<ProfileScreenBloc, ProfileScreenState>(
                        builder:
                            (BuildContext context, ProfileScreenState state) {
                          return state.when(
                              loading: () => const Center(
                                    child: CircularProgressIndicator(),
                                  ),
                              loaded: (profile) {
                                return Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: ProfilePhoneTextField(
                                    context: context,
                                    user: profile,
                                  ),
                                );
                              },
                              error: (message) => Center(
                                    child: Text(message),
                                  ));
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
            BlocBuilder<ProfileScreenBloc, ProfileScreenState>(
              builder: (context, state) {
                return state.when(
                    loading: () => const Center(
                          child: CircularProgressIndicator(),
                        ),
                    loaded: (user) {
                      return AddGeoContainer(
                        user: user,
                      );
                    },
                    error: (message) => Center(
                          child: Text(message),
                        ));
              },
            ),
          ]),
    );
  }
}

class AddGeoContainer extends StatefulWidget {
  const AddGeoContainer({super.key, required this.user});
  final CustomUserJson user;

  @override
  State<AddGeoContainer> createState() => _AddGeoContainerState();
}

class _AddGeoContainerState extends State<AddGeoContainer> {
  bool hasClickedAddGeo = false;

  @override
  Widget build(BuildContext context) {
    bool showTextFields =
        widget.user.town != null || widget.user.district != null || hasClickedAddGeo;
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Colors.white),
        child: Padding(
          padding:
              const EdgeInsets.only(left: 15, right: 15, top: 13, bottom: 15),
          child: Column(
            children: [
              const Row(
                children: [
                  Icon(CustomIcons.geo),
                  Text(
                    'Sizning ma\'lumotlaringiz',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
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
                                hasClickedAddGeo = true;
                              });
                            },
                            child: const Text(
                              '+ Manzil qo’shish',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                  color: Colors.white),
                            )),
                      )
                    : Column(
                        children: [
                          ProfileTextField(
                            profile: widget.user,
                            label: 'Viloyat / Shahar',
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
                              profile: widget.user,
                              label: 'Tuman',
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
