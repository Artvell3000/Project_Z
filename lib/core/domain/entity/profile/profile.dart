import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile.freezed.dart';
part 'profile.g.dart';

@freezed
class Profile with _$Profile {
  const factory Profile({
    String? surname,
    @JsonKey(name: 'phone_first_num') String? phoneFirstNum,
    @JsonKey(name: 'phone_last_num') String? phoneLastNum,
    String? city,
    String? district,
  }) = _Profile;

  factory Profile.fromJson(Map<String, dynamic> json) =>
      _$ProfileFromJson(json);
}