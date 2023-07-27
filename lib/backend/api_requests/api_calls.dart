import 'dart:convert';
import 'dart:typed_data';

import '../../flutter_flow/flutter_flow_util.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class MiFotoDelDiaCall {
  static Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'miFotoDelDia',
      apiUrl: 'https://api.nasa.gov/planetary/apod',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'api_key': "4ZGt2mzwAQnbPH0mwqqqYVoPivpuFrrP56w8F6qK",
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic derechos(dynamic response) => getJsonField(
        response,
        r'''$.copyright''',
      );
  static dynamic fecha(dynamic response) => getJsonField(
        response,
        r'''$.date''',
      );
  static dynamic explicacion(dynamic response) => getJsonField(
        response,
        r'''$.explanation''',
      );
  static dynamic titulo(dynamic response) => getJsonField(
        response,
        r'''$.title''',
      );
  static dynamic imagen(dynamic response) => getJsonField(
        response,
        r'''$.url''',
      );
}

class FotoDeUnDiaCall {
  static Future<ApiCallResponse> call({
    String? startDate = '',
    String? endDate = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'FotoDeUnDia',
      apiUrl: 'https://api.nasa.gov/planetary/apod',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'api_key': "4ZGt2mzwAQnbPH0mwqqqYVoPivpuFrrP56w8F6qK",
        'start_date': startDate,
        'end_date': endDate,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic derechos(dynamic response) => getJsonField(
        response,
        r'''$.copyright''',
      );
  static dynamic fecha(dynamic response) => getJsonField(
        response,
        r'''$.date''',
      );
  static dynamic explicacion(dynamic response) => getJsonField(
        response,
        r'''$.explanation''',
      );
  static dynamic titulo(dynamic response) => getJsonField(
        response,
        r'''$.title''',
      );
  static dynamic imagen(dynamic response) => getJsonField(
        response,
        r'''$.url''',
      );
}

class PokemonAPiCall {
  static Future<ApiCallResponse> call({
    String? namepkmn = 'Rowlet',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'PokemonAPi',
      apiUrl: 'https://pokeapi.co/api/v2/pokemon/${namepkmn}',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic name(dynamic response) => getJsonField(
        response,
        r'''$.forms[:].name''',
      );
  static dynamic experience(dynamic response) => getJsonField(
        response,
        r'''$.base_experience''',
      );
  static dynamic weight(dynamic response) => getJsonField(
        response,
        r'''$.weight''',
      );
  static dynamic image(dynamic response) => getJsonField(
        response,
        r'''$.sprites.front_default''',
      );
}

class MarsNASACall {
  static Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'MarsNASA',
      apiUrl: 'https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'api_key': "4ZGt2mzwAQnbPH0mwqqqYVoPivpuFrrP56w8F6qK",
        'sol': "1000",
        'camera': "fhaz",
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
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

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return isList ? '[]' : '{}';
  }
}
