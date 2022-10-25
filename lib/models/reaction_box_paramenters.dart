// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';

class ReactionBoxParamenters {
  final double iconSize;
  final double iconSpacing;
  final double paddingHorizontal;
  final double radiusBox;
  final int quantityPerPage;
  final Brightness brightness;
  ReactionBoxParamenters({
    this.iconSize = 20,
    this.iconSpacing = 8,
    this.paddingHorizontal = 16,
    this.radiusBox = 10,
    this.quantityPerPage = 5,
    this.brightness = Brightness.light,
  });

  ReactionBoxParamenters copyWith({
    double? iconSize,
    double? iconSpacing,
    double? paddingHorizontal,
  }) {
    return ReactionBoxParamenters(
      iconSize: iconSize ?? this.iconSize,
      iconSpacing: iconSpacing ?? this.iconSpacing,
      paddingHorizontal: paddingHorizontal ?? this.paddingHorizontal,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'iconSize': iconSize,
      'iconSpacing': iconSpacing,
      'paddingHorizontal': paddingHorizontal,
    };
  }

  factory ReactionBoxParamenters.fromMap(Map<String, dynamic> map) {
    return ReactionBoxParamenters(
      iconSize: map['iconSize'] as double,
      iconSpacing: map['iconSpacing'] as double,
      paddingHorizontal: map['paddingHorizontal'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory ReactionBoxParamenters.fromJson(String source) =>
      ReactionBoxParamenters.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'ReactionBoxParamenters(iconSize: $iconSize, iconSpacing: $iconSpacing, paddingHorizontal: $paddingHorizontal)';

  @override
  bool operator ==(covariant ReactionBoxParamenters other) {
    if (identical(this, other)) return true;

    return other.iconSize == iconSize &&
        other.iconSpacing == iconSpacing &&
        other.paddingHorizontal == paddingHorizontal;
  }

  @override
  int get hashCode =>
      iconSize.hashCode ^ iconSpacing.hashCode ^ paddingHorizontal.hashCode;

  // Calculator
  double get reactionBoxHeight => iconSize + iconSpacing * 2 + 20.0;

  double get reactionBoxWidth =>
      (iconSize + iconSpacing * 2) * quantityPerPage + paddingHorizontal * 2;
}
