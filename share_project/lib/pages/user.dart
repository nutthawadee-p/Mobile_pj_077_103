class User {
  final String? name;
  final String? age;
  final String? address;
  final String? contact;
  final String username;
  final String password;

  User({
    this.name,
    this.age,
    this.address,
    this.contact,
    required this.username,
    required this.password,
  });
 
  static List<User> userList = [];
}
