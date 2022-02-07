import 'package:flutter/material.dart';
import 'package:shared_preference/services/shared_preference.dart';
import 'package:shared_preference/pages/user_model.dart';

class HomePage extends StatefulWidget {
  static const String id = "home_page";

  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void _doLogin(){
    String email = emailController.text.toString().trim();
    String password = passwordController.text.toString().trim();
    User user = User.from(email: email, password: password);
    Prefs.storeUser(user);
  }

  void _loadUser() async{
    var user = await Prefs.loadUser();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(user!.toJson().toString())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.zero,
                  filled: true,
                  fillColor: Colors.grey.shade200,
                  prefixIcon: const Icon(
                    Icons.email,
                    color: Colors.blue,
                  ),
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(50))),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.zero,
                  filled: true,
                  fillColor: Colors.grey.shade200,
                  prefixIcon: const Icon(
                    Icons.lock,
                    color: Colors.blue,
                  ),
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(50))),
            ),
            const SizedBox(
              height: 10,
            ),
            MaterialButton(
              onPressed: () {
                _doLogin();
              },
              height: 50,
              shape: const StadiumBorder(),
              color: Colors.blue,
              child: const Text(
                "Login",
                style: TextStyle(color: Colors.white),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
