import 'dart:convert';

import 'package:event_driver_arch/app/models/config.dart';

class ConfigMapper extends Config {
  ConfigMapper({required super.keepConnected});

  String encode() => json.encode({
        'keepConnected': keepConnected,
      });

  factory ConfigMapper.decode(String encoded) {
    final data = json.decode(encoded);
    return ConfigMapper(keepConnected: data['keepConnected']);
  }

  static ConfigMapper fromEntity(config) {
    return ConfigMapper(keepConnected: config.keepConnected);
  }
}
