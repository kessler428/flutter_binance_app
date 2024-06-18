import 'package:binance_implementation/data/models/login/request/login_request_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final loginProvider = StateNotifierProvider<LoginNotifier, LoginRequestModel>((ref) => LoginNotifier());


class LoginNotifier extends StateNotifier<LoginRequestModel> {
  LoginNotifier() : super(LoginRequestModel(email: '', password: ''));

  void setEmail(String email) {
    state = LoginRequestModel(email: email, password: state.password);
  }

  void setPassword(String password) {
    state = LoginRequestModel(email: state.email, password: password);
  }
}