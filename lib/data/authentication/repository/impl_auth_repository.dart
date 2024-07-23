import 'dart:convert';

import 'package:denari_app/data/authentication/model/login_model.dart';
import 'package:denari_app/data/authentication/model/reg_model.dart';
import 'package:denari_app/utils/env/config.dart';
import 'package:denari_app/utils/network/model/api_token.dart';
import 'package:denari_app/utils/network/utils/response_helper.dart';
import 'package:dio/dio.dart';

import 'auth_repository.dart';

final class ImplAuthRepository extends AuthRepository {
  final Dio _client;
  final Config _config;

  ImplAuthRepository({required Dio client, required Config config})
      : _client = client,
        _config = config;

  @override
  Future<ApiToken> login(LoginModel data) async {
    final result = await _client.get(
      '${_config.host}/login',
      data: data,
    );
    return result.item(ApiToken.fromJson);
  }

  @override
  Future<bool> register(RegModel data) async {
    final result = await _client.post(
      '${_config.host}/register',
      data: jsonEncode(data.toJson()),
    );
    return result.statusCode == 200;
  }

  @override
  Future<bool> verify(String phone) async {
    final result = await _client.post(
      '${_config.host}/verify',
      data: jsonEncode({'phone': phone}),
    );
    return result.statusCode == 200;
  }
}
