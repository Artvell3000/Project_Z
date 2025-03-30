// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_code.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VerifyCodeRequestImpl _$$VerifyCodeRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$VerifyCodeRequestImpl(
      username: json['username'] as String,
      code: json['code'] as String,
    );

Map<String, dynamic> _$$VerifyCodeRequestImplToJson(
        _$VerifyCodeRequestImpl instance) =>
    <String, dynamic>{
      'username': instance.username,
      'code': instance.code,
    };

_$VerifyCodeResponseImpl _$$VerifyCodeResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$VerifyCodeResponseImpl(
      access: json['access'] as String,
      refresh: json['refresh'] as String,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$$VerifyCodeResponseImplToJson(
        _$VerifyCodeResponseImpl instance) =>
    <String, dynamic>{
      'access': instance.access,
      'refresh': instance.refresh,
      'message': instance.message,
    };
