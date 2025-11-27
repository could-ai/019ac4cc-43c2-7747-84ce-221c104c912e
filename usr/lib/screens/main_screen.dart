import 'package:flutter/material.dart';
import 'package:couldai_user_app/screens/home_screen.dart';
import 'package:couldai_user_app/screens/market_screen.dart';
import 'package:couldai_user_app/screens/strategies_screen.dart';
import 'package:couldai_user_app/screens/wallet_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const HomeScreen(),
    const MarketScreen(),
    const StrategiesScreen(),
    const WalletScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard_outlined),
            activeIcon: Icon(Icons.dashboard),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.show_chart),
            activeIcon: Icon(Icons.bar_chart),
            label: 'Market',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.smart_toy_outlined),
            activeIcon: Icon(Icons.smart_toy),
            label: 'Strategies',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_wallet_outlined),
            activeIcon: Icon(Icons.account_balance_wallet),
            label: 'Wallet',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
