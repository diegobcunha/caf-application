import 'package:caf_application/ui/components/images_assets.dart';
import 'package:caf_application/ui/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../navigation/navigation_route.dart';

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

  AutovalidateMode _autoValidate = AutovalidateMode.always;

  @override
  Widget build(BuildContext context) {
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
                        width: 200,
                        height: 150,
                        child: Image.asset(cafRedLogo)),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    controller: _emailController,
                    onSaved: (value) => _email = value ?? "",
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Email',
                        hintText: 'Enter valid email id as abc@gmail.com'),
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
                        border: OutlineInputBorder(),
                        labelText: 'Password',
                        hintText: 'Enter secure password'),
                    //validatePassword,        //Function to check validation
                  ),
                ),
                SizedBox(height: 24),
                Container(
                    height: 50,
                    width: 250,
                    decoration: BoxDecoration(
                        color: secondaryColor,
                        borderRadius: BorderRadius.circular(20)),
                    child: TextButton(
                        onPressed: () => {
                        },
                        child: Text("Login",
                            style:
                                TextStyle(color: Colors.white, fontSize: 25)))),
              ],
            ),
          )),
    )));
  }
}
