

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transaction_app/core/data/transaction/transaction_event.dart';
import 'package:transaction_app/core/data/transaction/transaction_state.dart';

import '../../model/transaction.dart';
import '../../model/transaction_details.dart';

class TransactionListBloc extends Bloc<TransactionListEvent, TransactionListState> {
  TransactionListBloc() : super(TransactionListInitialState());

  @override
  Stream<TransactionListState> mapEventToState(TransactionListEvent event) async* {
    if (event is FetchTransactionListEvent) {
      yield TransactionListLoadingState();

      try {
        await Future.delayed(const Duration(seconds: 2));
        final transactions = [
          Transaction(type: 'Income', transactionNumber: 'TR123', amount: 100.0),
          Transaction(type: 'Expense', transactionNumber: 'TR456', amount: -50.0),
          Transaction(type: 'Income', transactionNumber: 'TR789', amount: 75.0),
        ];

        yield TransactionListLoadedState(transactions: transactions);
      } catch (error) {
        yield TransactionListErrorState(error: error.toString());
      }
    }
  }
}

class TransactionDetailBloc extends Bloc<TransactionDetailEvent, TransactionDetailState> {
  TransactionDetailBloc() : super(TransactionDetailInitialState());

  @override
  Stream<TransactionDetailState> mapEventToState(TransactionDetailEvent event) async* {
    if (event is LoadTransactionDetailEvent) {
      yield TransactionDetailState(); // Add a loading state

      try {
        await Future.delayed(const Duration(seconds: 2));
        final transactionDeatils = TransactionDetails(
          transactionDate: '2023-10-18',
          amount: 100.0,
          commission: 5.0,
          total: 105.0,
          transactionNumber: 'TR123',
          type: 'Income',
        );

        yield TransactionDetailLoadedState(transactionDetails: transactionDeatils);
      } catch (error) {
        yield TransactionDetailErrorState(error: 'Error loading transaction details');
      }
    }
  }
}
