import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
part 'model_person_list_response.g.dart';

@JsonSerializable()
@HiveType(typeId: 0)
class ModelEmployeeData extends HiveObject {
  @JsonKey(name: 'id')
  @HiveField(0)
  int? id;

  @JsonKey(name: 'name')
  @HiveField(1)
  String? name;

  @JsonKey(name: 'username')
  @HiveField(2)
  String? username;

  @JsonKey(name: 'email')
  @HiveField(3)
  String? email;

  @JsonKey(name: 'profile_image')
  @HiveField(4)
  String? profileImage;

  @JsonKey(name: 'address')
  @HiveField(5)
  Address? address;

  @JsonKey(name: 'phone')
  @HiveField(6)
  String? phone;

  @JsonKey(name: 'website')
  @HiveField(7)
  String? website;

  @JsonKey(name: 'company')
  @HiveField(8)
  Company? company;

  ModelEmployeeData({
    this.id,
    this.name,
    this.username,
    this.email,
    this.profileImage,
    this.address,
    this.phone,
    this.website,
    this.company,
  });

  factory ModelEmployeeData.fromJson(Map<String, dynamic> json) {
    return _$ModelEmployeeDataFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ModelEmployeeDataToJson(this);
}

@JsonSerializable()
@HiveType(typeId: 1)
class Geo {
  @JsonKey(name: 'lat')
  @HiveField(0)
  String? lat;

  @JsonKey(name: 'lng')
  @HiveField(1)
  String? lng;

  Geo({this.lat, this.lng});

  factory Geo.fromJson(Map<String, dynamic> json) => _$GeoFromJson(json);

  Map<String, dynamic> toJson() => _$GeoToJson(this);
}

@JsonSerializable()
@HiveType(typeId: 2)
class Company {
  @JsonKey(name: 'name')
  @HiveField(0)
  String? name;

  @JsonKey(name: 'catchPhrase')
  @HiveField(1)
  String? catchPhrase;

  @JsonKey(name: 'bs')
  @HiveField(2)
  String? bs;

  Company({this.name, this.catchPhrase, this.bs});

  factory Company.fromJson(Map<String, dynamic> json) {
    return _$CompanyFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CompanyToJson(this);
}

@JsonSerializable()
@HiveType(typeId: 3)
class Address {
  @JsonKey(name: 'street')
  @HiveField(0)
  String? street;

  @JsonKey(name: 'suite')
  @HiveField(1)
  String? suite;

  @JsonKey(name: 'city')
  @HiveField(2)
  String? city;

  @JsonKey(name: 'zipcode')
  @HiveField(3)
  String? zipcode;

  @JsonKey(name: 'geo')
  @HiveField(4)
  Geo? geo;

  Address({this.street, this.suite, this.city, this.zipcode, this.geo});

  factory Address.fromJson(Map<String, dynamic> json) {
    return _$AddressFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AddressToJson(this);
}
