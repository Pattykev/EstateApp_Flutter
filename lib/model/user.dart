class User {
  late String fullName;
  late String surname;
  late String email;
  late String phone;
  late String role;
  late List<String> listeLogement;
  //"profilePic": "",
  late String uid;
  User(
      {required this.fullName,
      required this.surname,
      required this.email,
      required this.phone,
      required this.role,
      required this.listeLogement,
      //"profilePic": "",
      required this.uid});
}
