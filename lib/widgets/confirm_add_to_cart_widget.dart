import 'package:flutter/material.dart';
import 'package:lichi_test/widgets/custom_text_style.dart';

class ConfirmAddToCartWidget extends StatelessWidget {
  const ConfirmAddToCartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const Text('Добавлено в корзину'),
            const SizedBox(height: 106),
            Container(
              height: 150,
              width: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                image: const DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      'https://static.lichi.com/product/45960/d4152e445b295f4a889fe9abb9960ba6.jpg'),
                ),
              ),
            ),
            const SizedBox(height: 75),
            const Text(
              'Платье мини с объемными рукавами и вырезом на спинке',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 22),
            const Text(
              'Размер XS',
              style: CustomTextStyle.title4,
            ),
            const SizedBox(height: 152),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              height: 71,
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                ),
                onPressed: () {},
                child: const Text('Перейти в корзину'),
              ),
            ),
            const SizedBox(height: 6),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              height: 71,
              width: double.infinity,
              child: TextButton(
                onPressed: () {},
                child: const Text('Закрыть'),
              ),
            ),
            const SizedBox(height: 35),
          ],
        ),
      ),
    );
  }
}
