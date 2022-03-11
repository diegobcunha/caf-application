import 'package:hooks_riverpod/hooks_riverpod.dart';

final feedControllerProvider = Provider<FeedController>((_) {
  return FeedController();
});

class FeedController {
  Future<List<FeedViewData>> getFeedItems() async {
    return await [
      FeedViewData(
          description: "Description",
          id: "id",
          title: "title",
          imageUrl: "http://pm1.narvii.com/6393/88ab111541b7ee6d43410696972e1fd7bdb7d7e4_00.jpg")
    ];
  }
}

class FeedViewData {
  final String imageUrl;
  final String title;
  final String description;
  final String id;

  const FeedViewData(
      {required this.id,
      required this.description,
      required this.imageUrl,
      required this.title});
}
