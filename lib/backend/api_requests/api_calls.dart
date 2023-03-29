import 'dart:convert';
import 'dart:typed_data';

import '../../flutter_flow/flutter_flow_util.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class GetAddressByCepCall {
  static Future<ApiCallResponse> call({
    String? cep = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'get address by cep',
      apiUrl: 'https://viacep.com.br/ws/${cep}/json/',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic postalCode(dynamic response) => getJsonField(
        response,
        r'''$.cep''',
      );
  static dynamic street(dynamic response) => getJsonField(
        response,
        r'''$.logradouro''',
      );
  static dynamic stateCode(dynamic response) => getJsonField(
        response,
        r'''$.uf''',
      );
  static dynamic city(dynamic response) => getJsonField(
        response,
        r'''$.localidade''',
      );
  static dynamic neighborhood(dynamic response) => getJsonField(
        response,
        r'''$.bairro''',
      );
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar) {
  jsonVar ??= {};
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return '{}';
  }
}
