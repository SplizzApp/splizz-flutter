class Group {
  final int gid;
  final String name;
  final int owner_id;
  // final String description;
  final List<dynamic> members;
  final List<dynamic> expenses;

  Group({
    required this.gid,
    required this.name,
    required this.owner_id,
    // required this.description,
    required this.members,
    required this.expenses,
  });

  factory Group.fromJson(Map<String, dynamic> json) {
    return Group(
      gid: json['gid'],
      name: json['name'],
      owner_id: json['owner_id'],
      // description: json['description'],
      members: json['members'],
      expenses: json['expenses'],
    );
  }
}
