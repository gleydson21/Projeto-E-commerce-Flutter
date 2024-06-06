import 'package:http/http.dart' as http;

class APIService {
  static const String _baseUrl = 'http://seu_servidor.com/api';

  static Future<String> getData() async {
    try {
      // ignore: prefer_interpolation_to_compose_strings
      final response = await http.get(Uri.parse(_baseUrl + '/endpoint'));
      
      if (response.statusCode == 200) {
        return response.body; // Retorna os dados recebidos do servidor
      } else {
        return 'Erro na requisição';
      }
    } catch (e) {
      return 'Erro de conexão: $e';
    }
  }
  
  static Future<String> postData(Map<String, dynamic> data) async {
    try {
      final response = await http.post(
        // ignore: prefer_interpolation_to_compose_strings
        Uri.parse(_baseUrl + '/endpoint'),
        body: data,
      );
      
      if (response.statusCode == 201) {
        return 'Dados enviados com sucesso';
      } else {
        return 'Erro na requisição';
      }
    } catch (e) {
      return 'Erro de conexão: $e';
    }
  }
  
  // Adicione outras funções relevantes para as operações de API
  
}