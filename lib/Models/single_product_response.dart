import 'dart:convert';

import 'package:qtec_task/Models/search_result.dart';

SingleProductResponse singleProductResponseFromJson(String str) => SingleProductResponse.fromJson(json.decode(str));

String singleProductResponseToJson(SingleProductResponse data) => json.encode(data.toJson());

class SingleProductResponse {
    SingleProductResponse({
        required this.status,
        required this.statusCode,
        required this.data,
        required this.error,
    });

    String status;
    num statusCode;
    Result data;
    String error;

    factory SingleProductResponse.fromJson(Map<String, dynamic> json) => SingleProductResponse(
        status: json["status"] ?? "",
        statusCode: json["statusCode"] ?? 0,
        data: Result.fromJson(json["data"]),
        error: json["error"]?? "",
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "statusCode": statusCode,
        "data": data.toJson(),
        "error": error,
    };
}
