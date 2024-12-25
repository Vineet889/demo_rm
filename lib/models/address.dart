class Address {
  final String line1;
  final String line2;
  final String city;
  final String district;
  final String country;
  final String postCode;

  Address({
    required this.line1,
    required this.line2,
    required this.city,
    required this.district,
    required this.country,
    required this.postCode,
  });

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      line1: json['Line1'] ?? '',
      line2: json['Line2'] ?? '',
      city: json['City'] ?? '',
      district: json['AdminAreaName'] ?? '',
      country: json['CountryName'] ?? '',
      postCode: json['PostalCode'] ?? '',
    );
  }
} 