import 'package:flutter/material.dart';
import 'package:lichi_test/domain/services/database_services.dart';
import 'package:lichi_test/widgets/my_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final databaseServices = DatabaseServices();
  await databaseServices.open();

  runApp(const MyApp());
}
