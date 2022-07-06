import 'package:auto_route/auto_route.dart';
import 'package:auto_route_example_app/routes/router.gr.dart';
import 'package:auto_route_example_app/theme/theme_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool _isDark = context.watch<ThemeManager>().themeMode == ThemeMode.dark;

    return AutoTabsScaffold(
      appBarBuilder: (context, tabsRouter) => AppBar(
        backgroundColor: Theme.of(context).backgroundColor,
        foregroundColor: Theme.of(context).primaryColor,
        title: const Text('Posts App'),
        centerTitle: true,
        elevation: 0,
        leading: const AutoLeadingButton(),
        actions: [
          IconButton(
            onPressed: () {
              if (context.read<ThemeManager>().themeMode == ThemeMode.dark) {
                context.read<ThemeManager>().toggleTheme(false);
                _isDark = false;
              } else {
                context.read<ThemeManager>().toggleTheme(true);
                _isDark = true;
              }
            }, 
            icon: _isDark ? const Icon(Icons.light_mode_rounded) : const Icon(Icons.dark_mode_rounded),
          ),
        ]
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      routes: const [
        PostsRouter(),
        UsersRouter(),
        SettingsRouter(),
      ],
      bottomNavigationBuilder: (context, tabsRouter) {
        return SalomonBottomBar(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
          currentIndex: tabsRouter.activeIndex,
          onTap: tabsRouter.setActiveIndex,
          items: [
            SalomonBottomBarItem(
              selectedColor: Colors.blue,
              icon: const Icon(Icons.post_add_rounded,),
              title: const Text('Posts'),
            ),
            SalomonBottomBarItem(
              selectedColor: Colors.blue,
              icon: const Icon(Icons.person_rounded),
              title: const Text('Users'),
            ),
            SalomonBottomBarItem(
              selectedColor: Colors.blue,
              icon: const Icon(Icons.settings),
              title: const Text('Settings'),
            ),
          ],
        );
      },
    );
  }
}
