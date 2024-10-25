import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'To-do-list',
      home: MyHome(),
    ); //MaterialApp
  }
}

class MyHome extends StatefulWidget{
  const MyHome({super.key});

  @override
  State<StatefulWidget> createState() {
    return MyHomeState();
  }
}

class MyHomeState extends State<MyHome> {
  List<String> itens = <String>['tomate', 'abacaxi'];
  final TextEditingController _controller = TextEditingController(); // Controlador para o TextField

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: const Text('To-do'),
        backgroundColor: Colors.black,
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: <Widget>[
                Expanded( 
                  child: SizedBox(
                    height: 40,
                    child: TextField(
                      controller: _controller,
                      decoration: InputDecoration(
                        labelText: 'Digite uma tarefa',
                        labelStyle: TextStyle(color: Colors.grey[600]),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(color: Colors.deepPurpleAccent),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(color: Colors.deepPurpleAccent, width: 2),
                          ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 8),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8), // Bordas arredondadas no botão
                      ),
                      backgroundColor: Colors.deepPurpleAccent, // Cor do botão
                    ),
                  child: const Text('add'),
                  onPressed: () {
                    setState(() {
                      if (_controller.text.isNotEmpty) {
                        itens.add(_controller.text);
                        _controller.clear(); // Limpa o campo de texto
                      }
                    });
                  },
                ),
              ],
            ),
          ),
          Expanded( // Expande o ListView para ocupar o restante do espaço
            child: ListView.builder(
              itemCount: itens.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(itens[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}