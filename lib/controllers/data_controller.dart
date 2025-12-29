import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:learn_getx/model/detail_data_model.dart';

class DataController extends GetxController {
  final RxList<DetailDataModel> _dataList = <DetailDataModel>[].obs;
  List<DetailDataModel> get dataList => _dataList.value;

  final RxList<DetailDataModel> _dataTempList = <DetailDataModel>[].obs;
  List<DetailDataModel> get dataTempList => _dataTempList.value;

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
    final String jsonString = await rootBundle.loadString("data/detail.json");
    final List<dynamic> jsonData = jsonDecode(jsonString);

    _dataList.assignAll(
      jsonData.map((e) => DetailDataModel.fromJson(e)).toList(),
    );
  }

  void updateTempList(int index) {
    List<DetailDataModel> sortList = List.from(_dataList);
    DetailDataModel target = sortList[index];
    sortList.removeAt(index);
    sortList.insert(0, target);
    _dataTempList.assignAll(sortList);
  }
}
