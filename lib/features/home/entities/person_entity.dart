class PersonEntity {
  final String id;
  final String avatarUrl;
  final String firstName;
  final String lastName;
  final String userTag;
  final String department;
  final String position;
  final String birthday;
  final String phone;

  PersonEntity(
      {required this.id,
      required this.avatarUrl,
      required this.firstName,
      required this.lastName,
      required this.userTag,
      required this.department,
      required this.position,
      required this.birthday,
      required this.phone});

  factory PersonEntity.fromJson(Map<String, dynamic> json) {
    return PersonEntity(
        id: json['id'],
        avatarUrl: json['avatarUrl'],
        firstName: json['firstName'],
        lastName: json['lastName'],
        userTag: json['userTag'],
        department: json['department'],
        position: json['position'],
        birthday: json['birthday'],
        phone: json['phone']);
  }
}
