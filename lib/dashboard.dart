// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:gestao_aluguel/alugueis/alugueis.dart';
import 'package:gestao_aluguel/imoveis/imoveis.dart';
import 'package:gestao_aluguel/pessoas/pessoas.dart';
/*import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:fl_chart/fl_chart.dart';
*/

class dashboard extends StatelessWidget{
final String userid;
const dashboard({super.key, required this.userid });
@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("henrique"),
      
      ),
      drawer: Drawer(child: ListView(
        children:[
        ListTile(
          title: Text('imoveis'),
          onTap: () {
           Navigator.push(context
          , MaterialPageRoute(
            builder: (context) => imoveis(userid: userid),));
            
          },
          
        ),
         ListTile(
          title: Text('pessoas'),
          onTap: (){
          Navigator.push(context
          , MaterialPageRoute(builder: (context) => Pessoas(userid: userid),));
          },
          ),
           ListTile(
          title: Text('alugueis'),
          onTap: (){
          Navigator.push(context
          , MaterialPageRoute(builder: (context) => alugueis(userid: userid),));
          },
        )

      ]
      )
    ),


      body: Center(
            child: Container(),
            )
);
  }


}