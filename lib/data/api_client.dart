import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:digitifyze/utils/import_utils.dart';

class ApiClient {
  ApiClient();

  Map<String, String> createHeaders({
    required String authToken,

    bool isMultipart = false,
  }) {
    log("authToken is=-=- $authToken");

    final headers = <String, String>{


        "Content-Type": "application/json",
      if (authToken != "") "Authorization": "Bearer $authToken",    };

    return headers;
  }

  Future<T?> postData<T>({
    required Uri uri,
    required var headers,
    required var body,
    required T Function(dynamic data) builder,
  }) async {
    try {
      debugPrint("_postData URL=-=-=-=-::: $uri");
      debugPrint("_postData headers=-=-=-=-::: $headers");
      debugPrint("_postData body=-=-=-=-::: $body");
      var request = http.Request('POST', uri);
      request.body =  json.encode(body);
      debugPrint('_postData $uri body ${request.body}');
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      final responseString = await response.stream.bytesToString();
      log('response.statusCode is ${response.statusCode}');

      log("response is=-=- $uri $responseString");
      dynamic map = json.decode(responseString);
      if (response.statusCode == 200 ||
          response.statusCode == 201 ||
          response.statusCode == 202) {
        log("response statusCode is=-=-$responseString");
        return builder(responseString);
      } else {
        DialogServiceV1().showToast(
            content: map["error"] ??
                map["message"] ??
                response.reasonPhrase.toString());
        return builder(responseString);
      }
    } catch (e) {
      DialogServiceV1().showToast(content: e.toString(),    hasError: true,);
    }
    return null;
  }
  Future<T?> postBodyStringData<T>({
    required Uri uri,
    required Map<String, String> headers,
    required String body, // Should be a string
    required T Function(dynamic data) builder,
  }) async {
    try {
      log("_postData URL: $uri");
      log("_postData headers: $headers");
      log("_postData body: $body");

      var request = http.Request('POST', uri);
      request.body = body; // Raw body (not JSON encoded)
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      final responseString = await response.stream.bytesToString();
      log('response.statusCode: ${response.statusCode}');
      log("response body: $responseString");

      if (response.statusCode >= 200 && response.statusCode < 300) {
        return builder(responseString);
      } else {
        DialogServiceV1().showToast(
          content: json.decode(responseString)["error"] ?? response.reasonPhrase.toString(),
        );
        return null;
      }
    } catch (e) {
      DialogServiceV1().showToast(content: e.toString(),    hasError: true,);
      return null;
    }
  }

