import '../../model/transaction.dart';

class TransactionListEvent {}

class FetchTransactionListEvent extends TransactionListEvent {}


 class TransactionDetailEvent {}

class LoadTransactionDetailEvent extends TransactionDetailEvent {
  final Transaction transaction;

  LoadTransactionDetailEvent(this.transaction);
}

