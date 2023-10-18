 import 'package:transaction_app/core/model/transaction_details.dart';

import '../../model/transaction.dart';

class TransactionListState {}

class TransactionListInitialState extends TransactionListState {}

class TransactionListLoadingState extends TransactionListState {}

class TransactionListLoadedState extends TransactionListState {
  final List<Transaction> transactions;

  TransactionListLoadedState({required this.transactions});
}

class TransactionListErrorState extends TransactionListState {
  final String error;

  TransactionListErrorState({required this.error});
}

 class TransactionDetailState {}

 class TransactionDetailInitialState extends TransactionDetailState {}

 class TransactionDetailLoadingState extends TransactionListState {}

 class TransactionDetailLoadedState extends TransactionDetailState {
    TransactionDetails transactionDetails;

    TransactionDetailLoadedState({required this. transactionDetails});
 }

 class TransactionDetailErrorState extends TransactionDetailState {
   final String error;

   TransactionDetailErrorState({required this.error});
 }
