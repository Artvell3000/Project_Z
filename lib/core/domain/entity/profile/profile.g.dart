// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProfileImpl _$$ProfileImplFromJson(Map<String, dynamic> json) =>
    _$ProfileImpl(
      surname: json['surname'] as String?,
      phoneFirstNum: json['phone_first_num'] as String?,
      phoneLastNum: json['phone_last_num'] as String?,
      city: json['city'] as String?,
      district: json['district'] as String?,
    );

Map<String, dynamic> _$$ProfileImplToJson(_$ProfileImpl instance) =>
    <String, dynamic>{
      'surname': instance.surname,
      'phone_first_num': instance.phoneFirstNum,
      'phone_last_num': instance.phoneLastNum,
      'city': instance.city,
      'district': instance.district,
    };
