import 'package:get/get.dart';

class HistoryController extends GetxController{
  var selectedFilter = "Hari".obs;
  var searchQuery  = "".obs;

  void setFilter(String filter) {
    selectedFilter.value = filter;
  }

  void setSearchQuery(String query) {
    searchQuery.value = query;
  }
}