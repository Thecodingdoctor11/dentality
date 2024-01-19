// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patient.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Patient _$PatientFromJson(Map<String, dynamic> json) => Patient(
      name: json['name'] as String?,
      age: json['age'] as String?,
      phone: json['phone'] as String?,
      email: json['email'] as String?,
      picture: json['picture'] as String?,
      gender: json['gender'] as String?,
      history: json['history'] as String?,
    );

Map<String, dynamic> _$PatientToJson(Patient instance) => <String, dynamic>{
      'name': instance.name,
      'age': instance.age,
      'phone': instance.phone,
      'email': instance.email,
      'history': instance.history,
      'picture': instance.picture,
      'gender': instance.gender,
    };
