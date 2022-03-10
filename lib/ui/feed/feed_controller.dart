import 'package:hooks_riverpod/hooks_riverpod.dart';

final feedControllerProvider = Provider<FeedController>((_) {
  return FeedController();
});

class FeedController {}
