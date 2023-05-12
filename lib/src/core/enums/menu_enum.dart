enum MenuEnum {
  paymentType(
    '/payment-type/',
    'payment_type_ico.png',
    'payment_type_ico_selected.png',
    'Administrar Formas de Pagamento',
  ),
  products(
    '/products/',
    'product_ico.png',
    'product_ico_selected.png',
    'Administrar Produtos',
  ),
  orders(
    '/order/',
    'order_ico.png',
    'order_ico_selected.png',
    'Pedidos do dia',
  );

  final String route;
  final String icon;
  final String selectedIcon;
  final String label;

  const MenuEnum(this.route, this.icon, this.selectedIcon, this.label);
}
