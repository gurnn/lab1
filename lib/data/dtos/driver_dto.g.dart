// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'driver_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DriverDto _$DriverDtoFromJson(Map<String, dynamic> json) => DriverDto(
  id: (json['id'] as num).toInt(),
  fullName: json['fullName'] as String,
  phone: json['phone'] as String,
  licenseCategory: json['licenseCategory'] as String,
  carModel: json['carModel'] as String,
  carNumber: json['carNumber'] as String,
);
