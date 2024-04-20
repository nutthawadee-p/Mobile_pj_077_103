class User {
  String? name;
  String? age;
  String? address;
  String? contact;
  String username;
  String password;

  User({
    this.name,
    this.age,
    this.address,
    this.contact,
    required this.username,
    required this.password,
  });

  static List<User> userList = [];

  void updateUserInfo(int userIndex, {String? newName, String? newAge, String? newAddress, String? newUsername, String? newPassword}) {
    if (userIndex >= 0 && userIndex < userList.length) {
      if (newName != null) {
        userList[userIndex].name = newName;
      }
      if (newAge != null) {
        userList[userIndex].age = newAge;
      }
      if (newAddress != null) {
        userList[userIndex].address = newAddress;
      }
      if (newUsername != null) {
        userList[userIndex].username = newUsername;
      }
      if (newPassword != null) {
        userList[userIndex].password = newPassword;
      }
    }
  }
}
