import 'package:flutter/material.dart';
import 'package:couldai_user_app/theme/app_theme.dart';

class StrategiesScreen extends StatelessWidget {
  const StrategiesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Strategies'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildStrategyCard(
            context,
            'Grid Trading',
            'Best for sideways markets. Buys low and sells high automatically within a price range.',
            Icons.grid_on,
            Colors.blue,
          ),
          const SizedBox(height: 16),
          _buildStrategyCard(
            context,
            'DCA (Dollar Cost Avg)',
            'Reduces the impact of volatility by spreading purchases over regular intervals.',
            Icons.access_time,
            Colors.orange,
          ),
          const SizedBox(height: 16),
          _buildStrategyCard(
            context,
            'Smart Rebalance',
            'Automatically adjusts your portfolio to maintain your desired asset allocation.',
            Icons.pie_chart,
            Colors.purple,
          ),
          const SizedBox(height: 16),
          _buildStrategyCard(
            context,
            'Infinity Grid',
            'Advanced grid strategy for bullish markets with no upper price limit.',
            Icons.all_inclusive,
            Colors.teal,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        backgroundColor: AppTheme.primaryColor,
        icon: const Icon(Icons.add),
        label: const Text('Create Bot'),
      ),
    );
  }

  Widget _buildStrategyCard(
    BuildContext context,
    String title,
    String description,
    IconData icon,
    Color color,
  ) {
    return Card(
      child: InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: color.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(icon, color: color, size: 28),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Text(
                      title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
                ],
              ),
              const SizedBox(height: 12),
              Text(
                description,
                style: const TextStyle(color: Colors.grey, height: 1.4),
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    foregroundColor: color,
                    side: BorderSide(color: color),
                  ),
                  child: const Text('Configure'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
