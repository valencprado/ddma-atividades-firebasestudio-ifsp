import 'package:json_annotation/json_annotation.dart';
import 'package:myapp/models/address.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  int? id;
  String? name;
  String? username;
  String? email;
  Address? address;

  User(this.id, this.name, this.username, this.email, this.address);

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);

  @override
  String toString() {
    return 'User{id: $id, name: $name, username: $username, email: $email, address: $address}';
  }
}
