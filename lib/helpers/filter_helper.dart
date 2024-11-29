class FilterHelper {
  static bool isSameDay(DateTime date1, DateTime date2) {
    return date1.year == date2.year &&
        date1.month == date2.month &&
        date1.day == date2.day;
  }

  static List<Map<String, dynamic>> filterTransactions(
    List<Map<String, dynamic>> transactions,
    String filter,
    String searchQuery,
  ) {
    DateTime now = DateTime.now();
    List<Map<String, dynamic>> filtered = transactions;

    // Filter berdasarkan Hari, Minggu, Bulan, atau Tahun
    if (filter == "Hari") {
      filtered = filtered.where((tx) {
        return isSameDay(tx["date"], now);
      }).toList();
    } else if (filter == "Minggu") {
      DateTime startOfWeek = now.subtract(Duration(days: now.weekday - 1));
      DateTime endOfWeek = startOfWeek.add(Duration(days: 6));
      filtered = filtered.where((tx) {
        return tx["date"].isAfter(startOfWeek.subtract(Duration(days: 1))) &&
            tx["date"].isBefore(endOfWeek.add(Duration(days: 1)));
      }).toList();
    } else if (filter == "Bulan") {
      filtered = filtered.where((tx) {
        return tx["date"].year == now.year && tx["date"].month == now.month;
      }).toList();
    } else if (filter == "Tahun") {
      filtered = filtered.where((tx) {
        return tx["date"].year == now.year;
      }).toList();
    }

    // Filter berdasarkan pencarian (kategori)
    if (searchQuery.isNotEmpty) {
      filtered = filtered
          .where((tx) =>
              tx["category"].toLowerCase().contains(searchQuery.toLowerCase()))
          .toList();
    }

    return filtered;
  }
}
