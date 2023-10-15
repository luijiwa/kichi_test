import 'package:flutter/material.dart';
import 'package:lichi_test/widgets/custom_text_style.dart';

class ProductListWidget extends StatelessWidget {
  const ProductListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    List color = [Colors.amber, Colors.blueAccent, Colors.purple];
    final childAspectRatio = MediaQuery.of(context).size.width /
        (MediaQuery.of(context).size.height);
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
              itemCount: 4,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 26,
                crossAxisSpacing: 6,
                childAspectRatio: childAspectRatio,
              ),
              itemBuilder: (BuildContext context, int index) {
                return ProductListItem(color: color);
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
    required this.color,
  });

  final List color;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Image.network(
            'https://static.lichi.com/product/45960/d4152e445b295f4a889fe9abb9960ba6.jpg',
            height: 276,
            width: 206,
          ),
        ),
        const SizedBox(height: 17),
        const Text(
          '${1990} руб.',
          style: CustomTextStyle.cartItemAddStyle,
        ),
        const SizedBox(height: 12),
        const Text(
          'Платье макси из трикотажа ажурной ткани',
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
    );
  }
}
