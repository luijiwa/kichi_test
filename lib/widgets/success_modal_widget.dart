import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lichi_test/routing/app_routes.dart';
import 'package:lichi_test/widgets/styles/custom_text_style.dart';

//Здесь требуется картинка, название, размер
class SuccessModalWidget extends StatelessWidget {
  const SuccessModalWidget({
    super.key,
    required this.name,
    required this.image,
    required this.size,
  });
  final String name;
  final String image;
  final String size;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const Text(
              'Добавлено в корзину',
              style: CustomTextStyle.succesAddToCart,
            ),
            const SizedBox(height: 106),
            Container(
              height: 150,
              width: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(image),
                ),
              ),
            ),
            const SizedBox(height: 75),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 80),
              child: Text(
                name,
                textAlign: TextAlign.center,
                style: CustomTextStyle.succesAddToCartItemName,
              ),
            ),
            const SizedBox(height: 22),
            Text(
              'Размер $size',
              style: CustomTextStyle.boldAndSixteen,
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
                onPressed: () => context.pushNamed(AppRoutes.cart.name),
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
                onPressed: () => context.pop(),
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
