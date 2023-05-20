import 'package:gais/models/models.dart';

abstract class BaseApiServices {
  Future<ApiReturnValue> get(String url, {Map<String, String>? headers});
  Future<ApiReturnValue> post(
    String url, {
    Map<String, String>? headers,
    Map<String, ApiReturnValue>? body,
  });
  Future<ApiReturnValue> put(
    String url, {
    Map<String, String>? headers,
    Map<String, ApiReturnValue>? body,
  });
  Future<ApiReturnValue> delete(String url, {Map<String, String>? headers});
}
