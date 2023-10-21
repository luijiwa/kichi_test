import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lichi_test/routing/app_routes.dart';
import 'package:lichi_test/widgets/cart/cart_widget.dart';
import 'package:lichi_test/widgets/cart/cart_widget_model.dart';
import 'package:lichi_test/widgets/product_details/product_details_widget_model.dart';
import 'package:lichi_test/widgets/success_modal_widget.dart';
import 'package:lichi_test/widgets/product_details/product_details_widget.dart';
import 'package:lichi_test/widgets/product_list/product_list_model.dart';
import 'package:lichi_test/widgets/product_list/product_list_widget.dart';
import 'package:provider/provider.dart';

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
              final id = int.parse(state.uri.queryParameters['id'] ?? '');
              return CustomTransitionPage(
                key: state.pageKey,
                child: ChangeNotifierProvider(
                  create: (context) => ProductDetailsWidgetModel(),
                  child: ProductDetailsWidget(id: id),
                ),
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
        pageBuilder: (BuildContext context, GoRouterState state) {
          final image = state.uri.queryParameters['image'] as String;
          final name = state.uri.queryParameters['name'] as String;
          final size = state.uri.queryParameters['size'] as String;
          return CustomTransitionPage(
            key: state.pageKey,
            child: SuccessModalWidget(
              image: image,
              name: name,
              size: size,
            ),
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
      GoRoute(
        name: AppRoutes.cart.name,
        path: AppRoutes.cart.path,
        pageBuilder: (BuildContext context, GoRouterState state) {
          return CustomTransitionPage(
            key: state.pageKey,
            child: ChangeNotifierProvider(
                create: (BuildContext context) => CartWidgetModel(),
                child: const CartWidget()),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return SlideTransition(
                position: animation.drive(
                  Tween<Offset>(
                    begin: const Offset(1.0, 0.0),
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
  );
}
