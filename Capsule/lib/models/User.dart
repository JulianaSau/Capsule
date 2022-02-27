class User {
  final int id;
  final String name;
  final String password;
  final String token;
  String? profile_pic;
  String? firstName;
  String? lastName;
  String? phoneNumber;
  String? address;

  User({
    required this.id,
    required this.name,
    required this.password,
    required this.token,
    this.profile_pic,
    this.firstName,
    this.phoneNumber,
    this.address,
  });
}
