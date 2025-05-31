import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_z/core/routing/router.dart';
import 'package:project_z/features/shell_widget/presentation/bloc/shell_screen_bloc.dart';
import 'package:project_z/flutter_app_icons.dart';
import 'package:project_z/l10n/app_localizations.dart';
import 'package:project_z/shared/functions/show_alert_dialog/show_has_not_product_alert_dialog_function.dart';
import 'package:project_z/shared/widgets/loading_card.dart';
import 'package:shop_domain/domain/entity/product/product.dart';

class ProductCard extends StatefulWidget {
  const ProductCard({
    super.key,
    required this.info,
  });

  final Product info;

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  Future<void> _onCreateOrderClick(BuildContext context) async {
    if (widget.info.quantity == 0) {
      ShowHasNotProductAlertDialogFunction.body(context);
      return;
    }

    final bloc = BlocProvider.of<ShellScreenBloc>(context);
    bloc.add(ShellScreenEvent.addToBasket(widget.info.id, withCreateOrder: true));
  }

  void _onAddToBasketClick(BuildContext context) {
    if (widget.info.quantity == 0) {
      ShowHasNotProductAlertDialogFunction.body(context);
      return;
    }

    final bloc = BlocProvider.of<ShellScreenBloc>(context);
    bloc.add(ShellScreenEvent.addToBasket(widget.info.id));
  }

  void _onGoToProductClick(BuildContext context) {
    AutoRouter.of(context).push(ProductRoute(
      productId: widget.info.id,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _onGoToProductClick(context),
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.white),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  clipBehavior: Clip.hardEdge,
                  child: Stack(
                    children: [
                      AspectRatio(
                        aspectRatio: 1,
                        child: Image.network(
                          widget.info.images.first,
                          fit: BoxFit.fitHeight,
                          width: double.infinity,
                        ),
                      ),
                      (widget.info.status != null)
                          ? _StatusWidget(widget.info.formattedStatus!)
                          : const SizedBox.shrink(),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 3, left: 5),
                  child: SizedBox(
                    height: 25,
                    width: 100,
                    child: Text(
                      widget.info.name,
                      style: const TextStyle(
                          color: Color.fromRGBO(97, 97, 97, 1), fontWeight: FontWeight.w400, fontSize: 10),
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
                    widget.info.formattedPrice,
                    style: const TextStyle(
                        decoration: TextDecoration.lineThrough, color: Color.fromRGBO(97, 97, 97, 1), fontSize: 12),
                  ),
                  const SizedBox(
                    height: 3,
                    width: double.infinity,
                  ),
                  Text(
                    widget.info.formattedFinalPrice,
                    style: const TextStyle(color: Colors.black, fontWeight: FontWeight.w700, fontSize: 14),
                  ),
                  Row(
                    children: [
                      Expanded(
                          flex: 100,
                          child: ButtonForProductCard(
                              child: Text(
                                AppLocalizations.of(context)!.createOrderText,
                                style: const TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              onClick: () => _onCreateOrderClick(context))),
                      const Expanded(
                        flex: 3,
                        child: SizedBox(),
                      ),
                      Expanded(
                        flex: 30,
                        child: BlocBuilder<ShellScreenBloc, ShellScreenState>(
                          builder: (context, state) {
                            final bool isLoading = state.mapOrNull(addingToBasket: (d) {
                                  return d.productId == widget.info.id;
                                }) ??
                                false;

                            return ButtonForProductCard(
                                isLoading: isLoading,
                                onClick: () => _onAddToBasketClick(context),
                                child: const Icon(
                                  CustomIcons.basket,
                                  color: Colors.white,
                                ));
                          },
                        ),
                      ),
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

class ButtonForProductCard extends StatelessWidget {
  const ButtonForProductCard({super.key, required this.child, required this.onClick, this.isLoading = false});

  final bool isLoading;
  final Widget child;
  final void Function() onClick;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
        ),
      ),
      onPressed: onClick,
      child: Center(
          child: (isLoading)
              ? const SizedBox(
                  height: 13,
                  width: 13,
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  ),
                )
              : child),
    );
  }
}

class LoadingProductWidget extends StatelessWidget {
  const LoadingProductWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.white),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              AspectRatio(aspectRatio: 1, child: LoadingCard()),
              Padding(
                padding: EdgeInsets.only(top: 3, left: 5),
                child: SizedBox(
                  height: 25,
                  width: double.infinity,
                  child: LoadingCard(),
                ),
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 17, child: LoadingCard()),
                SizedBox(
                  height: 3,
                ),
                SizedBox(height: 17, child: LoadingCard()),
                SizedBox(
                  height: 40,
                  child: Row(
                    children: [
                      Expanded(
                        flex: 100,
                        child: LoadingCard(),
                      ),
                      Expanded(
                        flex: 1,
                        child: SizedBox.shrink(),
                      ),
                      Expanded(flex: 30, child: LoadingCard())
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _StatusWidget extends StatelessWidget {
  const _StatusWidget(this._status, {super.key});

  final String _status;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: FractionalTranslation(
        translation: const Offset(0.1, 0.2),
        child: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: Colors.white),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
            child: Text(
              _status,
              style: const TextStyle(color: Colors.black, fontWeight: FontWeight.w400, fontSize: 10),
            ),
          ),
        ),
      ),
    );
  }
}
