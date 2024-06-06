import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class _VendasScreen extends StatefulWidget {
  @override
  _VendasScreenState createState() => _VendasScreenState();
}

class _VendasScreenState extends State<_VendasScreen> {
  late Stream<double> _priceStream;
  StreamSubscription? _cancelSubscription; // Alterado o tipo para StreamSubscription

  @override
  void initState() {
    super.initState();
    _priceStream = Stream.periodic(
      const Duration(seconds: 3),
      (_) => Future.value(_getUpdatedPrice()), // Wrap in Future.value
    ).asyncMap((event) => event);

    _cancelSubscription = _priceStream.listen(null); // Atribuído a inscrição à variável _cancelSubscription
  }

  Future<double> _getUpdatedPrice() async {
    try {
      final response = await http.get(Uri.parse('http://sua_api.com/precos'));
      if (response.statusCode == 200) {
        final price = double.parse(response.body);
        return price;
      } else {
        throw Exception(
            'Falha ao obter preço: Código de status ${response.statusCode}');
      }
    } catch (error) {
      if (kDebugMode) {
        print('Erro ao obter preço: $error');
      }
      return 0.0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Vendas'),
      ),
      body: Center(
        child: StreamBuilder<double>(
          stream: _priceStream,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final price = snapshot.data!;
              return Text(
                'Preço atual: \$${price.toStringAsFixed(2)}',
                style: const TextStyle(fontSize: 24),
              );
            } else if (snapshot.hasError) {
              return const Text(
                'Erro ao obter preço',
                style: TextStyle(fontSize: 24, color: Colors.red),
              );
            } else {
              return const CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _cancelSubscription?.cancel(); // Cancela a inscrição quando o widget é descartado
    super.dispose();
  }
}