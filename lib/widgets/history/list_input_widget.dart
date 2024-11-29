import 'package:flutter/material.dart';

class HistoryTransactionList extends StatelessWidget {
  final List<Map<String, dynamic>> transactions;

  const HistoryTransactionList({super.key, required this.transactions});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemCount: transactions.length,
      itemBuilder: (context, index) {
        final transaction = transactions[index];
        return Card(
          margin: const EdgeInsets.only(bottom: 16.0),
          child: ListTile(
            leading: Text(
              "${transaction['date'].day}/${transaction['date'].month}/${transaction['date'].year}",
              style: const TextStyle(fontFamily: "Poppins_Bold", fontSize: 16),
            ),
            title: Text(
              transaction["category"],
              style: const TextStyle(fontFamily: "Poppins_Regular"),
            ),
            trailing: Text(
              "${transaction['amount'] < 0 ? '-' : ''}Rp${transaction['amount'].abs()}",
              style: TextStyle(
                color: transaction['amount'] < 0
                    ? const Color(0xFFE60000)
                    : const Color(0xFFB2E600),
                fontFamily: "Poppins_Bold",
                fontSize: 16.0,
              ),
            ),
          ),
        );
      },
    );
  }
}
