import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import 'package:lichi_test/domain/entity/list_product.dart';
import 'package:lichi_test/routing/app_routes.dart';
import 'package:lichi_test/widgets/product_details/product_details_widget_model.dart';

class ProductDetailsWidget extends StatefulWidget {
  const ProductDetailsWidget({
    super.key,
    required this.id,
  });
  final int id;

  @override
  State<ProductDetailsWidget> createState() => _ProductDetailsWidgetState();
}

class _ProductDetailsWidgetState extends State<ProductDetailsWidget> {
  @override
  void initState() {
    Future.microtask(
        () => context.read<ProductDetailsWidgetModel>().getCartItemsCount());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<void>(
        future:
            context.read<ProductDetailsWidgetModel>().loadOneProduct(widget.id),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(
                child: Text('Произошла ошибка, пожалуйста повторите позднее'));
          } else {
            final productDetails =
                context.read<ProductDetailsWidgetModel>().product;
            final cartItemCount =
                context.read<ProductDetailsWidgetModel>().cartCount.toString();
            if (productDetails == null) {
              return const Center(child: Text('Такого товара нет'));
            } else {
              return ProductDetailsScreenWidget(
                  productDetails: productDetails, cartItemCount: cartItemCount);
            }
          }
        },
      ),
    );
  }
}

class ProductDetailsScreenWidget extends StatelessWidget {
  const ProductDetailsScreenWidget({
    Key? key,
    required this.productDetails,
    required this.cartItemCount,
  }) : super(key: key);
  final AProduct productDetails;
  final String cartItemCount;
  @override
  Widget build(BuildContext context) {
    List color = [];
    color.add(Color(int.parse(
      'FF${productDetails.colors.current.value}',
      radix: 16,
    )));
    List<Color> otherColor = productDetails.colors.otherColors
        .map((item) => (Color(int.parse(
              'FF${item.value}',
              radix: 16,
            ))))
        .toList();
    color.addAll(otherColor);
    final ProductDetailsWidgetModel model = ProductDetailsWidgetModel();

    return CustomScrollView(
      // physics: ScrollPhysics(),
      slivers: [
        SliverAppBar(
            automaticallyImplyLeading: false,
            expandedHeight: 524,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                productDetails.photos[0].big,
                fit: BoxFit.cover,
              ),
              collapseMode: CollapseMode.pin,
            ),
            title: SizedBox(
              width: 78,
              height: 45,
              child: ElevatedButton.icon(
                onPressed: () => context.pushNamed(AppRoutes.cart.name),
                icon: const Icon(Icons.shopping_bag),
                label: Text(cartItemCount),
              ),
            ),
            actions: [
              IconButton.filledTonal(
                onPressed: () => context.pop(),
                icon: const Icon(Icons.close),
              ),
            ]),
        SliverToBoxAdapter(
          child: Column(children: [
            const SizedBox(height: 26),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Text(
                productDetails.name,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w300,
                  letterSpacing: -0.408,
                ),
              ),
            ),
            const SizedBox(height: 26),
            Container(
              alignment: Alignment.center,
              height: 18,
              width: 100,
              child: GridView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    mainAxisSpacing: 16,
                  ),
                  itemCount: color.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                        decoration: BoxDecoration(
                      color: color[index],
                      shape: BoxShape.circle,
                    ));
                  }),
            ),
            const SizedBox(height: 8),
            Text(
              productDetails.colors.current.name,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 22),
            Text(
              '${productDetails.price} ${productDetails.currency.postfix}',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 22),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              height: 78,
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                ),
                onPressed: () {
                  model.addItemToCart(productDetails, color[0]);

                  context.pushNamed(
                    AppRoutes.successModal.name,
                    queryParameters: {
                      'image': productDetails.photos[0].big,
                      'name': productDetails.name,
                      'size': productDetails.sizes.size3.name,
                    },
                  );
                },
                child: const Text('Добавить в корзину'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  bottom: 43, top: 40, left: 22, right: 22),
              child: Text(
                productDetails.descriptions.markdown,
                style: const TextStyle(fontSize: 13),
                textAlign: TextAlign.start,
              ),
            ),
          ]),
        ),
      ],
    );
  }
}
