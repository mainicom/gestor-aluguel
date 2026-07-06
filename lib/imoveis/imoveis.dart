// ignore_for_file: avoid_print, camel_case_types

import 'package:flutter/material.dart';
import 'package:gestao_aluguel/imoveis/cadImoveis.dart';
import 'package:http/http.dart'as http ;
import 'dart:convert';

class imoveis extends StatefulWidget{
  final String userid;
  const imoveis({super.key, 
  required this.userid});
  @override
  State<imoveis> createState(){
    return imoveisState();
  }
}

class imoveisState extends State<imoveis>{
List<dynamic> retorno = [];
Future<void> retornar()async{
var requist = await http.post(Uri.parse("http://localhost/imoveis/imoveis.php"), 
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
      appBar: AppBar(title: Text("imoveis"),),
      body: ListView.builder(
        itemCount: retorno.length,
        itemBuilder:(context, index){   
        return ListTile(
        leading: Icon(Icons.home),  
        title: Text(retorno[index]["descricao"]!,
        style: Theme.of(context).textTheme.bodyLarge),
      subtitle: Text(retorno[index]["endereco"]!),
      onTap:()async{ await Navigator.push(context, MaterialPageRoute(builder: (context) =>ImoveisForms(userid: widget.userid, imovel: retorno[index])));
        retornar();},
        );
        
      }),
    floatingActionButton: FloatingActionButton(child: Icon(Icons.add),
        onPressed: ()async{ await Navigator.push(context, MaterialPageRoute(builder: (context) =>ImoveisForms(userid: widget.userid, imovel: Map(), )));
        retornar();}
        ),  
    );  
    
  }
}
