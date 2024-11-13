import 'dart:convert';
import 'empresa.dart';
import 'package:http/http.dart' as http;

class EmpresaController {
  Future<Empresa> buscarEmpresa(String cnpj) async {
    final url = Uri.parse('https://open.cnpja.com/office/$cnpj');
    final resposta = await http.get(url);
    print(resposta.statusCode);
    if (resposta.statusCode == 200) {
      Map<String, dynamic> cnpj = jsonDecode(resposta.body);
      if (cnpj.containsKey('erro') && cnpj['erro'] == 'true') {
        throw Exception("CNPJ não encontrado");
      }
      return Empresa.deJson(cnpj);
    } else {
      throw Exception("Erro na busca da empresa: ${resposta.statusCode}");
    }
  }
}
