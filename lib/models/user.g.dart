// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) =>
    User(
        (json['id'] as num?)?.toInt(),
        json['name'] as String?,
        json['username'] as String?,
        json['email'] as String?,
        json['address'] == null
            ? null
            : Address.fromJson(json['address'] as Map<String, dynamic>),
        json['company'] == null
            ? null
            : Company.fromJson(json['company'] as Map<String, dynamic>),
      )
      ..phone = json['phone'] as String?
      ..website = json['website'] as String?;

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'username': instance.username,
  'email': instance.email,
  'address': instance.address,
  'phone': instance.phone,
  'website': instance.website,
  'company': instance.company,
};
