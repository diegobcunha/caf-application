import 'package:caf_application/extension/build_context_extensions.dart';
import 'package:caf_application/ui/components/images_assets.dart';
import 'package:caf_application/ui/components/loading_button.dart';
import 'package:caf_application/ui/login/login_controller.dart';
import 'package:caf_application/ui/navigation/navigation_route.dart';
import 'package:caf_application/ui/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../datasource/result/result.dart';

class LoginScreen extends StatefulHookConsumerWidget {
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginScreen();
}

class _LoginScreen extends ConsumerState<LoginScreen> {
  GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  TextEditingController _passwordController = new TextEditingController();
  TextEditingController _emailController = new TextEditingController();
  String _email = "";
  String _password = "";
  bool isLoading = false;

  AutovalidateMode _autoValidate = AutovalidateMode.always;

  @override
  Widget build(BuildContext context) {
    ref.listen<Result<dynamic>>(loginControllerProvider, (previous, current) {
      current.when(
          idle: () {},
          loading: () {
            setState(() {
              isLoading = true;
            });
          },
          success: (result) {
            Navigator.of(context)
                .pushNamedAndRemoveUntil(homeScreen, (route) => false);
            setState(() {
              isLoading = false;
            });
          },
          failure: (reason) {
            setState(() {
              isLoading = false;
            });
          });
    });

    final controllerNotifier = ref.watch(loginControllerProvider.notifier);
    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
      child: Form(
          autovalidateMode: _autoValidate,
          key: _formkey,
          child: Center(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 60.0),
                  child: Center(
                    child: Container(
                        width: 400,
                        height: 300,
                        child: Image.asset(cafRedLogo)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: TextFormField(
                    onChanged: ((value) => _email = value),
                    keyboardType: TextInputType.emailAddress,
                    controller: _emailController,
                    onSaved: (value) => _email = value ?? "",
                    decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        labelText: context.localization.email,  
                        hintText: context.localization.emailHint),
                    validator: (value) {
                      if (value?.isEmpty == true) {
                        return 'Invalid String';
                      }

                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 15.0, right: 15.0, top: 15, bottom: 0),
                  child: TextFormField(
                    controller: _passwordController,
                    onSaved: (value) => _password = value ?? "",
                    obscureText: true,
                    decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        labelText: context.localization.password,
                        hintText: context.localization.passwordHint),
                    //validatePassword,        //Function to check validation
                  ),
                ),
                const SizedBox(height: 24),
                LoadingButton(
                    label: context.localization.login,
                    onClick: () =>
                        {controllerNotifier.validateLogin(_email, _password)},
                    isLoading: isLoading),
              ],
            ),
          )),
    )));
  }
}
