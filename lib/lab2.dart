enum Category { food, drinks }

class Product {
  final String name;
  final int price;
  final Category category;

  Product(this.name, this.price, this.category);

  String description() {
    return '$name — ${price.toRubles()}';
  }
}

extension PriceFormat on int {
  String toRubles() {
    return '$this руб.';
  }
}

Future<List<Product>> loadProducts() async {
  await Future<void>.delayed(const Duration(seconds: 1));

  return [
    Product('Хлеб', 50, Category.food),
    Product('Сыр', 200, Category.food),
    Product('Сок', 100, Category.drinks),
  ];
}

Future<void> main() async {
  print('Загрузка списка покупок...');

  final List<Product> products = await loadProducts();

  int total = 0;

  for (final product in products) {
    print(product.description());
    total += product.price;
  }

  print('Итого: ${total.toRubles()}');

  final drinks = products.where((product) {
    return product.category == Category.drinks;
  });

  print('\nНапитки:');

  for (final product in drinks) {
    print(product.description());
  }
}