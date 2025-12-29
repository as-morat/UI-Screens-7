import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:learn_getx/model/detail_data_model.dart';

class DataController extends GetxController {
  final RxList<DetailDataModel> _dataList = <DetailDataModel>[].obs;
  List<DetailDataModel> get dataList => _dataList.value;

  final RxBool isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchAllData();
  }

  Future<void> fetchAllData() async {
    await loadJsonData();
    await Future.delayed(const Duration(seconds: 2));
    isLoading.value = false;
  }

  Future<void> loadJsonData() async {
    final String jsonString =
    await rootBundle.loadString("data/detail.json");
    final List<dynamic> jsonData = jsonDecode(jsonString);

    _dataList.assignAll(
      jsonData.map((e) => DetailDataModel.fromJson(e)).toList(),
    );
  }
}

