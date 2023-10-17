import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lichi_test/entity/list_product.dart';
import 'package:lichi_test/widgets/confirm_add_to_cart_widget.dart';
import 'package:lichi_test/widgets/product__details/product_details_widget.dart';
import 'package:lichi_test/widgets/product_list/product_list_model.dart';
import 'package:lichi_test/widgets/product_list/product_list_widget.dart';
import 'package:provider/provider.dart';

enum AppRoutes {
  cart(
    name: 'cart',
    path: '/cart',
  ),
  catalog(
    name: 'catalog',
    path: '/',
  ),
  catalogItem(
    name: 'catalogItem',
    path: 'catalogItem',
  ),
  successModal(
    name: 'successModal',
    path: '/successModal',
  ),
  ;

  const AppRoutes({
    required this.name,
    required this.path,
  });

  final String name;
  final String path;

  @override
  String toString() => name;
}

class AppRouter {
  late final router = GoRouter(
    initialLocation: AppRoutes.catalog.path,
    routes: <GoRoute>[
      GoRoute(
        name: AppRoutes.catalog.name,
        path: AppRoutes.catalog.path,
        builder: (BuildContext context, GoRouterState state) =>
            ChangeNotifierProvider(
                create: (BuildContext context) => ProductListWidgetModel(),
                child: const ProductListWidget()),
        routes: <GoRoute>[
          GoRoute(
            name: AppRoutes.catalogItem.name,
            path: AppRoutes.catalogItem.path,
            pageBuilder: (context, state) {
              final product = state.extra as AProduct;
              return CustomTransitionPage(
                key: state.pageKey,
                child: ProductDetailsWidget(product: product),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  return SlideTransition(
                    position: animation.drive(
                      Tween<Offset>(
                        begin: const Offset(0.0, 1),
                        end: Offset.zero,
                      ).chain(
                        CurveTween(curve: Curves.easeOut),
                      ),
                    ),
                    child: child,
                  );
                },
              );
            },
          ),
        ],
      ),
      GoRoute(
        name: AppRoutes.successModal.name,
        path: AppRoutes.successModal.path,
        builder: (BuildContext context, GoRouterState state) =>
            const SuccessModalWidget(),
      ),
    ],
  );
}
