import 'package:finances_app/src/model/month.dart';
import 'package:finances_app/src/view/finance_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

final availableHeigth = AppBar().preferredSize.height;

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final month = Month.getMonth();
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Controle Financeiro',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height - availableHeigth,
        width: MediaQuery.of(context).size.width,
        child: ListView.builder(
          itemCount: month.length,
          itemBuilder: (context, index) {
            final chooseMonth = month[index];
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
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
                            chooseMonth.number,
                          ),
                        ),
                      ),
                    ),
                    title: Text(
                      chooseMonth.name,
                    ),
                    trailing: const Icon(Icons.arrow_circle_right_outlined),
                    onTap: () {
                      Navigator.of(context).pushNamed('/finance');
                      setState(() {
                        getMonth(chooseMonth.name);
                      });
                    },
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
