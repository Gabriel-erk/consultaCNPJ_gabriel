class Address {
  String street;
  String number;
  String district;
  String city;
  String state;
  String country;

  Address({
    required this.street,
    required this.number,
    required this.district,
    required this.city,
    required this.state,
    required this.country,
  });

  // Método para converter para JSON
  Map<String, dynamic> paraJson() {
    return {
      'street': street,
      'number': number,
      'district': district,
      'city': city,
      'state': state,
      'country': country,
    };
  }

  // Factory para criar um Address a partir de JSON
  factory Address.deJson(Map<String, dynamic> json) {
    return Address(
      street: json['street'],
      number: json['number'],
      district: json['district'],
      city: json['city'],
      state: json['state'],
    country: json['country']['name'] as String, // Pega o valor do nome do país
    );
  }
}
