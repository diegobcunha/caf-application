import 'package:caf_application/ui/components/images_assets.dart';
import 'package:caf_application/ui/navigation/navigation_route.dart';
import 'package:caf_application/ui/splash/splash_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SplashScreen extends StatefulHookConsumerWidget {
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SplashScreen();
}

class _SplashScreen extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    super.initState();
    final controller = ref.read(splashControllerProvider.notifier);
    controller.login();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<NextScreen>(splashControllerProvider, (previous, current) {
      switch (current) {
        case NextScreen.login:
          Navigator.of(context)
              .pushNamedAndRemoveUntil(loginScreen, (route) => false);
          break;
        case NextScreen.home:
          Navigator.of(context)
              .pushNamedAndRemoveUntil(homeScreen, (route) => false);
          break;
      }
    });
    return Scaffold(
      body: SafeArea(
          child: Center(child: Image.asset(cafRedLogo))),
    );
  }
}
