import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_z/features/basket/domain/entity/basket.dart';
import 'package:project_z/features/shell_widget/presentation/bloc/shell_screen_bloc.dart';
import 'package:project_z/shared/widgets/loading_button.dart';

class PaymentCard extends StatelessWidget {
  const PaymentCard(this._basket, {super.key});

  final Basket _basket;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Jami',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Color.fromRGBO(40, 47, 60, 1),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '${_basket.fullPriceWithDiscount} so\'m',
                      style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.black
                      ),
                    ),
                    Text(
                      '${_basket.fullPrice} so\'m',
                      style: const TextStyle(
                        fontSize: 12,
                        decoration: TextDecoration.lineThrough,
                        color: Color.fromRGBO(255, 34, 42, 1),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const Divider(height: 24, thickness: 1),
            ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  final product = _basket.items[index].product;
                  return _buildItem(
                      product.name,
                      '${product.formattedFinalPrice} so\'m'
                  );
                },
                separatorBuilder: (context, index) => const SizedBox(height: 15),
                itemCount: _basket.items.length
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: BlocBuilder<ShellScreenBloc, ShellScreenState>(
                builder: (context, state) {
                  final isLoading = state.mapOrNull(
                    loading: (d) => true,
                    addingToBasket: (d) => true,
                    creatingOrder: (d) => true
                  ) ?? false;

                  if(isLoading){
                    return const LoadingButton();
                  }
                  return const PaymentButton();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildItem(String title, String price) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 170,
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
          Text(
            price,
            style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Colors.black
            ),
          ),
        ],
      ),
    );
  }
}

class PaymentButton extends StatelessWidget {
  const PaymentButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        final bloc = BlocProvider.of<ShellScreenBloc>(context);
        bloc.add(const ShellScreenEvent.createOrder());
      },
      child: const Text(
        'Rasmiylashtirish',
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}
