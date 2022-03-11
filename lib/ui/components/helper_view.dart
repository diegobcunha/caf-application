import 'package:flutter/material.dart';

class HelperView extends StatefulWidget {
  Function? onRetry;
  bool isLoading;

  HelperView({Key? key, this.onRetry, this.isLoading = false})
      : super(key: key);

  @override
  State<HelperView> createState() =>
      _HelperView(onRetry: onRetry, isLoading: isLoading);
}

class _HelperView extends State<HelperView> {
  Function? onRetry;
  bool isLoading;

  _HelperView({this.onRetry, this.isLoading = false});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        const Icon(
          Icons.error_outline_rounded,
          color: Colors.red,
          size: 60,
        ),
        const Padding(
            padding: EdgeInsets.only(top: 16),
            child: Text("Ops, algo deu errado")),
        const Text("Algo deu errado, tente novamente em seguida")
      ],
    ));
  }
}
