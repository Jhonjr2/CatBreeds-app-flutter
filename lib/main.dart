import 'package:prueba_tecnica/app.dart';
import 'package:prueba_tecnica/core/di/injection.dart';
import 'package:flutter/material.dart';

void main() async {
  // Ensure Flutter bindings are initialized
  WidgetsFlutterBinding.ensureInitialized();
  
  // Configure dependency injection
  configureDependencies();
  
  // Initialize the app
  runApp(const CatBreedsApp());
}
