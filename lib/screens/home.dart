import 'package:flutter/material.dart';
import '../services/mock_service.dart';
import 'login.dart';
class HomeScreen extends StatefulWidget{
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState()=>_HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen>{
  String data='-';
  bool loading=false;
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: const Text('Home'), actions:[
        IconButton(onPressed:()async{
          await MockAuthService.logout();
          Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (_)=>const LoginScreen()),(r)=>false);
        }, icon: const Icon(Icons.logout))
      ]),
      body: Center(child: Column(mainAxisSize: MainAxisSize.min, children:[
        ElevatedButton(onPressed: loading?null:()async{
          setState(()=>loading=true);
          String result = await MockAuthService.getProtectedData();
          setState(()=>{data=result, loading=false});
        }, child: loading?const SizedBox(height:18,width:18,child:CircularProgressIndicator(strokeWidth:2)):const Text('Pedir datos protegidos')),
        const SizedBox(height:16),
        Text('Respuesta:'),
        Text(data),
      ])),
    );
  }
}
