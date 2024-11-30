import 'package:flutter/material.dart';

//teste
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'To-do-list',
      home: MyHome(),
    );
  }
}

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<StatefulWidget> createState() {
    return MyHomeState();
  }
}

class MyHomeState extends State<MyHome> {
  final TextEditingController _controller = TextEditingController(); // Controlador para o TextField
  List<String> itens = <String>['tomate', 'abacaxi'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('To-do', style: TextStyle(color: Colors.white)),
        backgroundColor: const Color.fromARGB(255, 92, 61, 175),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: itens.length,
              itemBuilder: (context, index) {
                 return GestureDetector(
                   onLongPress: () {
                    _showDeleteConfirmationDialog(index);
                  },
                  child: ListTile(
                    title: Text(itens[index]),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: SizedBox(
                    height: 40,
                    child: TextField(
                      controller: _controller,
                      decoration: InputDecoration(
                        labelText: 'Digite uma tarefa',
                        labelStyle: const TextStyle(color: Color.fromARGB(255, 36, 45, 86)), //texto dentro do label
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide: const BorderSide(color: Colors.deepPurpleAccent),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide: const BorderSide(
                              color: Colors.deepPurpleAccent, width: 2),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    backgroundColor: const Color.fromARGB(255, 92, 61, 175),
                  ),
                  child: const Icon(Icons.add, color: Colors.white,),
                  onPressed: () {
                    setState(() {
                      if (_controller.text.isNotEmpty) {
                        itens.add(_controller.text);
                        _controller.clear();
                      }
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

    void _showDeleteConfirmationDialog(int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Excluir tarefa"),
          content: const Text("Tem certeza que deseja excluir esta tarefa?"),
          actions: [
            TextButton(
              child: const Text("Cancelar"),
              onPressed: () {
                Navigator.of(context).pop(); // Fecha o diálogo sem excluir
              },
            ),
            TextButton(
              child: const Text("Excluir"),
              onPressed: () {
                setState(() {
                  itens.removeAt(index); // Remove o item da lista
                });
                Navigator.of(context).pop(); // Fecha o diálogo
              },
            ),
          ],
        );
      },
    );
  }
}

