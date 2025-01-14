import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mycommerce/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mycommerce/controller/users_data.dart';
import 'package:mycommerce/models/user_model.dart';
import 'package:mycommerce/screens/home_screen/home_screen.dart';
import 'package:mycommerce/screens/login_screen/login_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final formKey = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;
  UserModel user = UserModel();
  late String password;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          foregroundColor: kAppBarTitleColor,
          backgroundColor: kSecondaryColor,
          title: Text('myCommerce'),
        ),
        body: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Cadastre-se agora mesmo!', style: TextStyle(
                  color: kSecondaryColor,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
                ),
                Divider(),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  minLines: 1,
                  decoration: kInputDecoration.copyWith(
                    labelText: 'Seu Nome',
                    hintText: 'John'
                  ),
                  textInputAction: TextInputAction.next,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Insira um nome válido';
                    } else {
                      user.userName = value;
                      return null;
                    }
                  },
                ),
                kTextFieldSeparator,
                TextFormField(
                  decoration: kInputDecoration.copyWith(
                    labelText: 'Nome do Comércio',
                    hintText: 'Nolas Store'
                  ),
                  textInputAction: TextInputAction.next,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (text) {
                    if (text == null || text.isEmpty) {
                      return 'Insira um nome válido';
                    } else {
                      user.commerceName = text;
                      return null;
                    }
                  },
                ),
                kTextFieldSeparator,
                TextFormField(
                  decoration: kInputDecoration.copyWith(
                    labelText: 'Email',
                    hintText: 'john@store.com'
                  ),
                  textInputAction: TextInputAction.next,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (text) {
                    if (text == null || text.isEmpty) {
                      return 'Insira um email válido';
                    } else {
                      user.userEmail = text;
                      return null;
                    }
                  },
                ),
                kTextFieldSeparator,
                TextFormField(
                  decoration: kInputDecoration.copyWith(
                    labelText: 'Senha',
                    hintText: 'Senha@1234'
                  ),
                  obscureText: true,
                  textInputAction: TextInputAction.next,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (text) {
                    if (text == null || text.isEmpty) {
                      return 'Insira uma senha válida';
                    } else {
                      password = text;
                      return null;
                    }
                  },
                ),
                kTextFieldSeparator,
                TextFormField(
                  decoration: kInputDecoration.copyWith(
                      labelText: 'Confirmar senha',
                      hintText: 'Senha@1234'
                  ),
                  obscureText: true,
                  textInputAction: TextInputAction.next,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (text) {
                    if ((text == null || text.isEmpty) || text != password) {
                      return 'As senhas não correspondem';
                    } else {
                      return null;
                    }
                  },
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
                      backgroundColor: kSecondaryColor,
                    ),
                    onPressed: () async {
                      final form = formKey.currentState!;
                      if(form.validate()) {
                        final newUser = await _auth.createUserWithEmailAndPassword(
                          email: user.userEmail!,
                          password: password,
                        );
                        if(newUser != null){
                          print(user.userEmail);
                          user.userUID = newUser.user!.uid;
                          user.commerceGroupCode = [newUser.user!.uid];
                          UsersData().registerOwnerUser(user);
                          Navigator.pop(context);
                        }
                      }
                    },
                    icon: const Icon(Icons.input),
                    label: const Text('Finalizar cadastro'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
