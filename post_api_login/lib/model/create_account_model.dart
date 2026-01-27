class CreateAccountModel {
  final String fullname;
  final String email;
  final String username;
  final String mobilenumber;
  final String city;
  final DateTime dob;
  final String password;
  final String confirmpassword;

  CreateAccountModel({
    required this.fullname,
    required this.email,
    required this.username,
    required this.mobilenumber,
    required this.city,
    required this.dob,
    required this.password,
    required this.confirmpassword,
  });
  Map<String, dynamic> toJson() {
    return {
      'full_name': fullname,
      'email': email,
      'username': username,
      'mobile_number': mobilenumber,
      'city' : city,
      'dob' : dob.toIso8601String(),
      'password' : password,
      'confirm_password' : confirmpassword,
    };
  }
}
