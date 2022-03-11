import 'dart:ffi';

import 'package:caf_application/datasource/result/result.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final loginControllerProvider = StateNotifierProvider<LoginController, Result<dynamic>>((ref) {
  return LoginController();
});

class LoginController extends StateNotifier<Result<dynamic>> {
  LoginController() : super(Result.idle());

  validateLogin(String? username, String? password) {
    // if (username == null ||
    //     username.isEmpty ||
    //     password == null ||
    //     password.isEmpty) {
    //   state =
    //       Result.failure(reason: "Login ou senha inválidos, tente novamente");
    //   return;
    // }
    _login(username ?? "", password ?? "");
  }

  Future<void> _login(String username, String password) async {
    try {
      state = Result.loading();
      await Future.delayed(Duration(seconds: 5));
      state = Result.success(data: Void);
    } on Exception catch (error) {
      state = Result.failure(reason: "Erro na requisição");
    }
  }
}
