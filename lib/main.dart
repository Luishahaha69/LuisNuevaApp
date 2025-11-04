import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'screens/login.dart';
import 'screens/home.dart';
final storage = FlutterSecureStorage();
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  String? token = await storage.read(key: 'access_token');
  runApp(MyApp(startLogged: token!=null));
}
class MyApp extends StatelessWidget{
  final bool startLogged;
  const MyApp({required this.startLogged, super.key});
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'Auth Mock App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: startLogged? HomeScreen(): LoginScreen(),
    );
  }
}
