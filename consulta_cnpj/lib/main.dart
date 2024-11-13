import 'package:consulta_cnpj/empresa.dart';
import 'package:consulta_cnpj/empresa_controller.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Busca CNPJ",
      theme: ThemeData(primarySwatch: Colors.blue),
      home: EmpresaScreen(),
    );
  }
}

class EmpresaScreen extends StatefulWidget {
  const EmpresaScreen({super.key});

  @override
  _EmpresaScreenState createState() => _EmpresaScreenState();
}

class _EmpresaScreenState extends State<EmpresaScreen> {
  final TextEditingController _cnpjController = TextEditingController();
  Empresa? _empresa;
  String _errorMessage = '';
  void _buscarEmpresa() async {
    final controller = EmpresaController();
    setState(() {
      _errorMessage = '';
    });
    try {
      final cnpj = _cnpjController.text;
      if (cnpj.isEmpty) {
        throw Exception("Por favor informe um CNPJ válido");
      }
      Empresa empresa = await controller.buscarEmpresa(cnpj);
      setState(() {
        _empresa = empresa;
      });
    } catch (e) {
      _errorMessage = e.toString();
      _empresa = null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Busca CNPJ"),
      ),
      body: Padding(
        padding:
            const EdgeInsets.all(16.0), // seta um padding em todos os lados
        child: Column(
          children: [
            TextField(
              controller: _cnpjController,
              decoration: const InputDecoration(
                labelText: "Informe o CNPJ",
                // coloca uma borda em volta do campo de textfield
                border: OutlineInputBorder(),
              ),
              // tipo do teclado para somente números
              keyboardType: TextInputType.number,
            ),
            // cria basixamente uma div com altura de 16px (uma forma diferente de colcoar um margin top no elevated button abaixo)
            const SizedBox(
              height: 16,
            ),
            ElevatedButton(
                onPressed: _buscarEmpresa, child: const Text('Buscar')),
            const SizedBox(
              height: 16,
            ),
            if (_errorMessage.isNotEmpty)
              Text(
                _errorMessage,
                style: const TextStyle(color: Colors.red),
              ),
            if (_empresa != null)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Razão Social: ${_empresa!.alias}'),
                  Text('Data de abertura: ${_empresa!.founded}'),
                  // Text('Logradouro: ${_empresa!.address.street}'),
                  Text('CEP: ${_empresa!.zip}'),
                  Text('Telefones: ${_empresa!.phones}'),
                  Text('E-mails: ${_empresa!.emails}'),
                  // Text('Sócios: ${_empresa!.emails}'),
                ],
              )
          ],
        ),
      ),
    );
  }
}
