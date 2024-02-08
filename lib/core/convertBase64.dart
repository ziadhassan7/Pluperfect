import 'dart:convert';

String getBase64(Map parameters){
  final json = jsonEncode(parameters);
  final bytes = utf8.encode(json);
  return base64.encode(bytes);
}