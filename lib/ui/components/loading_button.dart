import 'package:caf_application/extension/build_context_extensions.dart';
import 'package:flutter/material.dart';

import '../theme/colors.dart';

class LoadingButton extends StatelessWidget {
  LoadingButton(
      {required this.label,
      required this.onClick,
      this.width = double.infinity,
      this.height = 50,
      this.isLoading = false,
      this.enabled = false});

  bool isLoading;
  bool enabled;
  String label;
  double width = double.infinity;
  double height;
  Function onClick;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 50,
        width: 250,
        decoration: BoxDecoration(
            color: secondaryColor, borderRadius: BorderRadius.circular(20)),
        child: MaterialButton(
            hoverElevation: 8,
            hoverColor: Colors.grey,
            onPressed: isLoading ? null : () => {onClick()},
            child: isLoading
                ? const CircularProgressIndicator(color: Colors.white)
                : Text(label,
                    style:
                        const TextStyle(color: Colors.white, fontSize: 24))));
  }
}
