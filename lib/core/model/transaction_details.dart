class TransactionDetails {
  final String transactionDate;
  final double amount;
  final double commission;
  final double total;
  final String transactionNumber;
  final String type;

  TransactionDetails({
    required this.transactionDate,
    required this.amount,
    required this.commission,
    required this.total,
    required this.transactionNumber,
    required this.type,
  });
}
