import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_z/features/shell_widget/presentation/bloc/shell_screen_bloc.dart';
import 'package:project_z/shared/consts/text_style_for_elevation_button.dart';
import 'package:project_z/shared/widgets/loading_button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SummaActionsWidget extends StatefulWidget {
  const SummaActionsWidget(this.productId,{super.key, required this.summa});

  final String summa;
  final int productId;

  @override
  State<SummaActionsWidget> createState() => _SummaActionsWidgetState();
}

class _SummaActionsWidgetState extends State<SummaActionsWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 11.0, vertical: 15),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 1),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${widget.summa} сум',
            style: const TextStyle(
                fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black),
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 60,
            child: BlocBuilder<ShellScreenBloc, ShellScreenState>(
              builder: (context, state) {
                final bloc = BlocProvider.of<ShellScreenBloc>(context);
                if(state.mapOrNull(
                  loading: (d) => true,
                  addingToBasket: (d) => true,
                  creatingOrder: (d) => true
                ) ?? false){
                  return const LoadingButton();
                }


                return Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 150,
                      child: ElevatedButton(
                        onPressed: () {
                          bloc.add(ShellScreenEvent.addToBasket(widget.productId));
                        },
                        child: Center(
                            child: Text(
                              AppLocalizations.of(context)!.addToBasketText,
                              style: textStyleForElevationButton,
                              textAlign: TextAlign.center,
                            )),
                      ),
                    ),
                    const Expanded(flex: 8, child: SizedBox()),
                    Expanded(
                      flex: 150,
                      child: ElevatedButton(
                        onPressed: () {
                          bloc.add(const ShellScreenEvent.createOrder());
                        },
                        child: Center(
                            child: Text(
                              AppLocalizations.of(context)!.createOrderText,
                              style: textStyleForElevationButton,
                              textAlign: TextAlign.center,
                            )),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}