import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transaction_app/presentation/transaction/transaction_list.dart';

import '../../core/data/transaction/transaction_bloc.dart';
import '../../core/data/transaction/transaction_state.dart';
import '../../core/model/transaction.dart';

class TransactionDetailPage extends StatelessWidget {
  final Transaction transaction;

  const TransactionDetailPage({super.key, required this.transaction});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transaction Detail'),
      ),
      body: BlocBuilder<TransactionDetailBloc, TransactionDetailState>(
        builder: (context, state) {
          if (state is TransactionDetailLoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is TransactionDetailLoadedState) {
            final loadedTransaction = state.transactionDetails;

            return ListView(
              children: [
                ListTile(
                  title: const Text('Transaction Date'),
                  subtitle: Text(loadedTransaction.transactionDate),
                ),
                ListTile(
                  title: const Text('Amount'),
                  subtitle: Text(loadedTransaction.amount.toString()),
                ),
                ListTile(
                  title: const Text('Commission'),
                  subtitle: Text(loadedTransaction.commission.toString()),
                ),
                ListTile(
                  title: const Text('Total'),
                  subtitle: Text(loadedTransaction.total.toString()),
                ),
                ListTile(
                  title: const Text('Transaction Number'),
                  subtitle: Text(loadedTransaction.transactionNumber),
                ),
                ListTile(
                  title: const Text('Type of Operation'),
                  subtitle: Text(loadedTransaction.type),
                ),
                ListTile(
                  title: const Text('Cancel Transaction'),
                  subtitle: TextButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const TransactionListPage()));
                    },
                    child: const Text('Cancel'),
                  ),
                ),
                ListTile(
                  title: const Text('Back to Transaction List'),
                  subtitle: TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('Back'),
                  ),
                ),
              ],
            );
          } else if (state is TransactionDetailErrorState) {
            return Center(child: Text('Error: ${state.error}'));
          } else {
            return const SizedBox.shrink(); // Empty widget if state is unexpected
          }
        },
      ),
    );
  }
}
