// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'send_code_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SendCodeRequestImpl _$$SendCodeRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$SendCodeRequestImpl(
      username: json['username'] as String,
    );

Map<String, dynamic> _$$SendCodeRequestImplToJson(
        _$SendCodeRequestImpl instance) =>
    <String, dynamic>{
      'username': instance.username,
    };

_$SendCodeResponseImpl _$$SendCodeResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$SendCodeResponseImpl(
      code: json['code'] as String?,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$$SendCodeResponseImplToJson(
        _$SendCodeResponseImpl instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
    };
