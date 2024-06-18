/// Model to request login
class LoginRequestModel {

  /// Constructor to initialize the LoginRequestModel
  LoginRequestModel({
    required this.email,
    required this.password
  });

  /// Email to login
  String email;

  /// Password to login
  String password;

  /// Method to convert json to model
  Map<String, dynamic> toJson() => {
    'email': email,
    'password': password
  };
  
}