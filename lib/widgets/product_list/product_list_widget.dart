import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lichi_test/routing/app_router.dart';
import 'package:lichi_test/widgets/custom_text_style.dart';
import 'package:lichi_test/widgets/product_list/product_list_model.dart';
import 'package:provider/provider.dart';

class ProductListWidget extends StatefulWidget {
  const ProductListWidget({super.key});

  @override
  State<ProductListWidget> createState() => _ProductListWidgetState();
}

class _ProductListWidgetState extends State<ProductListWidget> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
        () => context.read<ProductListWidgetModel>().loadProduct());
  }

  @override
  Widget build(BuildContext context) {
    final childAspectRatio = MediaQuery.of(context).size.width /
        (MediaQuery.of(context).size.height);
    final productList =
        Provider.of<ProductListWidgetModel>(context).productList;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: CustomScrollView(
          // physics: ScrollPhysics(),
          slivers: [
            SliverAppBar(
                title: const Text('Каталог товаров'),
                centerTitle: true,
                // flexibleSpace: const FlexibleSpaceBar(),
                actions: [
                  ElevatedButton.icon(
                    onPressed: () {},
                    label: const Text('0'),
                    icon: const Icon(Icons.shopping_bag),
                  ),
                ]),
            SliverToBoxAdapter(
              child: Column(children: [
                const Padding(
                  padding: EdgeInsets.only(
                    bottom: 43,
                    top: 50,
                    left: 22,
                    right: 22,
                  ),
                  child: Text(
                      'Каждый день тысячи девушек распаковывают пакеты с новинками Lichi и становятся счастливее, ведь очевидно, что новое платье может изменить день, а с ним и всю жизнь!',
                      style: CustomTextStyle.paragraph,
                      textAlign: TextAlign.center),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 86,
                      child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                        onPressed: () {},
                        icon: const Icon(Icons.dark_mode),
                        label: const Text('Тёмная тема'),
                      ),
                    ),
                    SizedBox(
                      height: 86,
                      child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                        onPressed: () {},
                        icon: const Icon(Icons.light_mode),
                        label: const Text('Светлая тема'),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 145,
                  child: TextButton(
                    onPressed: () {},
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Платья '),
                        Icon(Icons.expand_more),
                      ],
                    ),
                  ),
                ),
              ]),
            ),
            SliverGrid.builder(
              itemCount: productList.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 26,
                crossAxisSpacing: 6,
                childAspectRatio: childAspectRatio,
              ),
              itemBuilder: (BuildContext context, int index) {
                return ProductListItem(index: index);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ProductListItem extends StatelessWidget {
  const ProductListItem({
    super.key,
    required this.index,
  });

  final int index;
  @override
  Widget build(BuildContext context) {
    List color = [];
    final productList =
        Provider.of<ProductListWidgetModel>(context).productList;
    final product = productList[index];

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
    return Stack(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 276,
              width: 206,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(product.photos[0].big),
                ),
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            const SizedBox(height: 17),
            Text(
              '${product.price} ${product.currency.postfix} ',
              style: CustomTextStyle.cartItemAddStyle,
            ),
            const SizedBox(height: 12),
            Text(
              product.name,
              textAlign: TextAlign.center,
              style: CustomTextStyle.cartPriceStyle1,
            ),
            const SizedBox(height: 19),
            Container(
              alignment: Alignment.center,
              height: 10,
              width: 100,
              child: GridView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    mainAxisSpacing: 9,
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
            //
          ],
        ),
        Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {
              context.goNamed(
                AppRoutes.catalogItem.name,
                extra: product,
              );
            },
          ),
        ),
      ],
    );
  }
}
