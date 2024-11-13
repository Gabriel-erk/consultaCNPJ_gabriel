import 'package:consulta_cnpj/address.dart';

class Empresa {
  String alias;
  String founded;
  Address
      address; // endereço vai retornar varios campos, como a rua, numero, bairro...
  String zip;
  List<String> phones;
  List<String> emails;
  String company; // mesmo caso de endereço
  String sideActivities; // mesmo caso de endereço

  Empresa({
    required this.alias,
    required this.founded,
    required this.address,
    required this.zip,
    required this.phones,
    required this.emails,
    required this.company,
    required this.sideActivities,
  });

  Map<String, dynamic> paraJson() {
    return {
      'alias': alias,
      'founded': founded,
      'address': address
          .paraJson(), // chamando dentro de paraJson de empresa o paraJson de Adress para converter o objeto address para json (pois é instanciado por outra classe)
      'zip': zip,
      'phones': phones,
      'emails': emails,
      'company': company,
      'sideActivities': sideActivities,
    };
  }

  factory Empresa.deJson(Map<String, dynamic> json) {
    return Empresa(
      alias: json['alias'],
      founded: json['founded'],
      address: Address.deJson(
          json['address']), // transformando o mapa address em um objeto Address
      zip: json['zip'],
      phones: List<String>.from(json['phones']), // Converte para List<String>
      emails: List<String>.from(json['emails']),
      company: json['company'],
      sideActivities: json['sideActivities'],
    );
  }
}
