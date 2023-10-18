import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lichi_test/domain/entity/list_product.dart';
import 'package:lichi_test/routing/app_routes.dart';
import 'package:lichi_test/widgets/product_details/product_details_widget_model.dart';

class ProductDetailsWidget extends StatelessWidget {
  const ProductDetailsWidget({
    super.key,
    required this.product,
  });
  final AProduct product;

  @override
  Widget build(BuildContext context) {
    List color = [];
    color.add(Color(int.parse(
      'FF${product.colors.current.value}',
      radix: 16,
    )));
    List<Color> otherColor = product.colors.otherColors
        .map((item) => (Color(int.parse(
              'FF${item.value}',
              radix: 16,
            ))))
        .toList();
    color.addAll(otherColor);
    final ProductDetailsWidgetModel _model = ProductDetailsWidgetModel();
    return Scaffold(
      body: CustomScrollView(
        // physics: ScrollPhysics(),
        slivers: [
          SliverAppBar(
              automaticallyImplyLeading: false,
              expandedHeight: 524,
              flexibleSpace: FlexibleSpaceBar(
                background: Image.network(
                  product.photos[0].big,
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
                  label: const Text('0'),
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
                  product.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w300,
                    // fontStyle: FontStyle.normal,
                    // height: 29,/* 161.111% */

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
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
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
                product.colors.current.name,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 22),
              Text(
                '${product.price} ${product.currency.postfix}',
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
                  ), //Здесь требуется картинка, название, размер
                  onPressed: () {
                    _model.addCartItem(product);

                    context.pushNamed(
                      AppRoutes.successModal.name,
                      queryParameters: {
                        'image': product.photos[0].big,
                        'name': product.name,
                        'size': product.sizes.size3.name,
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
                  product.descriptions.markdown,
                  style: const TextStyle(fontSize: 13),
                  textAlign: TextAlign.start,
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
