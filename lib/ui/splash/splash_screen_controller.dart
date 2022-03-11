
import 'package:hooks_riverpod/hooks_riverpod.dart';

final splashControllerProvider = StateNotifierProvider<SplashScreenController, NextScreen>((ref) {
  return SplashScreenController();
});

class SplashScreenController extends StateNotifier<NextScreen> {

  SplashScreenController(): super(NextScreen.none);

  Future<void> login() async {
    await Future.delayed(Duration(seconds: 5));
    state = NextScreen.login;
  }

}

enum NextScreen {
  login,
  home,
  none
}