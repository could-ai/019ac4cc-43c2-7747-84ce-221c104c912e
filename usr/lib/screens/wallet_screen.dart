import 'package:flutter/material.dart';
import 'package:couldai_user_app/theme/app_theme.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wallet'),
        actions: [
          IconButton(
            icon: const Icon(Icons.history),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildBalanceHeader(),
            const SizedBox(height: 24),
            _buildActionButtons(),
            const SizedBox(height: 24),
            const Text(
              'Assets',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            _buildAssetList(),
          ],
        ),
      ),
    );
  }

  Widget _buildBalanceHeader() {
    return Center(
      child: Column(
        children: [
          const Text(
            'Total Asset Value (USDT)',
            style: TextStyle(color: Colors.grey),
          ),
          const SizedBox(height: 8),
          const Text(
            '12,450.32',
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: AppTheme.successColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Text(
              '+\$450.20 (3.5%) Today',
              style: TextStyle(
                color: AppTheme.successColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildActionButton(Icons.arrow_downward, 'Deposit'),
        _buildActionButton(Icons.arrow_upward, 'Withdraw'),
        _buildActionButton(Icons.swap_horiz, 'Transfer'),
      ],
    );
  }

  Widget _buildActionButton(IconData icon, String label) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppTheme.surfaceColor,
            shape: BoxShape.circle,
            border: Border.all(color: Colors.grey.withOpacity(0.2)),
          ),
          child: Icon(icon, color: AppTheme.primaryColor),
        ),
        const SizedBox(height: 8),
        Text(label, style: const TextStyle(fontSize: 12)),
      ],
    );
  }

  Widget _buildAssetList() {
    final assets = [
      {'coin': 'USDT', 'amount': '5,230.00', 'value': '5,230.00'},
      {'coin': 'BTC', 'amount': '0.15', 'value': '6,487.50'},
      {'coin': 'ETH', 'amount': '0.32', 'value': '720.00'},
      {'coin': 'BNB', 'amount': '0.04', 'value': '12.82'},
    ];

    return Column(
      children: assets.map((asset) {
        return Card(
          margin: const EdgeInsets.only(bottom: 12),
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.grey[800],
              child: Text(
                asset['coin']!.substring(0, 1),
                style: const TextStyle(color: Colors.white),
              ),
            ),
            title: Text(
              asset['coin']!,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text('${asset['amount']} ${asset['coin']}'),
            trailing: Text(
              '\$${asset['value']}',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
