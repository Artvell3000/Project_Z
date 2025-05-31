import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_z/features/shell_widget/presentation/bloc/shell_screen_bloc.dart';
import 'package:project_z/flutter_app_icons.dart';

class CustomBottomBar extends StatefulWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  _CustomBottomBarState createState() => _CustomBottomBarState();
}

class _CustomBottomBarState extends State<CustomBottomBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            _buildBarItem(context, 0, CustomIcons.home, 'Home'),
            _buildBarItem(context, 1, CustomIcons.search, 'Search'),
            _buildBarItem(context, 2, CustomIcons.basket, 'Basket', isBasket: true),
            _buildBarItem(context, 3, Icons.shopping_bag, 'Order', iconSize: 30),
            _buildBarItem(context, 4, CustomIcons.profile, 'Profile',),
          ],
        ),
      ),
    );
  }

  Widget _buildBarItem(BuildContext context, int index, IconData icon, String label, {
    bool isBasket = false,
    double iconSize = 25
  }) {
    final isSelected = widget.currentIndex == index;
    return GestureDetector(
      onTap: () {
        widget.onTap(index);
      },
      child: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon,
                size: iconSize,
                color: isSelected ? const Color.fromRGBO(16, 53, 91, 1) : const Color.fromRGBO(150, 155, 159, 1),
              ),
              Text(
                label,
                style: TextStyle(
                  color: isSelected ? const Color.fromRGBO(16, 53, 91, 1) : const Color.fromRGBO(150, 155, 159, 1),
                ),
              ),
            ],
          ),
          if (isBasket) ...[ BlocBuilder<ShellScreenBloc, ShellScreenState>(
            buildWhen: (_, state) => state.maybeMap(
                orElse: () => false,
                loading: (d) => true,
                loaded: (d) => true,
                updated: (d) => true,
            ),
            builder: (context, state) {
              int? count = state.mapOrNull(
                loaded: (d) => d.amountItems,
                updated: (d) => d.amountItems
              );
              if(count == null || count == 0) return const SizedBox();

              return FractionalTranslation(
                translation: const Offset(1.2, -0.5),
                child: Container(
                  height: 25,
                  width: 25,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Center(
                    child: Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child:Center(
                        child: FractionalTranslation(
                          translation: const Offset(0.0, 0.05),
                          child: Text(count.toString(), style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 11
                          ),),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          )
          ],
        ],
      ),
    );
  }
}