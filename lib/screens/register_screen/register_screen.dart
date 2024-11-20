import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mycommerce/constants.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFAECCC4),
        title: Text('myCommerce'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Cadastre-se agora mesmo!', style: TextStyle(
              color: Color(0xFF139C82),
              fontSize: 21,
              fontWeight: FontWeight.bold,
            ),
            ),
            Divider(),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 42,
              child: TextField(
                decoration: kInputDecoration.copyWith(
                    labelText: 'Seu Nome'
                ),
              ),
            ),
            kTextFieldSeparator,
            SizedBox(
              height: 42,
              child: TextField(
                decoration: kInputDecoration.copyWith(
                    labelText: 'Nome do Comércio'
                ),
              ),
            ),
            kTextFieldSeparator,
            SizedBox(
              height: 42,
              child: TextField(
                decoration: kInputDecoration.copyWith(
                    labelText: 'Email'
                ),
              ),
            ),
            kTextFieldSeparator,
            SizedBox(
              height: 42,
              child: TextField(
                decoration: kInputDecoration.copyWith(
                    labelText: 'Senha'
                ),
              ),
            ),
            kTextFieldSeparator,
            SizedBox(
              height: 42,
              child: TextField(
                decoration: kInputDecoration.copyWith(
                    labelText: 'Confirmar senha'
                ),
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
                onPressed: () {},
                icon: const Icon(Icons.input),
                label: const Text('Finalizar cadastro'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
