// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Donor {
  final String name;
  final String district;
  final String address;
  final String? id;

  final String phoneNumber;
  final String age;
  final String bloodGroup;

  Donor({
    this.id,
    required this.name,
    required this.district,
    required this.address,
    required this.phoneNumber,
    required this.age,
    required this.bloodGroup,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'district': district,
      'address': address,
      'phoneNumber': phoneNumber,
      'age': age,
      'bloodGroup': bloodGroup,
      'id': id
    };
  }

  factory Donor.fromMap(Map<String, dynamic> map) {
    return Donor(
      id: map['_id'] ?? '',
      name: map['name'] ?? '',
      district: map['district'] ?? '',
      address: map['address'] ?? '',
      phoneNumber: map['phoneNumber'] ?? '',
      age: map['age'] ?? '',
      bloodGroup: map['bloodGroup'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Donor.fromJson(String source) =>
      Donor.fromMap(json.decode(source));
       

}
