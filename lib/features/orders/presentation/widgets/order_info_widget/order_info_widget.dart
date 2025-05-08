import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:project_z/core/domain/entity/order/order.dart';
import 'package:project_z/core/routing/router.dart';
import 'package:project_z/features/orders/presentation/widgets/status_widget.dart';
import 'package:project_z/shared/widgets/discount_widget.dart';

const labelTextStyle = TextStyle(color: Color.fromRGBO(125, 125, 125, 1), fontWeight: FontWeight.w400, fontSize: 12);

const valueTextStyle = TextStyle(fontWeight: FontWeight.w500, fontSize: 14, color: Colors.black);

class OrderInfoContainer extends StatefulWidget {
  const OrderInfoContainer({super.key, required this.info});

  final Order info;

  @override
  State<OrderInfoContainer> createState() => _OrderInfoContainerState();
}

class _OrderInfoContainerState extends State<OrderInfoContainer> with TickerProviderStateMixin {
  bool showProduct = false;

  late final AnimationController _animationController = AnimationController(
    duration: const Duration(milliseconds: 300),
    vsync: this,
  );
  late final Animation<double> _heightAnimation = Tween<double>(begin: 0, end: 120).animate(
    CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
      reverseCurve: Curves.easeInOut,
    ),
  );
  late final Animation<double> _rotationAnimation = Tween<double>(begin: 0, end: 0.5).animate(
    CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
      reverseCurve: Curves.easeInOut,
    ),
  );

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  String _formatIso8601String(String isoString) {
    try {
      final dateTime = DateTime.parse(isoString);

      final day = dateTime.day.toString().padLeft(2, '0');
      final month = dateTime.month.toString().padLeft(2, '0');
      final year = dateTime.year.toString();
      final hour = dateTime.hour.toString().padLeft(2, '0');
      final minute = dateTime.minute.toString().padLeft(2, '0');

      return '$day.$month.$year $hour:$minute';
    } catch (e) {
      return 'Неверный формат даты';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            AnimatedBuilder(
              animation: _heightAnimation,
              builder: (context, child) {
                return SizedBox(height: _heightAnimation.value);
              },
            ),
            Container(
              padding: const EdgeInsets.all(16.0),
              margin: const EdgeInsets.symmetric(vertical: 5.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(
                  color: const Color.fromRGBO(197, 197, 197, 1),
                  width: 1.0,
                ),
              ),
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 300),
                opacity: showProduct ? 1.0 : 0.0,
                child: showProduct ? Column(
                  children: [
                    const SizedBox(height: 80,),
                    SizedBox(
                      //height: 82,
                      child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: widget.info.items.length,
                        itemBuilder: (context, index) {
                          final product = widget.info.items[index].product;
                          return Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  AutoRouter.of(context).push(
                                      ProductRoute(productId: product.id)
                                  );
                                },
                                child: Image.network(product.images.first, height: 82),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        SizedBox(
                                          width: (product.discount == 0) ? 190 : 140,
                                          child: Text(
                                            product.name,
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 1,
                                            style: const TextStyle(
                                                fontSize: 14, fontWeight: FontWeight.w500, color: Colors.black),
                                          ),
                                        ),
                                        DiscountWidget(value: product.discount,)
                                      ],
                                    ),
                                    Text(
                                      'ID ${product.id}',
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: Color.fromRGBO(97, 97, 97, 1),
                                      ),
                                    ),
                                    const Text(
                                      'Maxsulot narxi',
                                      style: labelTextStyle,
                                    ),
                                    Text(
                                      '${product.finalPrice} so\'m',
                                      style: valueTextStyle,
                                    ),
                                  ],
                                ),
                              )
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                ) : const SizedBox(),
              ),
            )
          ],
        ),
        SizedBox(
          height: 215,
          child: GestureDetector(
            onTap: () {
              setState(() {
                showProduct = !showProduct;
                if (showProduct) {
                  _animationController.forward();
                } else {
                  _animationController.reverse();
                }
              });
            },
            child: Builder(
                builder: (context) {
                  final order = widget.info;
                  return Container(
                    padding: const EdgeInsets.all(16.0),
                    margin: const EdgeInsets.symmetric(vertical: 5.0),
                    decoration: BoxDecoration(
                      color: Colors.white, // Assuming the background is white
                      borderRadius: BorderRadius.circular(10.0), // Rounded corners
                      border: Border.all(
                        color: const Color.fromRGBO(197, 197, 197, 1), // Light gray border
                        width: 1.0,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                OrderStatusIcon(status: order.formattedStatus,),
                                const SizedBox(width: 10.0),
                                Text(
                                  order.formattedStatus, // Assuming this text
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16.0,
                                  ),
                                ),
                              ],
                            ),
                            AnimatedBuilder(
                              animation: _rotationAnimation,
                              builder: (context, child) {
                                return Transform.rotate(
                                  angle: _rotationAnimation.value * 2 * 3.14159265359,
                                  child: const Icon(
                                    Icons.keyboard_arrow_down,
                                    size: 30,
                                    color: Colors.black,
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                        const SizedBox(height: 10.0),
                        const Text('Sana', style: labelTextStyle),
                        Text(
                          _formatIso8601String(order.createdAt),
                          style: valueTextStyle,
                        ),
                        const SizedBox(height: 10.0),
                        const Text(
                          'Buyurtma ID raqami',
                          style: labelTextStyle,
                        ),
                        Text(
                          '#${order.id}',
                          style: valueTextStyle,
                        ),
                        const SizedBox(height: 10.0),
                        const Text(
                          'Buyurtma narxi',
                          style: labelTextStyle,
                        ),
                        Text(
                          '${order.totalPrice} so\'m',
                          style: valueTextStyle,
                        ),
                      ],
                    ),
                  );
                }
            ),
          ),
        ),
      ],
    );
  }
}