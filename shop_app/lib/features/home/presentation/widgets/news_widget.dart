import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_z/features/home/presentation/bloc/home_screen_bloc.dart';
import 'package:shimmer/shimmer.dart';

const String newsTitle = 'Loyihangizni biz \nbilan birga yarating';
const String newsBottomText = 'Har bir detalda hashamat';

class NewsWidget extends StatelessWidget {
  const NewsWidget({
    super.key,
    required this.onTap,
    required this.currentNews,
  });

  final int currentNews;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 326,
      child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: GestureDetector(
              onTap: onTap,
              child: Stack(
                children: [
                  BlocBuilder<HomeScreenBloc, HomeScreenState>(
                    builder: (context, state) {
                      return state.when(
                        loading: () {
                          return Shimmer.fromColors(
                              baseColor: const Color.fromRGBO(236, 236, 236, 1.0),
                              highlightColor: const Color.fromRGBO(253, 253, 253, 1.0),
                              child: const Card(elevation: 0, child: SizedBox.expand()));
                        },
                        error: (e) {
                          return Center(child: Text(e.toString()));
                        },
                        loaded: (_, news, __, ___) {
                          return (news[0].mobileImage != null)
                              ? Image.network(
                                  news[currentNews].mobileImage!,
                                  fit: BoxFit.cover,
                                  width: double.infinity,
                                )
                              : Image.asset(
                                  'assets/mock/news/news.png',
                                  fit: BoxFit.cover,
                                  width: double.infinity,
                                );
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
