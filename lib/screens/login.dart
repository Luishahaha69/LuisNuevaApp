import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../services/mock_service.dart';
import 'home.dart';
class LoginScreen extends StatefulWidget{
  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState()=>_LoginScreenState();
}
class _LoginScreenState extends State<LoginScreen>{
  final TextEditingController email=TextEditingController();
  final TextEditingController password=TextEditingController();
  bool loading=false;
  final storage=FlutterSecureStorage();
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(children:[
          TextField(controller: email, decoration: const InputDecoration(labelText:'Email')),
          const SizedBox(height:12),
          TextField(controller: password, decoration: const InputDecoration(labelText:'Password'), obscureText:true),
          const SizedBox(height:24),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: loading?null:() async{
                setState(()=>loading=true);
                bool success = await MockAuthService.login(email.text, password.text);
                if(success){
                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_)=>const HomeScreen()));
                }else{
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Credenciales inválidas')));
                }
                setState(()=>loading=false);
              },
              child: loading?const SizedBox(height:18,width:18,child:CircularProgressIndicator(strokeWidth:2)):const Text('Iniciar sesión'),
            ),
          )
        ]),
      ),
    );
  }
}
