// Copyright (c) 2017, the Dart project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:json_annotation/json_annotation.dart';

part 'patient.g.dart';

@JsonSerializable()
class Patient {
  String? name;
  String? age;
  String? phone;
  String? email;
  String? history;
  String? picture;
  String? gender;
  Patient(
      {this.name,
      this.age,
      this.phone,
      this.email,
      this.picture,
      this.gender,
      this.history});

  /// Connect the generated [_$PersonFromJson] function to the `fromJson`
  /// factory.
  factory Patient.fromJson(Map<String, dynamic> json) =>
      _$PatientFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$PatientToJson(this);
}
