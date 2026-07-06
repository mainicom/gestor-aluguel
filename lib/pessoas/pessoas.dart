// ignore_for_file: avoid_print, camel_case_types

import 'package:flutter/material.dart';
import 'package:gestao_aluguel/pessoas/cadPessoas.dart';
import 'package:http/http.dart'as http ;
import 'dart:convert';

class Pessoas extends StatefulWidget{
  final String userid;
  const Pessoas({super.key, 
  required this.userid});
  @override
  State<Pessoas> createState(){
    return PessoasState();
  }
}

class PessoasState extends State<Pessoas>{
List<dynamic> retorno = [];
Future<void> retornar()async{
var requist = await http.post(Uri.parse("http://localhost/pessoas/pessoas.php"), 
body: {'id': widget.userid},);
setState(() {
retorno = jsonDecode(requist.body);
});
}   

   @override
  void initState(){
  super.initState();
  retornar();
  }
  @override
  Widget build(BuildContext context) {
   return Scaffold(
      appBar: AppBar(title: Text("pessoas"),),
      body: ListView.builder(
        itemCount: retorno.length,
        itemBuilder:(context, index){   
        return ListTile(
        leading: Icon(Icons.person),  
        title: Text(retorno[index]["nome"]??"nada aqui",
        style: Theme.of(context).textTheme.bodyLarge),
      subtitle: Text(retorno[index]["sobrenome"]?? "nada aqui ainda"),
      onTap:()async{ await Navigator.push(context, MaterialPageRoute(builder: (context) =>Pessoasforms(userid: widget.userid, pessoa: retorno[index])));
        retornar();},
        );
        
      }),
    floatingActionButton: FloatingActionButton(child: Icon(Icons.person_add),
        onPressed: ()async{ await Navigator.push(context, MaterialPageRoute(builder: (context) => Pessoasforms(userid: widget.userid, pessoa: Map(), )));
        retornar();}
        ),  
    );  
    
  }
}
