// ignore_for_file: avoid_print, camel_case_types

import 'package:flutter/material.dart';
import 'package:gestao_aluguel/alugueis/cadAlugueis.dart';
import 'package:gestao_aluguel/pessoas/cadPessoas.dart';
import 'package:http/http.dart'as http ;
import 'dart:convert';

class alugueis extends StatefulWidget{
  final String userid;
  const alugueis({super.key, 
  required this.userid});
  @override
  State<alugueis> createState(){
    return aluguelState();
  }
}

class aluguelState extends State<alugueis>{
List<dynamic> retorno = [];
Future<void> retornar()async{
var requist = await http.post(Uri.parse("http://localhost/alugueis/alugueis.php"), 
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
      appBar: AppBar(title: Text("alugueis"),),
      body: ListView.builder(
        itemCount: retorno.length,
        itemBuilder:(context, index){   
        return ListTile(
        leading: Icon(Icons.handshake),  
        title: Text(retorno[index]["dataInicio"]??"nada aqui",
        style: Theme.of(context).textTheme.bodyLarge),
      subtitle: Text(retorno[index]["valor"]?? "nada aqui ainda"),
      onTap:()async{ await Navigator.push(context, MaterialPageRoute(builder: (context) =>alugueisforms(userid: widget.userid, aluguel: retorno[index])));
        retornar();},
        );
        
      }),
    floatingActionButton: FloatingActionButton(child: Icon(Icons.person_add),
        onPressed: ()async{ await Navigator.push(context, MaterialPageRoute(builder: (context) => alugueisforms(userid: widget.userid, aluguel: Map(), )));
        retornar();}
        ),  
    );  
    
  }
}
