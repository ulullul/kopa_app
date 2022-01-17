import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_app_example/src/core/data/to_json_interface.dart';
import 'package:flutter_app_example/src/core/define.dart';

Future<String> _toJsonObjIsolatedEntry(ToJsonInterface entity) async {
  return jsonEncode(entity.toJson());
}

Future<String> _toJsonObjIsolatedList(List<ToJsonInterface> entities) async {
  List<Json> list = [];
  for (int i = 0; i < entities.length; ++i) {
    list.add(entities[i].toJson());
  }
  return jsonEncode(list);
}

Future<String> jsonEncodeIsolatedObj(ToJsonInterface data) async {
  return await compute(_toJsonObjIsolatedEntry, data);
}

Future<String> jsonEncodeIsolatedList(List<ToJsonInterface> data) async {
  return await compute(_toJsonObjIsolatedList, data);
}

Future<Json> _fromJsonIsolatedEntry(String json) async {
  return jsonDecode(json);
}

Future<List<Json>> _fromJsonIsolatedList(String json) async {
  return (jsonDecode(json) as List<dynamic>).cast<Json>();
}

Future<Json> jsonDecodeIsolatedObj(String json) async {
  return await compute(_fromJsonIsolatedEntry, json);
}

Future<List<Json>> jsonDecodeIsolatedList(String json) async {
  return await compute(_fromJsonIsolatedList, json);
}
