import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SignForm extends StatefulWidget {
  const SignForm({Key? key}) : super(key: key);

  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _email = '';
  String _password = '';

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            onSaved: (value) => _email = value!,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your email';
              }
              return null;
            },
            decoration: const InputDecoration(
              labelText: 'Email',
              hintText: 'Enter your email',
            ),
          ),
          const SizedBox(height: 16),
          TextFormField(
            obscureText: true,
            onSaved: (value) => _password = value!,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your password';
              }
              return null;
            },
            decoration: const InputDecoration(
              labelText: 'Password',
              hintText: 'Enter your password',
            ),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () async {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();

                // Chamar a API em C# passando os dados (_email e _password)
                String apiUrl = "http://sua_api.com/validar_login";

                // Montar os parâmetros da requisição
                Map<String, String> requestHeaders = {
                  'Content-Type': 'application/json',
                };
                Map<String, dynamic> requestBody = {
                  'email': _email,
                  'password': _password,
                };

                // Fazer a requisição HTTP
                http.Response response = await http.post(
                  Uri.parse(apiUrl),
                  headers: requestHeaders,
                  body: jsonEncode(requestBody),
                );

                // Verificar o resultado da requisição
                if (response.statusCode == 200) {
                  // Resposta da API retornou status 200 (OK)
                  // Faça algo com a resposta (ex: redirecionar para outra tela)
                } else {
                  // Resposta da API retornou um erro
                  // Exiba uma mensagem de erro para o usuário
                }
              }
            },
            child: const Text('Submit'),
          ),
        ],
      ),
    );
  }
}
