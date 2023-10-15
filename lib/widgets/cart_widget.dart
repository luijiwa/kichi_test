import 'package:flutter/material.dart';
import 'package:lichi_test/widgets/custom_text_style.dart';

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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisAlignment: MainAxisAlignment.,
          children: [
            ListView.builder(
                shrinkWrap: true,
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      Container(
                        height: 184,
                        width: 137,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          image: const DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                                'https://static.lichi.com/product/45960/d4152e445b295f4a889fe9abb9960ba6.jpg'),
                          ),
                        ),
                      ),
                      const SizedBox(width: 24),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Платье мини с объемными рукавами и вырезом на спинке',
                              style: CustomTextStyle.cartItemStyle,
                            ),
                            const Text(
                              'Размер XS',
                              style: CustomTextStyle.cartItemStyle,
                            ),
                            const SizedBox(height: 22),
                            const Text(
                              '${1990} руб.',
                              style: CustomTextStyle.cartItemPriceStyle,
                            ),
                            Row(
                              children: [
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.remove),
                                ),
                                const Text(
                                  '${2} ед.',
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
                }),
            const Text(
              'К оплате',
              style: CustomTextStyle.cartPriceStyle1,
            ),
            const Text(
              '13 897 руб.',
              style: CustomTextStyle.cartPriceStyle2,
            ),
          ],
        ),
      ),
    );
  }
}
