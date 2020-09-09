import 'package:assignmentApp/provider/postProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Ui/screens/screens.dart';
import 'config/theme.dart';
import 'routes.dart' as routes;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: PostProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: AppTheme.customeTheme(),
        home: HomeScreen(),
        routes: {
          routes.homeScreen: (_) => HomeScreen(),
          routes.postScreen: (_) => PostScreen(),
        },
      ),
    );
  }
}
