import 'package:flutter/material.dart';
import 'package:jose_filho_trabalho2_opta2/model/carro.dart';

class ListaCarro extends StatefulWidget {
  const ListaCarro({super.key});

  @override
  State<ListaCarro> createState() => _ListaCarroState();
}

class _ListaCarroState extends State<ListaCarro> {
  final List<Carro> carros = <Carro>[
    Carro("ABC1234", "Azul", 2010),
    Carro("DEF5678", "Vermelho", 2015),
    Carro("GHI9101", "Verde", 2020),
  ];
  TextEditingController _placaController = TextEditingController();
  TextEditingController _corController = TextEditingController();
  TextEditingController _anoController = TextEditingController();

  void _inserir(){
    setState(() {
      carros.insert(0, Carro(_placaController.text,
          _corController.text,
          int.tryParse(_anoController.text) != null ? int.parse(_anoController.text): 0));
    });
  }

  void _limparFormulario(){
    _placaController.clear();
    _corController.clear();
    _anoController.clear();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista de carros"),
        centerTitle: true,
        backgroundColor: Colors.indigoAccent,
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(20),
            child: TextField(
              controller: _placaController,
              decoration: InputDecoration(
                labelText: "Placa",
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: TextField(
              controller: _corController,
              decoration: InputDecoration(
                labelText: "Cor",
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: TextField(
              keyboardType: TextInputType.number,
              controller: _anoController,
              decoration: InputDecoration(
                labelText: "Ano",
              ),
            ),
          ),
          ElevatedButton(
            onPressed: (){
              _inserir();
              _limparFormulario();
            },
            child: Text("Inserir"),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(8.0),
              itemCount: carros.length,
              itemBuilder: (BuildContext context, int index){
                return Container(
                  height: 50,
                  margin: EdgeInsets.all(2.0),
                  color: carros[index].ano <= 2010 ? Colors.red : carros[index].ano <= 2015 ? Colors.yellow : Colors.green,
                  child: Center(
                    child: Text("${carros[index].placa} - ${carros[index].cor} - ${carros[index].ano}",
                        style: TextStyle(fontSize: 18),
                    )
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
