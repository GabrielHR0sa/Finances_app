import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finances_app/src/dialogs/dialogs.dart';
import 'package:finances_app/src/view/finance_page.dart';
import 'package:finances_app/src/view/login_page.dart';
import 'package:flutter/material.dart';

class FirebaseConfig {
  static insertIn(
      BuildContext context,
      String doc,
      String titulo,
      String descricao,
      double preco,
      String id,
      String operation,
      String collection) async {
    var result = FirebaseFirestore.instance.collection(collection);

    if (operation == 'CD') {
      return result
          .doc(doc)
          .set({
            'titulo': titulo,
            'descricao': descricao,
            'preco': preco,
            'id': id
          })
          .then(
            (value) => Dialogs.addSuccess(
              context,
              doc,
              collection,
              'Conta cadastrada com Sucesso!',
              'Deseja Cadastrar outra conta?',
            ),
          )
          .catchError(
            (error) =>
                Dialogs.falhaVerifica(context, 'Falha ao cadastrar a conta'),
          );
    } else {
      return result
          .doc(doc)
          .set({
            'titulo': titulo,
            'descricao': descricao,
            'preco': preco,
            'id': id
          })
          .then(
            (value) => Dialogs.ok(context, 'Conta atualizada com sucesso'),
          )
          .catchError(
            (error) =>
                Dialogs.falhaVerifica(context, 'Falha ao atualizar a conta'),
          );
    }
  }

  static getAllDocs(String collection) async {
    var result = FirebaseFirestore.instance.collection(collection);

    QuerySnapshot querySnapshot = await result.get();

    final allData = querySnapshot.docs.map((doc) => doc.data()).toList();

    getAll(allData);
    return allData;
  }

  static delete(BuildContext context, String doc, String collection) async {
    var result = FirebaseFirestore.instance.collection(collection);

    return result
        .doc(doc)
        .delete()
        .then(
          (value) => Dialogs.deleted(context, 'Conta deletada com sucesso'),
        )
        .catchError(
          (error) => Dialogs.falhaVerifica(context, 'Falha ao deletar a conta'),
        );
  }

  static login(String user, String pass) async {
    var result = FirebaseFirestore.instance.collection('login');

    QuerySnapshot querySnapshot = await result.get();

    final allData = querySnapshot.docs.map((doc) => doc.data()).toList();
    getLoginInfo(allData);
  }
}
