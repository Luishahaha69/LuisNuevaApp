import 'dart:async';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
class MockAuthService{
  static final storage = FlutterSecureStorage();
  static Future<bool> login(String email, String password) async{
    await Future.delayed(const Duration(seconds:1));
    if(email.isNotEmpty && password.isNotEmpty){
      await storage.write(key:'access_token', value:'fake_token_123');
      return true;
    }
    return false;
  }
  static Future<void> logout() async{
    await storage.delete(key:'access_token');
  }
  static Future<String> getProtectedData() async{
    await Future.delayed(const Duration(seconds:1));
    return 'Datos protegidos simulados';
  }
}
