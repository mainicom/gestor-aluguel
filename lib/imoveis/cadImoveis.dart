import 'package:flutter/material.dart';
import 'package:http/http.dart'as http ;


class ImoveisForms extends StatefulWidget{
 final String userid;
 final Map imovel;
 
 const ImoveisForms({super.key, required this.userid, required this.imovel});
 @override
  State<ImoveisForms> createState() {
   return formState();
  }
}
class formState  extends State<ImoveisForms>{
   var botao = "";
   @override

  void initState(){
  super.initState();
  analizar();
  }
 void analizar(){
  if(widget.imovel.isEmpty){
  botao = "cadastrar";
  }else{    botao = "salvar alterações";
    endereco.text = widget.imovel['endereco']?? "";
    descricao.text = widget.imovel['descricao']?? "";
    endereco.text = widget.imovel['endereco'] ?? "";
    bairro.text = widget.imovel['bairro'] ?? "";
    cidade.text = widget.imovel['cidade'] ?? "";
    cep.text = widget.imovel['cep'] ?? "";   
  }


 }
Future<void> cadastrar ()async{
  if(widget.imovel.isEmpty){
   var retorno =await http.post(
   Uri.parse("http://localhost/imoveis/cadImoveis.php"),
   body:{
    'bairro': bairro.text,
    'cidade': cidade.text,
    'cep': cep.text,
    'userId': widget.userid,
    'descricao': descricao.text, 
    'endereco': endereco.text});  
    print(retorno.statusCode);
    print(retorno.body);
    endereco.text = "";
    descricao.text = "";
    
    Navigator.pop(context);
 }else{  var retorno =await http.post(
   Uri.parse("http://localhost/imoveis/alterarImoveis.php"),
   body:{
    'imovelId': widget.imovel["id"],
    'userId': widget.userid,
    'descricao': descricao.text, 
    'endereco': endereco.text,
    'bairro': bairro.text,
    'cidade': cidade.text,
    'cep': cep.text,
    });  
    print(retorno.statusCode);
    print(retorno.body);
    endereco.text = "";
    descricao.text = "";
    bairro.text ="";
    cep.text = "";
    cidade.text= "";
    Navigator.pop(context);}
 
 
 }
TextEditingController descricao = TextEditingController();
TextEditingController endereco = TextEditingController();
TextEditingController bairro = TextEditingController();
TextEditingController cidade = TextEditingController();
TextEditingController cep = TextEditingController();
  @override
 Widget build(BuildContext context){
  return Scaffold(
    appBar: AppBar(title: Text(widget.imovel["descricao"]?? "cadastro de imoveis"),),
    body: Padding(
        padding: const EdgeInsets.only(top: 20.0), 
        child: Column(
        spacing: 15,
       // mainAxisAlignment: MainAxisAlignment.start,
        children: [
            SizedBox(
         // width: 500,
          child: TextField(
          controller: descricao,
          decoration: InputDecoration(
          hintText:widget.imovel["descricao"]?? "descrição do imovel", 
          border: OutlineInputBorder(),
          label: Text("descrição")
          ),

          ),

          ),  SizedBox(
          //width: 500,  
          child: TextField(
          controller: endereco,
          decoration: InputDecoration(
            hintText: widget.imovel["endereco"] ??"rua e numero", 
          border: OutlineInputBorder()
          ,label: Text("rua e numero") 
          ),
  
          ),
          ),
SizedBox(
  child: TextField(
    controller: bairro,
    decoration: const InputDecoration(
      hintText: "Bairro",
      border: OutlineInputBorder(),
      label: Text("bairro") 
    ),
  ),
),

SizedBox(
  child: TextField(
    controller: cidade,
    decoration: const InputDecoration(
      hintText: "Cidade",
      border: OutlineInputBorder(),
    label: Text("cidade") 
    ),
  ),
),

SizedBox(
  child: TextField(
    controller: cep,
    keyboardType: TextInputType.number,
    decoration: const InputDecoration(
      hintText: "CEP",
      border: OutlineInputBorder(),
      label: Text("CEP") 
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