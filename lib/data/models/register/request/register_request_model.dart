/// Model to request register
class RegisterRequestModel {

  /// Constructor to initialize the RegisterRequestModel
  RegisterRequestModel({
    required this.email,
    required this.password,
    required this.confirmPassword
  });

  /// Email to register
  String email;

  /// Password to register
  String password;

  /// Confirm password to register
  String confirmPassword;

  /// Method to convert json to model
  Map<String, dynamic> toJson() => {
    'email': email,
    'password': password,
    'confirmPassword': confirmPassword
  };
  
}