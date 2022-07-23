import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:training_note/model/model.dart';
import 'package:training_note/model/model_pool.dart';
import 'package:training_note/model/user.dart';
import 'package:training_note/model/account.dart';
import 'package:training_note/model/training/training.dart';
import 'package:training_note/util/keys.dart';
import 'package:training_note/util/parts.dart';

class TestViewPage extends StatefulWidget {
  const TestViewPage({Key? key}) : super(key: key);

  @override
  State<TestViewPage> createState() => _TestViewPageState();
}

class _TestViewPageState extends State<TestViewPage> {
  Model account = Account();

  List<Training> trainingList = [
    Training(
        id: "1",
        accountId: "1",
        trainingDate: "20220101",
        createdTime: Timestamp.now(),
        updatedTime: Timestamp.now(),
    ),
    Training(
        id: "2",
        accountId: "1",
        trainingDate: "20220101",
        createdTime: Timestamp.now(),
        updatedTime: Timestamp.now(),
    ),
  ];
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('新規登録'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 30,),
            Container(
              width: 300,
              child: TextField(
                controller: nameController,
                decoration: InputDecoration(hintText: '名前'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Container(
                width: 300,
                child: TextField(
                  controller: emailController,
                  decoration: InputDecoration(hintText: 'メールアドレス'),
                ),
              ),
            ),
            Container(
              width: 300,
              child: TextField(
                controller: passwordController,
                decoration: InputDecoration(hintText: 'パスワード'),
              ),
            ),

            ElevatedButton(
                onPressed: () async{
                  User user = User();
                  (account as Account).signUp(user: user, paswordConfirm: "aa");
                  // account.setModel(key: Keys.account, model: account);
                  // account.setValue(key: Keys.email, val: "makoto1212128@test.com");
                  // account.setValue(key: Keys.password, val: "password");
                  // account.setValue(key: Keys.passwordConfirm, val: "password");
                  // // await (account as Account).signUp();
                  // // print(user.getValue(key: Keys.accountId));

                },
                child: const Text('アカウント作成')
            ),
          ],
        ),
      ),
    );
  }
}
