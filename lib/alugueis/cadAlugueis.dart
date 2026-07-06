import 'package:flutter/material.dart';
import 'package:gestao_aluguel/alugueis/alugueis.dart';
import 'package:http/http.dart'as http ;


class alugueisforms extends StatefulWidget{
 final String userid;
 final Map aluguel;
 
 const alugueisforms({super.key, required this.userid, required this.aluguel});
 @override
  State<alugueisforms> createState() {
   return formState();
  }
}
class formState  extends State<alugueisforms>{
   var botao = "";
   @override
  void initState(){
  super.initState();
  analizar();
  }
 void analizar(){
  if(widget.aluguel.isEmpty){
  botao = "cadastrar";
  }else{    botao = "salvar alterações";
  }
 dataInicial.text = widget.aluguel["dataInicio"]?? "";
    valor.text = widget.aluguel['valor']?? "";

 }
Future<void> cadastrar ()async{
  if(widget.aluguel.isEmpty){
   var retorno =await http.post(
   Uri.parse("http://localhost/alugueis/cadAlugueis.php"),
   body:{
    'userId': widget.userid,
    'valor': valor.text, 
    'dataInicial': dataInicial.text});  
    valor.text = "";
    dataInicial.text = "";
    Navigator.pop(context);
 }else{  var retorno =await http.post(
   Uri.parse("http://localhost/alugueis/alterarAlugueis.php"),
   body:{
    'aluguelId': widget.aluguel["id"],
    'userId': widget.userid,
    'valor': valor.text, 
    'dataInicial': dataInicial.text});  
    print(retorno.statusCode);
    print(retorno.body);
    valor.text = "";
    dataInicial.text = "";
    Navigator.pop(context);}
 
 
 }
TextEditingController valor =  TextEditingController();
 TextEditingController dataInicial= TextEditingController();
  @override
 Widget build(BuildContext context){
  return Scaffold(
    appBar: AppBar(title: Text(widget.aluguel["nome"]?? "cadastro de pessoas"),),
    body: Padding(
        padding: const EdgeInsets.only(top: 20.0), 
        child: Column(
        spacing: 15,
       // mainAxisAlignment: MainAxisAlignment.start,
        children: [
            SizedBox(
         // width: 500,
          child: TextField(
          controller: valor,
          decoration: InputDecoration(
          hintText:widget.aluguel["valor"]?? "valor do aluguel", 
          border: OutlineInputBorder()
          ,label: Text("valor") 
          ),

          ),

          ),  SizedBox(
          //width: 500,  
          child: TextField(
          controller: dataInicial,
          decoration: InputDecoration(
            hintText: widget.aluguel["dataInicial"] ??"data do inicio do aluguel", 
          border: OutlineInputBorder()
          ,label: Text("data do inicio") 
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