class User {
  final int uid;
  final String name;
  final String email;

  // final Color? color;

  // final String? profilePic;

  User({
    required this.uid,
    required this.name,
    required this.email,
    // this.color,
    // this.profilePic,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      uid: json['uid'],
      name: json['name'],
      email: json['email'],
      // color: json['color'],
      // profilePic: json['profilePic'],
    );
  }
}
