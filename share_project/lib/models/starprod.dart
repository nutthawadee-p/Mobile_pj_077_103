class Product {
  String name;
  String caption;
  String category;
  String value;
  String image;

  Product(
    {required this.name,
    required this.caption,
    required this.category,
    required this.value,
    required this.image});
  
  static List<Product> getCategories() {
    List<Product> categories = [];
    categories.add(Product(
      name: 'Root',
      caption: '',
      category: 'Boardgame',
      value: 'borrow',
      image: 'assets/images/root.jpg',
    ));

    categories.add(Product(
      name: 'welcome to the HYUNAM-DONG',
      caption: 'a charming slice-of-life ode to books',
      category: 'Book',
      value: '150',
      image: 'assets/images/bookshop.jpg',
    ));

    categories.add(Product(
      name: 'Scrabble',
      caption: '',
      category: 'Boardgame',
      value: 'borrow',
      image: 'assets/images/scrabble.jpg',
    ));

    categories.add(Product(
      name: 'Os Meus Dias na Livraria Morisaki, Satoshi Yagisawa',
      caption: 'Japanese Literature,Fiction',
      category: 'Book',
      value: 'borrow',
      image: 'assets/images/satoshi.jpg',
    ));

    // categories.add(Product(
    //   name: 'Root',
    //   caption: '0',
    //   category: 'boardgame',
    //   value: 'borrow',
    //   image: 'assets/images/root.jpg',
    // ));

    // categories.add(Product(
    //   name: 'Root',
    //   caption: '0',
    //   category: 'boardgame',
    //   value: 'borrow',
    //   image: 'assets/images/root.jpg',
    // ));

      
    return categories;
  }
}
