import 'package:caf_application/ui/match/match_controller.dart';
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
    final matchController = ref.read(matchControllerProvider);
    return Text("Partidas");
  }
}
