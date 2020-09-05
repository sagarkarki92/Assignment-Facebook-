import 'package:assignmentApp/provider/postProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Ui/screens/screens.dart';
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
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          scaffoldBackgroundColor: Color(0xFFF0F2F5),
        ),
        home: HomeScreen(),
        routes: {
          routes.postScreen: (_) => PostScreen(),
        },
      ),
    );
  }
}
