import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mycommerce/screens/register_screen/register_screen.dart';
import 'package:mycommerce/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mycommerce/screens/home_screen/home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = FirebaseAuth.instance;
  late String email;
  late String password;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: Stack(
            children: [Column(
              children: [
                Image.asset('assets/login_background.png'),
                Container(
                  color: CupertinoColors.lightBackgroundGray,
                ),
              ],
            ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 100.0),
                  child: Container(
                    constraints: BoxConstraints(
                      maxHeight: MediaQuery.of(context).size.height * 0.4,
                      maxWidth: MediaQuery.of(context).size.width * 0.85,
                    ),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8.0),
                      child: Column(
                        children: [
                          Text('Bem vindo!', style: TextStyle(
                              fontSize: 21
                          ),
                          ),
                          Divider(),
                          SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            height: 42,
                            child: TextField(
                              onChanged: (text) {
                                email = text;
                              },
                              decoration: kInputDecoration.copyWith(
                                  labelText: 'Email',
                                  hintText: 'store@mycommerce.com'
                              ),
                            ),
                          ),
                          kTextFieldSeparator,
                          SizedBox(
                            height: 42,
                            child: TextField(
                              onChanged: (text) {
                                password = text;
                              },
                                decoration: kInputDecoration.copyWith(
                                    labelText: 'Senha'
                                )
                            ),
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          SizedBox(
                            height: 42,
                            width: double.infinity,
                            child: TextButton.icon(
                              style: TextButton.styleFrom(
                                foregroundColor: Colors.white,
                                backgroundColor: Color(0xFF139C82),
                              ),
                              onPressed: () async {
                                try {
                                  final user = await _auth.signInWithEmailAndPassword(email: email, password: password);
                                  if(user != null){
                                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen()));
                                  }
                                } catch (e) {
                                  print('Login fail with error: $e');
                                }
                              },
                              icon: const Icon(Icons.input),
                              label: const Text('Fazer login'),
                            ),
                          ),
                          Spacer(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Ainda não possui uma conta?'),
                              TextButton(
                                onPressed: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterScreen()),);
                                }, child: Text(
                                'Cadastre-se',
                                style: TextStyle(
                                  color: Color(0xFF139C82),
                                ),
                              ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ]
        ),
      ),
    );
  }
}
