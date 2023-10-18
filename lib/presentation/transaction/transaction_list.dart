import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transaction_app/presentation/transaction/transaction_details_page.dart';

import '../../core/data/transaction/transaction_bloc.dart';
import '../../core/data/transaction/transaction_event.dart';
import '../../core/data/transaction/transaction_state.dart';

class TransactionListPage extends StatelessWidget {
  const TransactionListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TransactionListBloc(),
      child: Builder(
        builder: (context) => Scaffold(
          appBar: AppBar(
            title: const Text('Transaction List'),
          ),
          body: BlocBuilder<TransactionListBloc, TransactionListState>(
            builder: (context, state) {
              if (state is TransactionListInitialState) {
                BlocProvider.of<TransactionListBloc>(context).add(FetchTransactionListEvent());
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is TransactionListLoadingState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is TransactionListLoadedState) {
                return ListView.builder(
                  itemCount: state.transactions.length,
                  itemBuilder: (context, index) {
                    final transaction = state.transactions[index];
                    return ListTile(
                      title: Text(transaction.type),
                      subtitle: Text(transaction.transactionNumber),
                      trailing: Text(transaction.amount.toString()),
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => TransactionDetailPage(transaction: transaction)),
                      ),
                    );
                  },
                );
              } else if (state is TransactionListErrorState) {
                return Center(
                  child: Text('An error occurred: ${state.error}'),
                );
              } else {
                return const Center(
                  child: Text('Unknown state'),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
