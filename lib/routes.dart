import 'package:app_02/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:app_02/screens/home_screen.dart'; // Importe a classe HomePage
import 'package:app_02/screens/splash_screen.dart'; // Importe a classe SplashScreen
// Importe outras telas, se necessário

class Routes {
  static const String splash = '/';
  static const String home = '/home';
  static const String login = '/login';
  static const String tela1 = '/tela1';
  static const String tela2 = '/tela2';
  static const String tela3 = '/tela3';
  static const String tela4 = '/tela4';
  static const String tela5 = '/tela5';

  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(builder: (_) => const HomePage());
      case splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case login:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      // case tela1:
      //   return MaterialPageRoute(builder: (_) => Tela1());
      // case tela2:
      //   return MaterialPageRoute(builder: (_) => Tela2());
      // case tela3:
      //   return MaterialPageRoute(builder: (_) => Tela3());
      // case tela4:
      //   return MaterialPageRoute(builder: (_) => Tela4());
      // case tela5:
      //   return MaterialPageRoute(builder: (_) => Tela5());
      default:
        // Se a rota não for encontrada, exiba uma tela de erro
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            appBar: AppBar(
              title: const Text('Ops!'),
            ),
            body: Center(
              child: Text('Rota não encontrada: ${settings.name}'),
            ),
          ),
        );
    }
  }
}
