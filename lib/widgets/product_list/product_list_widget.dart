import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lichi_test/routing/app_routes.dart';
import 'package:lichi_test/widgets/styles/custom_text_style.dart';
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
        () => context.read<ProductListWidgetModel>().loadProducts());
    Future.microtask(
        () => context.read<ProductListWidgetModel>().getCartItemsCount());
  }

  @override
  Widget build(BuildContext context) {
    final childAspectRatio = MediaQuery.of(context).size.width /
        (MediaQuery.of(context).size.height);
    final productList =
        Provider.of<ProductListWidgetModel>(context).productList;
    final cartCount =
        Provider.of<ProductListWidgetModel>(context).cartCount.toString();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
                title: const Text('Каталог товаров'),
                centerTitle: true,
                actions: [
                  ElevatedButton.icon(
                    onPressed: () => context.pushNamed(AppRoutes.cart.name),
                    label: Text(cartCount),
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
                    const SizedBox(width: 20),
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
                const SizedBox(height: 10),
                const SizedBox(
                  height: 125,
                  child: CustomSelectWidget(),
                ),
              ]),
            ),
            SliverGrid.builder(
              itemCount: productList.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 26, // Отступ между элементами
                crossAxisSpacing: 6, // Отступ между рядами
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

class CustomSelectWidget extends StatelessWidget {
  const CustomSelectWidget({super.key});

  @override
  Widget build(BuildContext context) {
    List items = ['Новинки', 'Платья', 'Юбки', 'Обувь'];
    return TextButton(
      onPressed: () => showDialog<String>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
                alignment: Alignment.center,
                title: const Text(
                  'Выберите категорию:',
                  style: CustomTextStyle.paragraph,
                ),
                content: SizedBox(
                  width: double.maxFinite,
                  child: ListView.builder(
                    itemCount: items.length,
                    shrinkWrap: true,
                    itemBuilder: (_, int index) {
                      return Text(items[index]);
                    },
                  ),
                ),
              )),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Платья'),
          Icon(Icons.expand_more),
        ],
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
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
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
                    crossAxisCount: 1, // Отступ между элементами
                    mainAxisSpacing: 9, // Отступ между рядами
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
                queryParameters: {
                  'id': product.id.toString(),
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
