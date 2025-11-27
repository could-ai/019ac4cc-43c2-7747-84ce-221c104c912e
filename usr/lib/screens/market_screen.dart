import 'package:flutter/material.dart';
import 'package:couldai_user_app/theme/app_theme.dart';

class MarketScreen extends StatelessWidget {
  const MarketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Market'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return _buildMarketItem(context, index);
        },
      ),
    );
  }

  Widget _buildMarketItem(BuildContext context, int index) {
    final List<String> pairs = [
      'BTC/USDT',
      'ETH/USDT',
      'SOL/USDT',
      'BNB/USDT',
      'XRP/USDT',
      'ADA/USDT',
      'DOGE/USDT',
      'DOT/USDT',
      'MATIC/USDT',
      'LTC/USDT'
    ];
    final List<String> prices = [
      '43,250.00',
      '2,250.00',
      '98.50',
      '310.20',
      '0.55',
      '0.45',
      '0.08',
      '6.50',
      '0.85',
      '65.20'
    ];
    final List<double> changes = [
      2.5,
      -1.2,
      5.4,
      0.5,
      -0.8,
      1.1,
      -3.2,
      4.1,
      0.2,
      -0.5
    ];

    final isPositive = changes[index] >= 0;

    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      leading: CircleAvatar(
        backgroundColor: Colors.grey[800],
        child: Text(
          pairs[index].substring(0, 1),
          style: const TextStyle(color: Colors.white),
        ),
      ),
      title: Text(
        pairs[index],
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Text('Vol: \$${(index + 1) * 25}M'),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            prices[index],
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          Text(
            '${isPositive ? '+' : ''}${changes[index]}%',
            style: TextStyle(
              color: isPositive ? AppTheme.successColor : AppTheme.errorColor,
              fontSize: 12,
            ),
          ),
        ],
      ),
      onTap: () {
        // Navigate to details
      },
    );
  }
}
