import 'dart:async';
import 'package:auto_route/auto_route.dart';
import 'package:project_z/core/routing/router.dart';
import 'package:rxdart/rxdart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:project_z/core/domain/entity/basket/basket.dart';
import 'package:project_z/features/basket/presentation/bloc/basket_screen_bloc.dart';
import 'package:project_z/shared/consts/text_style_title.dart';
import 'package:project_z/shared/widgets/discount_widget.dart';
import 'package:project_z/shared/widgets/loading_card.dart';

part 'basket_item_widget.freezed.dart';

@freezed
class _UpdateTrigger with _$UpdateTrigger {
  const factory _UpdateTrigger.updateAmount(BuildContext context, int amount) = _UpdateAmountTrigger;

  const factory _UpdateTrigger.remove(BuildContext context) = _RemoveTrigger;
}

class BasketItemWidget extends StatefulWidget {
  const BasketItemWidget({super.key, required this.item});

  final BasketItem item;

  @override
  State<BasketItemWidget> createState() => _BasketItemWidgetState();
}

class _BasketItemWidgetState extends State<BasketItemWidget> {
  final _updateController = StreamController<_UpdateTrigger>();
  late final Stream<_UpdateTrigger> _debouncedUpdate;
  late final StreamSubscription<_UpdateTrigger> _subscription;

  late int _amount;
  bool _isRemoved = false;

  @override
  void initState() {
    _amount = widget.item.amount;
    _debouncedUpdate = _updateController.stream.debounceTime(const Duration(milliseconds: 500));
    _subscription = _debouncedUpdate.listen((trigger) {
      trigger.map(updateAmount: (d) {
        BlocProvider.of<BasketScreenBloc>(d.context).add(BasketScreenEvent.updateQuantity(widget.item.id, d.amount));
      }, remove: (d) {
        BlocProvider.of<BasketScreenBloc>(d.context).add(BasketScreenEvent.removeItem(widget.item.id));
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return (_isRemoved) ? const SizedBox() : Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              GestureDetector(
                onTap: (){
                  AutoRouter.of(context).push(ProductRoute(productId: widget.item.product.id));
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  clipBehavior: Clip.hardEdge,
                  child: Image.network(
                    width: 100,
                    height: 100,
                    widget.item.product.images.first,
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          widget.item.product.formattedFinalPrice,
                          style: titleTextStyle,
                        ),
                        const SizedBox(width: 8.0),
                        DiscountWidget(value: widget.item.product.discount),
                      ],
                    ),
                    const SizedBox(height: 4.0),
                    SizedBox(
                      width: 200,
                      child: Text(
                        widget.item.product.name,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontSize: 14.0, color: Color.fromRGBO(97, 97, 97, 1), fontWeight: FontWeight.w500),
                      ),
                    ),
                    const SizedBox(height: 4.0),
                    Text(
                      'Mahsulot kodi: ${widget.item.product.productCode}',
                      style: const TextStyle(
                        color: Color.fromRGBO(130, 130, 130, 1),
                        fontWeight: FontWeight.w400,
                        fontSize: 14.0,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                    onPressed: () {
                      //todo unselect
                    },
                    child: SvgPicture.asset(
                      'assets/basket/metka.svg',
                      height: 30,
                    )),
                Row(
                  children: [
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(36, 36),
                          backgroundColor: (widget.item.amount == 1) ? Colors.grey : Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: EdgeInsets.zero,
                          elevation: 0,
                        ),
                        onPressed: () {
                          if (widget.item.amount > 1) {
                            setState(() {
                              _amount--;
                              _updateController.add(_UpdateTrigger.updateAmount(context, _amount));
                            });
                          }
                        },
                        child: const Center(
                          child: Icon(
                            Icons.remove,
                            size: 30.0,
                            color: Colors.black,
                          ),
                        )),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 17.0),
                      child: Text(_amount.toString(),
                          style: const TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.w600,
                            color: Color.fromRGBO(40, 47, 60, 1),
                          )),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(36, 36),
                        backgroundColor: widget.item.product.quantity  > _amount ? Colors.white : Colors.grey,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: EdgeInsets.zero,
                        elevation: 0,
                      ),
                      onPressed: () {
                        setState(() {
                          if(widget.item.product.quantity  > _amount) {
                            setState(() {
                              _amount++;
                              _updateController.add(_UpdateTrigger.updateAmount(context, _amount));
                            });
                          }
                        });
                      },
                      child: const Center(
                        child: Icon(
                          Icons.add,
                          size: 30.0,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
                TextButton(
                    onPressed: () {
                      setState(() {
                        _isRemoved = true;
                        _updateController.add(_UpdateTrigger.remove(context));
                      });
                    },
                    child: SvgPicture.asset(
                      'assets/basket/basket.svg',
                      color: const Color.fromRGBO(148, 153, 165, 1),
                      height: 30,
                    )),
              ],
            ),
          )
        ],
      ),
    );
  }
}
