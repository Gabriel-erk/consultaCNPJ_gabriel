import 'package:consulta_cnpj/address.dart';

class Empresa {
  String alias;
  String founded;
  String
      address; // endereço vai retornar varios campos, como a rua, numero, bairro...
  String zip;
  String phones;
  String emails;
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
      'address': address, // chamando dentro de paraJson de empresa o paraJson de Adress para converter o objeto address para json (pois é instanciado por outra classe)
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
      address: [
        'adress'
      ]['street'], 
      zip: json['zip'],
      phones: json['phones'], // Converte para List<String>
      emails: json['emails'],
      company: json['company'],
      sideActivities: json['sideActivities'],
    );
  }
}
