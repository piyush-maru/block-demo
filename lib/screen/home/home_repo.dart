import 'dart:convert';

import 'package:dio/dio.dart';

import '../../utils.dart';

class HomeRepo {
  Future<dynamic> fetchData() async {
    try {
      var formData = FormData.fromMap({"user_id": '4'});
      var response = await Dio().post(
        'https://coupon.notionprojects.tech/api_billing/get_customer_list.php',
        data: formData,
      );
      print("status code ${response.statusCode}");
      return jsonDecode(response.data);
    } catch (e) {
      print('Error $e');
    }
  }
}
