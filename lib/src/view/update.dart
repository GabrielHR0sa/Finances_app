import 'package:finances_app/src/dialogs/dialogs.dart';
import 'package:finances_app/src/firebase/firebase_config.dart';
import 'package:finances_app/src/view/finance_page.dart';
import 'package:flutter/material.dart';

String doc = '';
String name = '';
String descricao = '';
double preco = 0.0;

getValues(String id, String titulo, String descricaov, double precov) {
  doc = id;
  name = titulo;
  descricao = descricaov;
  preco = precov;
}

TextEditingController _id = TextEditingController();
TextEditingController _titulo = TextEditingController();
TextEditingController _descricao = TextEditingController();
TextEditingController _preco = TextEditingController();

class UpdatePage extends StatefulWidget {
  const UpdatePage({super.key});

  @override
  State<UpdatePage> createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {
  @override
  void initState() {
    super.initState();
    _id = TextEditingController(text: doc);
    _titulo = TextEditingController(text: name);
    _descricao = TextEditingController(text: descricao);
    _preco = TextEditingController(text: preco.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.keyboard_backspace_sharp),
          color: Colors.white,
        ),
        title: const Center(
            child: Text(
          'Alterar Conta',
          style: TextStyle(color: Colors.white),
        )),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
                onPressed: () {
                  Dialogs.deleteDoc(context, _id.text, searchMonth);
                },
                icon: const Icon(
                  Icons.delete,
                  color: Colors.black,
                ),
                label: const Text(
                  'Deletar',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
          ),
        ],
      ),
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            color: const Color.fromARGB(98, 179, 213, 255),
            borderRadius: BorderRadius.circular(20),
          ),
          width: MediaQuery.of(context).size.width * 0.7,
          height: MediaQuery.of(context).size.height * 0.6,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextFormField(
                  readOnly: true,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    prefixText: 'Id Conta: ',
                    prefixStyle: const TextStyle(color: Colors.black54),
                    border: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 1, color: Colors.transparent),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  controller: _id,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    prefixText: 'Titulo: ',
                    prefixStyle: const TextStyle(color: Colors.black54),
                    border: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 1, color: Colors.transparent),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  controller: _titulo,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    prefixText: 'Descrição: ',
                    prefixStyle: const TextStyle(color: Colors.black54),
                    border: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 1, color: Colors.transparent),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  controller: _descricao,
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    prefixText: 'Valor: ',
                    prefixStyle: const TextStyle(color: Colors.black54),
                    border: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 1, color: Colors.transparent),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  controller: _preco,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(100, 13, 61, 116),
                    ),
                    onPressed: () {
                      FirebaseConfig.insertIn(
                          context,
                          _id.text,
                          _titulo.text,
                          _descricao.text,
                          double.parse(_preco.text),
                          _id.text,
                          'UP',
                          searchMonth);
                      _id.clear();
                      _titulo.clear();
                      _descricao.clear();
                      _preco.clear();
                    },
                    child: const Text(
                      'Alterar',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
