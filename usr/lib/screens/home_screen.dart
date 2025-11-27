import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:couldai_user_app/theme/app_theme.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_outlined),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildPortfolioCard(context),
            const SizedBox(height: 24),
            const Text(
              'Active Bots',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            _buildActiveBotCard(
              context,
              'BTC/USDT Grid',
              'Running',
              '+2.45%',
              AppTheme.successColor,
            ),
            const SizedBox(height: 12),
            _buildActiveBotCard(
              context,
              'ETH/USDT DCA',
              'Paused',
              '-0.12%',
              AppTheme.warningColor,
            ),
            const SizedBox(height: 24),
            const Text(
              'Performance (7D)',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            SizedBox(
              height: 200,
              child: LineChart(
                LineChartData(
                  gridData: const FlGridData(show: false),
                  titlesData: const FlTitlesData(show: false),
                  borderData: FlBorderData(show: false),
                  lineBarsData: [
                    LineChartBarData(
                      spots: const [
                        FlSpot(0, 3),
                        FlSpot(1, 1),
                        FlSpot(2, 4),
                        FlSpot(3, 2),
                        FlSpot(4, 5),
                        FlSpot(5, 3),
                        FlSpot(6, 6),
                      ],
                      isCurved: true,
                      color: AppTheme.primaryColor,
                      barWidth: 3,
                      isStrokeCapRound: true,
                      dotData: const FlDotData(show: false),
                      belowBarData: BarAreaData(
                        show: true,
                        color: AppTheme.primaryColor.withOpacity(0.2),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPortfolioCard(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppTheme.primaryColor,
            AppTheme.primaryColor.withOpacity(0.7),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Total Balance',
            style: TextStyle(color: Colors.white70, fontSize: 14),
          ),
          const SizedBox(height: 8),
          const Text(
            '\$12,450.32',
            style: TextStyle(
              color: Colors.white,
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Row(
                  children: [
                    Icon(Icons.arrow_upward, color: Colors.greenAccent, size: 16),
                    SizedBox(width: 4),
                    Text(
                      '+$450.20 (3.5%)',
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              const Text(
                'Today',
                style: TextStyle(color: Colors.white70, fontSize: 12),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildActiveBotCard(
    BuildContext context,
    String name,
    String status,
    String profit,
    Color profitColor,
  ) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: AppTheme.primaryColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Icon(Icons.smart_toy, color: AppTheme.primaryColor),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    status,
                    style: TextStyle(
                      color: status == 'Running'
                          ? AppTheme.successColor
                          : Colors.grey,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  profit,
                  style: TextStyle(
                    color: profitColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const Text(
                  'PNL',
                  style: TextStyle(color: Colors.grey, fontSize: 10),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
