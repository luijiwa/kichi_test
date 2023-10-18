import 'package:flutter/material.dart';

import 'package:lichi_test/widgets/cart/cart_widget_model.dart';
import 'package:lichi_test/widgets/styles/custom_text_style.dart';
import 'package:provider/provider.dart';

class CartWidget extends StatefulWidget {
  const CartWidget({super.key});

  @override
  State<CartWidget> createState() => _CartWidgetState();
}

class _CartWidgetState extends State<CartWidget> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => context.read<CartWidgetModel>().getCartItems());
  }

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
      body: context.read<CartWidgetModel>().cartEmpty
          ? const Center(
              child: Text('Корзина пустая \n Добавьте все что вы хотите'))
          : CartItemsWidget(),
    );
  }
}

class CartItemsWidget extends StatelessWidget {
  CartItemsWidget({super.key});

  final CartWidgetModel _cartWidgetModel = CartWidgetModel();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        // mainAxisAlignment: MainAxisAlignment.,
        children: [
          ListView.builder(
              shrinkWrap: true,
              itemCount: _cartWidgetModel.cartItems.length,
              itemBuilder: (context, index) {
                return CartItemRow(index: index);
              }),
          const Text(
            'К оплате',
            style: CustomTextStyle.cartPriceStyle1,
          ),
          Text(
            ' ${_cartWidgetModel.totalPrice} руб.',
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
  }) : super(key: key);
  final int index;
  @override
  Widget build(BuildContext context) {
    final CartWidgetModel cartWidgetModel = CartWidgetModel();
    final cardItem = cartWidgetModel.cartItems[index].aproduct;

    final String itemImage = cardItem.photos[0].big;
    final String itemName = cardItem.name;
    final String itemSize = cardItem.sizes.size3.name;
    final String itemPrice = cardItem.price.toString();
    final String itemQuantity =
        cartWidgetModel.cartItems[index].quantity.toString();
    return Row(
      children: [
        Container(
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
                    onPressed: () {},
                    icon: const Icon(Icons.remove),
                  ),
                  Text(
                    itemQuantity,
                    textAlign: TextAlign.center,
                    style: CustomTextStyle.cartItemAddStyle,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.add),
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}
