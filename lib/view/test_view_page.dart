import 'package:flutter/material.dart';
import 'package:training_note/firebase/auth/authentication.dart';
import 'package:training_note/model/user_info.dart';

///ユーザ登録の画面確認用のテストクラス
///後で削除予定
class TestViewPage extends StatefulWidget {
  const TestViewPage({Key? key}) : super(key: key);

  @override
  State<TestViewPage> createState() => _TestViewPageState();
}

class _TestViewPageState extends State<TestViewPage> {
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
            SizedBox(height: 50),
            ElevatedButton(
                onPressed: () {
                  dynamic result = Authentication.signUp(email: emailController.text, password: passwordController.text, name: "名前", gender: "男", birthDay: "20220416", passwordConfirm: passwordController.text);
                  print(result.name);
                  print(result.birthDay);
                  print(result.gender);
                  print(result.accountInfo);
                },
                child: const Text('アカウント作成')
            ),
          ],
        ),
      ),
    );
  }
}
