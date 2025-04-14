import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:project_z/core/domain/entity/basket/basket.dart';
import 'package:project_z/core/domain/entity/product/product.dart';

part 'basket_screen_bloc.freezed.dart';

part 'basket_screen_event.dart';
part 'basket_screen_state.dart';

class BasketScreenBloc extends Bloc<BasketScreenEvent, BasketScreenState> {

  final items = <BasketItem>[
    BasketItem(
        id: "1",
        user: 1,
        product: Product(
            id: 1,
            images: [
              const ProductImage(
                id: 1,
                  image: 'https://i.ibb.co/tw7Qn7yn/photo.png',
                  product: 1,
              )
            ],
            name: "Discord",
            description: {
              "Discord":"Discord"
            },
            characteristics: {
              "Discord":"Discord"
            },
            price: "10000",
            discount: "36",
            quantity: 10,
            productCode: 52542,
            status: 'Yangilik',
            slug: 'discord slug',
            createdAt: DateTime.now(),
            updatedAt: DateTime.now(),
            subcategory: 2),
        productId: 1,
        amount: 3,
        createdAt: DateTime.now().toString(),
        updatedAt: DateTime.now().toString(),
    ),
    BasketItem(
      id: "2",
      user: 1,
      product: Product(
          id: 4,
          images: [
            const ProductImage(
              id: 1,
              image: 'https://i.ibb.co/tw7Qn7yn/photo.png',
              product: 1,
            )
          ],
          name: "Discord 2",
          description: {
            "Discord 2":"Discord 2"
          },
          characteristics: {
            "Discord":"Discord"
          },
          price: "10000",
          discount: "36",
          quantity: 10,
          productCode: 587642,
          status: 'Yangilik',
          slug: 'discord slug',
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
          subcategory: 2),
      productId: 4,
      amount: 3,
      createdAt: DateTime.now().toString(),
      updatedAt: DateTime.now().toString(),
    )
  ];


  BasketScreenBloc() : super(const BasketScreenState.loading()) {
    on<BasketScreenEvent>((event, emit) async {
      await event.map(
          loaded: (d){
            int q = 0;
            for(final el in items){
              q+=el.amount;
            }

            emit(BasketScreenState.loaded(items: d.items, amount: q));
          },
          load: (d){},
          addItem: (d){
            int q = 0;
            for(final el in items){
              q+=el.amount;
            }

            for(int i=0;i<items.length;i++){
              if(items[i].productId == d.product.id){
                items[i] = items[i].copyWith(amount: items[i].amount + 1);
              }
            }
            emit(BasketScreenState.loaded(items: items, amount: q));
          },
          removeItem: (d){},
          updateQuantity: (d){},
          clear: (d){},
          checkout: (d){}
      );
    });
    loadData();
  }
  Future<void> loadData() async {
    add(BasketScreenEvent.loaded(items));
  }
}