  Future<T?> getData<T>({
    required Uri uri,
    required var headers,
    required T Function(dynamic data) builder,
  }) async {
    try {
      log("_getData URL=-=-=-=-::: $uri");
      log("_getData headers=-=-=-=-::: $headers");
      var request = http.Request('GET', uri);
      log('_getData $uri body ${request.body}');
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      final responseString = await response.stream.bytesToString();
      log(
          'response.statusCode is $uri ${response.statusCode} $responseString');

      dynamic map = json.decode(responseString);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return builder(responseString);
      } else {
        if (!uri.toString().contains("get-design-token")) {
          DialogServiceV1().showToast(
              content: map["error"] ??
                  map["message"] ??
                  response.reasonPhrase.toString());
        }
        return builder(responseString);
      }
    } catch (e) {
      DialogServiceV1().showToast(content: e.toString(),    hasError: true,);
    }
    return null;
  }
  Future<T?> getDatBody<T>({
    required Uri uri,
    required Map<String, String> headers,
    Map<String, dynamic>? body, // Optional JSON body for GET requests
    required T Function(dynamic data) builder,
  }) async {
    try {
      log("_getData URL=-=-=-=-::: $uri");
      log("_getData headers=-=-=-=-::: $headers");

      var request = http.Request('GET', uri);
      request.headers.addAll(headers);

      // If body is provided, encode it as JSON
      if (body != null) {
        request.body = jsonEncode(body);
        log("_getData Body=-=-=-=-::: ${request.body}");
      }

      http.StreamedResponse response = await request.send();
      final responseString = await response.stream.bytesToString();
      log('Response.statusCode is $uri ${response.statusCode} $responseString');

      dynamic map = json.decode(responseString);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return builder(responseString);
      } else {
        if (!uri.toString().contains("get-design-token")) {
          DialogServiceV1().showToast(
            content: map["error"] ?? map["message"] ?? response.reasonPhrase.toString(),
          );
        }
        return builder(responseString);
      }
    } catch (e) {
      DialogServiceV1().showToast(content: e.toString(), hasError: true);
    }
    return null;
  }
  Future<T?> putData<T>({
    required Uri uri,
    required var headers,
    required var body,
    required T Function(dynamic data) builder,
  }) async {
    try {
      log("_putData URL=-=-=-=-::: $uri");
      log("_putData headers=-=-=-=-::: $headers");
      log("_putData body=-=-=-=-::: $body");
      var request = http.Request('PUT', uri);
      request.body = json.encode(body);
      log('_putData $uri body ${request.body}');
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      final responseString = await response.stream.bytesToString();
      log('response.statusCode is ${response.statusCode}');

      log("response is=-=- $uri $responseString");
      dynamic map = json.decode(responseString);
      if (response.statusCode == 200 ||
          response.statusCode == 201 ||
          response.statusCode == 202) {
        log("response statusCode is=-=-$responseString");
        return builder(responseString);
      } else {
        DialogServiceV1().showToast(
            content: map["error"] ??
                map["message"] ??
                response.reasonPhrase.toString());
        return null;
      }
    } catch (e) {
      DialogServiceV1().showToast(content: e.toString(),    hasError: true,);
    }
    return null;
  }


  Future<T?> multipartData<T>({
    required Uri uri,
    required var headers,
    required var body,
    required T Function(dynamic data) builder,
    required var imageparam,
    required var imagepath,
  }) async {
    try {
      log("_multipartData URL=-=-=-=-::: $uri");
      log("_multipartData headers=-=-=-=-::: $headers");
      log("_multipartData body=-=-=-=-::: $body");
      var request = http.MultipartRequest('POST', uri);
      request.fields.addAll(body);
      log('_multipartData $uri body ${request.fields}');
      if (imageparam != "" && imagepath != "") {
        log("_multipartData object files");
        request.files
            .add(await http.MultipartFile.fromPath(imageparam, imagepath));
      }
      request.headers.addAll(headers);
      http.StreamedResponse response = await request.send();
      final responseString = await response.stream.bytesToString();
      log('response.statusCode is ${response.statusCode} ------- ${uri} -------');
      log("response is=-=-$uri $responseString -----");
      Map<String, dynamic> map = json.decode(responseString);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return builder(responseString);
      } else {
        DialogServiceV1().showToast(
            hasError: true,
            content: map["message"] ?? response.reasonPhrase.toString(),);
        log("response.reasonPhrase=-=- ${response.reasonPhrase} ");
        return null;
      }
    } catch (e, s) {
      log("Exception is =-=-6 $e $s");
      DialogServiceV1().showToast(
          hasError: true,
          content: e.toString(),);
      return null;
    }
  }

  Future<T?> multiImagemultiParamPartData<T>({
    required Uri uri,
    required var headers,
    required var body,
    required T Function(dynamic data) builder,
    required List imageparam,
    required List imagepath,
  }) async {
    try {
      log("_multipartData URL=-=-=-=-::: $uri");
      log("_multipartData headers=-=-=-=-::: $headers");
      log("_multipartData body=-=-=-=-::: $body");
      var request = http.MultipartRequest('POST', uri);
      request.fields.addAll(body);
      log('_multipartData $uri body ${request.fields}');
      for (int i = 0; i < imagepath.length; i++) {
        if (imagepath[i] != null) {
          log("i =-=-=-=-=--== $i");

          Uint8List fileBytes = await imagepath[i].readAsBytes(); // Read file as bytes
          String fileName = imagepath[i].path.split('/').last; // Extract filename

          request.files.add(
            http.MultipartFile.fromBytes(
              imageparam[i],
              fileBytes,
              filename: fileName,
            ),
          );

          log("imagepath=-=-file $i ::: ${imagepath[i].path}");
        }
      }

      request.headers.addAll(headers);
      http.StreamedResponse response = await request.send();
      log(" staus code--- ${response.statusCode}");
      final responseString = await response.stream.bytesToString();
      log('response.statusCode is ${response.statusCode} ------- ${uri} -------');
      log("response is=-=- $uri $responseString");
      dynamic map = json.decode(responseString);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return builder(responseString);
      } else {
        DialogServiceV1().showToast(
            hasError: true,
            content: map["message"] ?? response.reasonPhrase.toString(),);
        log("response.reasonPhrase=-=- ${response.reasonPhrase} ");
        return null;
      }
    } catch (e, s) {
      log("Exception is =-=-8 $e $s");
      DialogServiceV1().showToast(
          hasError: true,
          content: "Something Went Wrong!!",);
      return null;
    }
  }






}
