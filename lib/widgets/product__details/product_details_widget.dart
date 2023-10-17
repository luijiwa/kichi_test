import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lichi_test/entity/list_product.dart';

import '../../routing/app_router.dart';

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

    return Scaffold(
      body: CustomScrollView(
        // physics: ScrollPhysics(),
        slivers: [
          SliverAppBar(
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
                  onPressed: () {},
                  icon: const Icon(Icons.shopping_bag),
                  label: const Text('0'),
                ),
              ),
              actions: [
                IconButton.filledTonal(
                  onPressed: () {},
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
                  ),
                  onPressed: () => context.goNamed(
                    AppRoutes.successModal.name,
                  ),
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
