// ignore_for_file: use_build_context_synchronously, avoid_print

import 'package:flutter/material.dart';
import 'package:gestao_aluguel/dashboard.dart';
import 'package:http/http.dart'as http ;
import 'dart:convert';
//import 'package:gestao_aluguel/dashboard.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
  return  MaterialApp(
    title: "tela de login",
    home: formularios(),
    theme: ThemeData(scaffoldBackgroundColor: Color.fromARGB(179, 3, 3, 49), 
    textTheme: TextTheme(
      bodyLarge: const TextStyle(
        fontSize: 16,
        color: Color.fromARGB(255, 255, 255, 255))
        )
        ),
     
  
  );
  }
}

// ignore: camel_case_types
class formularios extends StatefulWidget{
  const formularios({super.key});

   @override
  State<formularios> createState(){
    return formulariosState();
    } 

}

// ignore: camel_case_types
class formulariosState extends State<formularios>{
var id = "";
Future<void> entrar()async{
if(email.text !="" && senha.text != ""){
  var retorno = await http.post(
   Uri.parse("http://localhost/auth.php"),
   body: {
    'email': email.text ,
    'senha' : senha.text
   },
  
  );
   var resposta = jsonDecode(retorno.body);
   
   //aparentemente não da pra fazer so if(resposta) pq resposta é um map...(oque que é um map?)
   if(resposta["existe"]){
    setState(() {
    id = resposta["id"];
    });
    Navigator.push(context,
    MaterialPageRoute(builder: (context)=>dashboard(userid: id),));
   }
   else{setState(() {
     mensagemErro = "email ou senha incorretos";
   });}
  }
    else{setState(() {
      mensagemErro = "preencha todos os campos!";
    });
    }



 }
 Future<void> registrar()async{
  if(email.text !="" && senha.text != ""){
  var retorno = await http.post(
   Uri.parse("http://localhost/cadastro.php"),
   body: {
    'email': email.text ,
    'senha' : senha.text
   },
 
  );
  setState(() {
    mensagemErro = "usuario cadastrado com sucesso";
    email.text = "";
    senha.text = "";
    });
    print("Status: ${retorno.statusCode}");
    print("Body: ${retorno.body}");}
    
    else{setState(() {
      mensagemErro = "preencha todos os campos!";
    });}
 }
 var mensagemErro = "";
 TextEditingController email =  TextEditingController();
 TextEditingController senha = TextEditingController();
 @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
        spacing: 10,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(image:  AssetImage(
            'assets/images/logo.jpeg'
          ),
          width: 100,
          height: 100,
          ),
          Text(mensagemErro,
          style: Theme.of(context).textTheme.bodyLarge),
          SizedBox(
          width: 300,  
          child: TextField(
          controller: email,
          decoration: InputDecoration(
            hintText:"digite aqui seu email", 
          border: OutlineInputBorder()
          ),

          ),

          ),

          SizedBox(
          width: 300,  
          child: TextField(
          controller: senha,
          decoration: InputDecoration(
            hintText:"digite aqui sua senha", 
          border: OutlineInputBorder()
          ),

          ),
          ),
           
          ElevatedButton(onPressed: (){entrar();}, 
          child: Text("  entrar  ")),

          
          ElevatedButton(onPressed: (){registrar();}, 
          child: Text("registrar"))
          
          ],
        ),
        
      
      ),

    );
  }



}