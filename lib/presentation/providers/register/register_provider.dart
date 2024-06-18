import 'package:binance_implementation/data/models/register/request/register_request_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final registerProvider = StateNotifierProvider<RegisterNotifier, RegisterRequestModel>((ref) => RegisterNotifier());


class RegisterNotifier extends StateNotifier<RegisterRequestModel> {
  RegisterNotifier() : super(RegisterRequestModel(email: '', password: '', confirmPassword: ''));

  void setEmail(String email) {
    state = RegisterRequestModel(email: email, password: state.password, confirmPassword: state.confirmPassword);
  }

  void setPassword(String password) {
    state = RegisterRequestModel(email: state.email, password: password, confirmPassword: state.confirmPassword);
  }

  void setConfirmPassword(String confirmPassword) {
    state = RegisterRequestModel(email: state.email, password: state.password, confirmPassword: confirmPassword);
  }
}