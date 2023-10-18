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
