import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_z/features/home/presentation/bloc/home_screen_bloc.dart';

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
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
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
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          },
                          error: (message) {
                            return Center(child: Text(message));
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
      ),
    );
  }
}
