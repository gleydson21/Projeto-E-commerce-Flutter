import 'package:flutter/material.dart';
import 'package:app_02/routes.dart'; // Importe a sua classe de rotas

void main() {
  // ignore: prefer_const_constructors
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: Routes.login, // Defina a rota inicial como "splash"
    onGenerateRoute: Routes.generateRoute, // Use a função generateRoute da sua classe de rotas
  ));
}