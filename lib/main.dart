import 'package:flutter/material.dart';
import 'package:travelapp/pages/nav_pages/mainPage.dart';
import 'package:travelapp/pages/welcomePage.dart';

import 'pages/details_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false, home: DetailsPage());
  }
}
