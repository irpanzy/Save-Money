class TransactionModel {
  final int? id;
  final double amount;
  final String description;
  final String date;
  final int categoryId;
  final String? categoryTitle; 

  TransactionModel({
    this.id,
    required this.amount,
    required this.description,
    required this.date,
    required this.categoryId,
    this.categoryTitle,
  });

  factory TransactionModel.fromMap(Map<String, dynamic> map) {
    return TransactionModel(
      id: map['transaction_id'],
      amount: map['amount'],
      description: map['description'],
      date: map['date'],
      categoryId: map['categories_id'],
      categoryTitle: map['category_title'], 
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'transaction_id': id,
      'amount': amount,
      'description': description,
      'date': date,
      'categories_id': categoryId,
    };
  }
}
