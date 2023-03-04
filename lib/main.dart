import 'package:brand_names/providers/socket_provider.dart';
import 'package:brand_names/screens/status_screen.dart';
import 'package:flutter/material.dart';
import 'package:brand_names/screens/home_screen.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: ( _ ) => SocketProvider()
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        initialRoute: 'home',
        routes: {
          'home': ( _ ) => const HomeScreen(),
          'status': ( _ ) => const StatusScreen()
        },
      ),
    );
  }
}