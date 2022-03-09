
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MatchScreen extends StatefulHookConsumerWidget {
  @override
  ConsumerState<MatchScreen> createState() {
    return _MatchScreen();
  }
}

class _MatchScreen extends ConsumerState<MatchScreen> {
  
  @override
  Widget build(BuildContext context) {
    return Text("Home");
  }
  
}