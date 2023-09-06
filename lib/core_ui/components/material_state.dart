// Flutter imports:
import 'package:flutter/material.dart';

class MaterialStatePropertyMapped<T> implements MaterialStateProperty<T> {
  final T defaultValue;
  final Map<MaterialState, T> mappedValues;

  const MaterialStatePropertyMapped(
    this.defaultValue,
    this.mappedValues,
  );

  @override
  T resolve(Set<MaterialState> states) {
    for (final mappedEntry in mappedValues.entries) {
      if (states.contains(mappedEntry.key)) {
        return mappedEntry.value;
      }
    }
    return defaultValue;
  }
}

typedef MaterialStatePropertyMappedColorNullable
    = MaterialStatePropertyMapped<Color?>;
