
import 'package:caf_application/extension/build_context_extensions.dart';
import 'package:caf_application/ui/feed/feed_controller.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FeedScreen extends StatefulHookConsumerWidget {
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _FeedScreen();

}

class _FeedScreen extends ConsumerState<FeedScreen> {
  @override
  Widget build(BuildContext context) {
   final feedController = ref.read(feedControllerProvider);
   return Text(context.localization.news);
  }
}