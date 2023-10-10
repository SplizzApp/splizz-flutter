class User {
  final int uid;
  final String name;
  final String email;
  final int balance;

  // final Color? color;

  // final String? profilePic;

  User({
    required this.uid,
    required this.name,
    required this.email,
    required this.balance,
    // this.color,
    // this.profilePic,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      uid: json['uid'],
      name: json['name'],
      email: json['email'],
      balance: json['balance'] as int,
      // color: json['color'],
      // profilePic: json['profilePic'],
    );
  }
}
