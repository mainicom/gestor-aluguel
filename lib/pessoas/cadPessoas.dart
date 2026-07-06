import 'package:flutter/material.dart';
import 'package:http/http.dart'as http ;


class Pessoasforms extends StatefulWidget{
 final String userid;
 final Map pessoa;
 
 const Pessoasforms({super.key, required this.userid, required this.pessoa});
 @override
  State<Pessoasforms> createState() {
   return formState();
  }
}
class formState  extends State<Pessoasforms>{
   var botao = "";
   @override
  void initState(){
  super.initState();
  analizar();
  }
 void analizar(){
  if(widget.pessoa.isEmpty){
  botao = "cadastrar";
  }else{    botao = "salvar alterações";
  }
 sobrenome.text = widget.pessoa["sobrenome"]?? "";
    nome.text = widget.pessoa['nome']?? "";

 }
Future<void> cadastrar ()async{
  if(widget.pessoa.isEmpty){
   var retorno =await http.post(
   Uri.parse("http://localhost/pessoas/cadPessoas.php"),
   body:{
    'userId': widget.userid,
    'nome': nome.text, 
    'sobrenome': sobrenome.text});  
    print(retorno.statusCode);
    print(retorno.body);
    sobrenome.text = "";
    nome.text = "";
    Navigator.pop(context);
 }else{  var retorno =await http.post(
   Uri.parse("http://localhost/pessoas/alterarPessoas.php"),
   body:{
    'pessoaId': widget.pessoa["id"],
    'userId': widget.userid,
    'nome': nome.text, 
    'sobrenome': sobrenome.text});  
    nome.text = "";
    sobrenome.text = "";
    Navigator.pop(context);}
 
 
 }
TextEditingController nome =  TextEditingController();
 TextEditingController sobrenome = TextEditingController();
  @override
 Widget build(BuildContext context){
  return Scaffold(
    appBar: AppBar(title: Text(widget.pessoa["nome"]?? "cadastro de pessoas"),),
    body: Padding(
        padding: const EdgeInsets.only(top: 20.0), 
        child: Column(
        spacing: 15,
       // mainAxisAlignment: MainAxisAlignment.start,
        children: [
            SizedBox(
         // width: 500,
          child: TextField(
          controller: nome,
          decoration: InputDecoration(
          hintText:widget.pessoa["nome"]?? "nome", 
          border: OutlineInputBorder()
          ,label: Text("nome") 
          ),

          ),

          ),  SizedBox(
          //width: 500,  
          child: TextField(
          controller: sobrenome,
          decoration: InputDecoration(
            hintText: widget.pessoa["sobrenome"] ??"sobrenome", 
          border: OutlineInputBorder()
          ,label: Text("sobrenome") 
          ),

          ),
          ),

        ElevatedButton(onPressed: (){cadastrar();}, child: Text(botao))
        ]
    )
    )
    );
    }

}