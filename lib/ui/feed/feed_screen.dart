import 'package:caf_application/extension/build_context_extensions.dart';
import 'package:caf_application/ui/components/feed_component.dart';
import 'package:caf_application/ui/components/helper_view.dart';
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
    final controllerProvider = ref.read(feedControllerProvider);

    return Container(
      child: Column(
        children: <Widget>[
          Text(context.localization.news),
          FutureBuilder(
            builder: (context, AsyncSnapshot<List<FeedViewData>> snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                case ConnectionState.waiting:
                  return Center(child: CircularProgressIndicator());
                case ConnectionState.done:
                case ConnectionState.active:
                  if (snapshot.hasError) {
                    return HelperView();
                  } else {
                    return _contentBody(snapshot);
                  }
                default:
                  return Container();
              }
            },
            future: controllerProvider.getFeedItems(),
          )
        ],
      ),
    );
  }

  Widget _contentBody(AsyncSnapshot<List<FeedViewData>> snapshot) {
    return Expanded(
        child: ListView.builder(
      itemCount: snapshot.data!.length,
      itemBuilder: (context, index) {
        final item = snapshot.data![index];
        return FeedComponent(
            item.imageUrl, item.description, item.id, item.title, () {
          print("clicked");
        });
      },
    ));
  }
}
