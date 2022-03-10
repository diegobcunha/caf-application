import 'package:caf_application/ui/feed/feed_screen.dart';
import 'package:caf_application/ui/match/match_screen.dart';
import 'package:caf_application/ui/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomeScreen extends StatefulHookConsumerWidget {
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreen();
}

class _HomeScreen extends ConsumerState<HomeScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(child: _screns()[_currentIndex]),
        bottomNavigationBar: BottomNavigationBar(
            backgroundColor: primaryColor,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Colors.black,
            unselectedItemColor: Colors.white,
            items: _menuItems(),
            currentIndex: _currentIndex,
            onTap: _onTabChanged));
  }

  void _onTabChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  List<BottomNavigationBarItem> _menuItems() {
    return [
      const BottomNavigationBarItem(icon: Icon(Icons.newspaper), label: "Feed"),
      const BottomNavigationBarItem(
          icon: Icon(Icons.emoji_events), label: "Competições"),
          const BottomNavigationBarItem(icon: Icon(Icons.poll), label: "Estatísticas"),
      const BottomNavigationBarItem(icon: Icon(Icons.person), label: "Perfil")
    ];
  }

  List<Widget> _screns() {
    return [FeedScreen(), MatchScreen(), Text("Estatísticas"), Text("Perfil")];
  }
}
