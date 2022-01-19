class UserAccount {
  final String name;
  String id;

  UserAccount({required this.name, this.id = ''});

  Map<String, dynamic> toJson() => {'id': id, 'name': name};

  UserAccount fromJson(Map<String, dynamic> json) =>
      UserAccount(name: json['name'], id: json['id']);
}
