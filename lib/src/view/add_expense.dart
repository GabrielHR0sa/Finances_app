import 'package:finances_app/src/firebase/firebase_config.dart';
import 'package:finances_app/src/view/finance_page.dart';
import 'package:flutter/material.dart';

TextEditingController _idAcss = TextEditingController();
TextEditingController _titulo = TextEditingController();
TextEditingController _descricao = TextEditingController();
TextEditingController _preco = TextEditingController();

class AddPage extends StatefulWidget {
  const AddPage({super.key});

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  @override
  void initState() {
    super.initState();

    _idAcss.clear();
    _titulo.clear();
    _descricao.clear();
    _preco.clear();
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
            'Adicionar Conta',
            style: TextStyle(color: Colors.white),
          ),
        ),
        actions: [
          Container(
            width: 30,
          )
        ],
      ),
      body: Center(
        child: Container(
          decoration: BoxDecoration(
              color: const Color.fromARGB(98, 179, 213, 255),
              borderRadius: BorderRadius.circular(20)),
          width: MediaQuery.of(context).size.width * 0.85,
          height: MediaQuery.of(context).size.height * 0.6,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextFormField(
                  controller: _idAcss,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    labelText: 'Id da conta',
                    border: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 1, color: Colors.transparent),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                TextFormField(
                  controller: _titulo,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    labelText: 'Titulo',
                    border: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 1, color: Colors.transparent),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                TextFormField(
                  controller: _descricao,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    labelText: 'Descrição',
                    border: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 1, color: Colors.transparent),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                TextFormField(
                  controller: _preco,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    labelText: 'Valor',
                    border: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 1, color: Colors.transparent),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
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
                            _idAcss.text,
                            _titulo.text,
                            _descricao.text,
                            _preco.text,
                            _idAcss.text,
                            'CD',
                            searchMonth);
                        _idAcss.clear();
                        _titulo.clear();
                        _descricao.clear();
                        _preco.clear();
                      },
                      child: const Text(
                        'Salvar ',
                        style: TextStyle(color: Colors.white),
                      )),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
