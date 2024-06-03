// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:app_02/routes.dart'; // Importe a sua classe de rotas

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    onGenerateRoute: Routes
        .generateRoute, // Use a função generateRoute da sua classe de rotas
  ));
}
