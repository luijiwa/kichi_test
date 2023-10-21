import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lichi_test/routing/app_routes.dart';

import 'package:lichi_test/widgets/cart/cart_widget_model.dart';
import 'package:lichi_test/widgets/styles/custom_text_style.dart';
import 'package:provider/provider.dart';

class CartWidget extends StatelessWidget {
  const CartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Корзина',
          style: CustomTextStyle.cartTitle,
        ),
        centerTitle: true,
      ),
      body: FutureBuilder<void>(
        future: context.read<CartWidgetModel>().getCartItems(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(
                child: Text('Произошла ошибка при загрузке данных.'));
          } else {
            final cartWidgetModel = context.watch<CartWidgetModel>();
            if (cartWidgetModel.cartIsEmpty) {
              return const Center(
                  child: Text('Корзина пустая \n Добавьте все, что вы хотите'));
            } else {
              return CartItemsWidget(cartWidgetModel: cartWidgetModel);
            }
          }
        },
      ),
    );
  }
}

class CartItemsWidget extends StatelessWidget {
  const CartItemsWidget({super.key, required this.cartWidgetModel});

  final CartWidgetModel cartWidgetModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 14, left: 14, bottom: 45),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: cartWidgetModel.cartItems.length,
                itemBuilder: (context, index) {
                  return CartItemRow(
                    index: index,
                    cartWidgetModel: cartWidgetModel,
                  );
                }),
          ),
          const Text(
            'К оплате',
            style: CustomTextStyle.cartPriceStyle1,
          ),
          Text(
            '${cartWidgetModel.totalPrice} руб.',
            style: CustomTextStyle.cartPriceStyle2,
          ),
        ],
      ),
    );
  }
}

class CartItemRow extends StatelessWidget {
  const CartItemRow({
    Key? key,
    required this.index,
    required this.cartWidgetModel,
  }) : super(key: key);
  final int index;
  final CartWidgetModel cartWidgetModel;
  @override
  Widget build(BuildContext context) {
    final cardItem = cartWidgetModel.cartItems[index];

    final String itemImage = cardItem.image;
    final String itemName = cardItem.name;
    final String itemSize = cardItem.size;
    final String itemPrice = '${cardItem.price} руб.';
    final String itemQuantity =
        cartWidgetModel.cartItems[index].quantity.toString();
    return Padding(
      padding: const EdgeInsets.only(bottom: 17),
      child: Row(
        children: [
          InkWell(
            onTap: () => context.goNamed(
              AppRoutes.catalogItem.name,
              queryParameters: {
                'id': cardItem.id.toString(),
              },
            ),
            child: Container(
              height: 184,
              width: 137,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(itemImage),
                ),
              ),
            ),
          ),
          const SizedBox(width: 24),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  itemName,
                  style: CustomTextStyle.cartItemStyle,
                ),
                Text(
                  'Размер $itemSize',
                  style: CustomTextStyle.cartItemStyle,
                ),
                const SizedBox(height: 22),
                Text(
                  itemPrice,
                  style: CustomTextStyle.boldAndSixteen,
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () =>
                          cartWidgetModel.deleteCartItem(cardItem.id),
                      icon: const Icon(Icons.remove),
                    ),
                    Text(
                      itemQuantity,
                      textAlign: TextAlign.center,
                      style: CustomTextStyle.cartItemAddStyle,
                    ),
                    IconButton(
                      onPressed: () =>
                          cartWidgetModel.plusOneToCartItem(cardItem.id),
                      icon: const Icon(Icons.add),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
