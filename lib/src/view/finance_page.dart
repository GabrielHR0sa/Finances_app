import 'package:finances_app/src/firebase/firebase_config.dart';
import 'package:finances_app/src/view/update.dart';
import 'package:flutter/material.dart';

List data = [];
List list = [];
String searchMonth = '';
dynamic teste;

class FinancePage extends StatefulWidget {
  const FinancePage({super.key});

  @override
  State<FinancePage> createState() => _FinancePageState();
}

getAll(List dados) {
  data = dados;
}

getMonth(String month) {
  searchMonth = month;
}

class _FinancePageState extends State<FinancePage> {
  _initData() async {
    list = await FirebaseConfig.getAllDocs(searchMonth);
    setState(() {});
    return list;
  }

  @override
  initState() {
    super.initState();
    _initData().then((_) {
      setState(() {});
    });
  }

  _searchBy(String name) {
    setState(
      () {
        list = data
            .where(
              (element) => element.toString().contains(name),
            )
            .toList();
      },
    );
  }

  @override
  void dispose() {
    list = [];
    searchMonth = '';
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final largura = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        title: Center(
          child: Text(
            searchMonth,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
      body: Column(
        children: [
          Row(
            children: [
              SizedBox(
                width: largura * 0.35,
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: largura * 0.23,
                      height: 35,
                      child: TextFormField(
                        onChanged: (value) {
                          _searchBy(value);
                        },
                        cursorHeight: 20,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderSide:
                                const BorderSide(width: 1, color: Colors.black),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          suffixIcon: const Icon(Icons.search),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: FloatingActionButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed('/add').then((_) {
                      FirebaseConfig.getAllDocs(searchMonth);
                      setState(() {
                        list = data;
                      });
                    });
                  },
                  child: const Icon(
                    Icons.post_add_outlined,
                  ),
                ),
              ),
            ],
          ),
          list.isNotEmpty
              ? Expanded(
                  child: ListView.builder(
                    itemCount: list.length,
                    itemBuilder: (context, index) {
                      final dados = list[index];
                      return Card(
                        elevation: 5,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListTile(
                            leading: ClipOval(
                              child: Container(
                                height: 50,
                                width: 50,
                                color: const Color.fromARGB(99, 0, 115, 255),
                                child: Center(
                                  child: Text(
                                    dados['id'] ?? '',
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                            trailing: IconButton(
                              onPressed: () {
                                getValues(
                                    dados['id'] ?? '',
                                    dados['titulo'] ?? '',
                                    dados['descricao'] ?? '',
                                    dados['preco'] ?? '');
                                Navigator.of(context)
                                    .pushNamed('/update')
                                    .then((_) {
                                  FirebaseConfig.getAllDocs(searchMonth);
                                  setState(() {
                                    list = data;
                                  });
                                });
                              },
                              icon: const Icon(
                                Icons.edit,
                              ),
                            ),
                            title: Text(
                              dados['titulo'] ?? '',
                              style: const TextStyle(
                                fontSize: 20,
                              ),
                            ),
                            subtitle: RichText(
                              text: TextSpan(
                                children: [
                                  const TextSpan(
                                    text: 'Descrição: ',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 15),
                                  ),
                                  TextSpan(
                                    text: dados['descricao'] ?? '',
                                    style: const TextStyle(
                                      color: Colors.black54,
                                    ),
                                  ),
                                  const TextSpan(text: '\n'),
                                  const TextSpan(
                                    text: 'Preço: ',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 15),
                                  ),
                                  TextSpan(
                                    text: 'R\$ ${dados['preco']}',
                                    style: const TextStyle(
                                      color: Colors.black54,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}