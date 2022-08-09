import 'dart:convert';

import 'package:http/http.dart' as http;

abstract class BaseRepository {
  Future<http.Response> post(
    String? url, {
    dynamic body,
    Map<String, String>? headers,
    Encoding? encoding,
  });

  Future<http.Response> get(
    String? url, {
    dynamic body,
    Map<String, String>? headers,
    Encoding? encoding,
  });

  Future<http.Response> put(
    String? url, {
    dynamic body,
    Map<String, String>? headers,
    Encoding? encoding,
  });

  Future<http.Response> patch(
    String? url, {
    dynamic body,
    Map<String, String>? headers,
    Encoding? encoding,
  });

  Future<http.Response> delete(
    String? url, {
    dynamic body,
    Map<String, String>? headers,
    Encoding? encoding,
  });
}
