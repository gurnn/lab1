
import 'package:json_annotation/json_annotation.dart';

part 'driver_dto.g.dart';

@JsonSerializable(createToJson: false)
class DriverDto {
  final int id;
  final String fullName;
  final String phone;
  final String licenseCategory;
  final String carModel;
  final String carNumber;

  DriverDto({
    required this.id,
    required this.fullName,
    required this.phone,
    required this.licenseCategory,
    required this.carModel,
    required this.carNumber,
  });

  factory DriverDto.fromJson(Map<String, dynamic> json) =>
      _$DriverDtoFromJson(json);
}
