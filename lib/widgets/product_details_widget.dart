import 'package:flutter/material.dart';

class ProductDetailsWidget extends StatelessWidget {
  const ProductDetailsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    const List color = [Colors.amber, Colors.blueAccent, Colors.purple];
    return Scaffold(
      body: CustomScrollView(
        // physics: ScrollPhysics(),
        slivers: [
          SliverAppBar(
              expandedHeight: 524,
              flexibleSpace: FlexibleSpaceBar(
                background: Image.network(
                  'https://static.lichi.com/product/45960/d4152e445b295f4a889fe9abb9960ba6.jpg',
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
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 72),
                child: Text(
                  'Платье мини с объемными рукавами и вырезом на спинке',
                  textAlign: TextAlign.center,
                  style: TextStyle(
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
              const Text('Серый', textAlign: TextAlign.center),
              const SizedBox(height: 22),
              const Text(
                '${1990} руб.',
                style: TextStyle(
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
                  onPressed: () {},
                  child: const Text('Добавить в корзину'),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(
                  bottom: 43,
                  top: 40,
                  left: 22,
                  right: 22,
                ),
                child: Text(
                  'Эффектное прилегающее платье длины макси, выполненное из приятного к телу трикотажа ажурной вязки. Модель имеет глубокий V-образный вырез, дополненный воланами в рубчик, а также длинные рукава с объемными расклешенными манжетами и застежку на мелкие серебристые пуговицы.\n\n- длина макси\n- прилегающий силуэт\n- V-образный вырез\n- волан на воротнике\n- длинные рукава с расклешенными манжетами\n- прямая юбка\n- застежка на пуговицы\n- серебристый оттенок фурнитуры',
                  style: TextStyle(fontSize: 13),
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
