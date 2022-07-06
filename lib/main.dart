import 'package:auto_route_example_app/routes/router.gr.dart';
import 'package:auto_route_example_app/theme/theme_constants.dart';
import 'package:auto_route_example_app/theme/theme_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _appRouter = AppRouter();

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeManager()),
      ],
      builder: (context, child) { 
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: 'My App',
          theme: lightTheme,
          darkTheme: darkTheme,
          themeMode: context.watch<ThemeManager>().themeMode,
          routerDelegate: _appRouter.delegate(),
          routeInformationParser: _appRouter.defaultRouteParser(),
        );
      }
    );

  }
}
