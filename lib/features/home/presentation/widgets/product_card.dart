import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_z/core/domain/entity/entity.dart';
import 'package:project_z/core/routing/router.dart';
import 'package:project_z/features/orders/presentation/widgets/status_widget.dart';
import 'package:project_z/features/shell_widget/presentation/bloc/auth/auth_screen_bloc.dart';
import 'package:project_z/flutter_app_icons.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.info,
  });

  final Product info;

  void _onCreateOrderClick(BuildContext context){

  }

  void _onAddToBasketClick(BuildContext context){

  }

  void _onGoToProductClick(BuildContext context){
    AutoRouter.of(context).push(ProductRoute(
      productId: info.id,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _onGoToProductClick(context),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Colors.white),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Stack(
                  children: [
                    AspectRatio(
                      aspectRatio: 1,
                      child: Image.network(
                        info.images.first.image,
                        fit: BoxFit.fitHeight,
                        width: double.infinity,
                      ),
                    ),
                    (info.status != null)
                        ? _StatusWidget(info.status!)
                        : const SizedBox.shrink(),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 3, left: 5),
                  child: SizedBox(
                    height: 25,
                    width: 100,
                    child: Text(
                      info.name,
                      style: const TextStyle(
                          color: Color.fromRGBO(97, 97, 97, 1),
                          fontWeight: FontWeight.w400,
                          fontSize: 10),
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    info.price,
                    style: const TextStyle(
                        decoration: TextDecoration.lineThrough,
                        color: Color.fromRGBO(97, 97, 97, 1),
                        fontSize: 12),
                  ),
                  const SizedBox(
                    height: 3,
                    width: double.infinity,
                  ),
                  Text(
                    info.formattedFinalPrice,
                    style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                        fontSize: 14),
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 100,
                        child: ElevatedButton(
                          onPressed: () => _onCreateOrderClick(context),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color.fromRGBO(16, 53, 91, 1),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6),
                            ),
                          ),
                          child: const Center(
                            child: Text(
                              'Sotib olish',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const Expanded(
                        flex: 3,
                        child: SizedBox.shrink(),
                      ),
                      Expanded(
                          flex: 30,
                          child: ElevatedButton(
                            onPressed: () => _onAddToBasketClick(context),
                            child: const Center(
                              child: Icon(
                                CustomIcons.basket,
                                color: Colors.white,
                              ),
                            ),
                          ))
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _StatusWidget extends StatelessWidget {
  const _StatusWidget(this._status,{super.key});
  final String _status;

  String _getFormattedStatus(String status){
    final formatted = status
        .replaceAll('_', ' ')
        .trim()
        .isNotEmpty
        ? status[0].toUpperCase() + status.substring(1).toLowerCase()
        : '';

    return formatted;
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: FractionalTranslation(
        translation: const Offset(0.1, 0.2),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.white),
          child: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: 10.0, vertical: 5),
            child: Text(
              _getFormattedStatus(_status),
              style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                  fontSize: 10),
            ),
          ),
        ),
      ),
    );
  }
}
