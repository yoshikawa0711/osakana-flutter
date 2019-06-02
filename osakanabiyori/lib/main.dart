import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {  
  @override
  Widget build(BuildContext context) {
    Color color =Theme.of(context).primaryColor;

    Column _buildTabBarColumn(Color color, IconData icon, String label) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: color),
          Container(
            margin: const EdgeInsets.only(top: 8),
            child: Text(
              label,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: color,
              ),
            ),
          ),
        ],
      );
    }

    Widget tabBarSection = Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildTabBarColumn(color, Icons.directions_boat, "お魚一覧"),
          _buildTabBarColumn(color, Icons.local_dining, "レシピ一覧"),
          _buildTabBarColumn(color, Icons.star_border, "お気に入り"),
          _buildTabBarColumn(color, Icons.info_outline, "info"),
        ]
      ),
    );

    return MaterialApp(
      title: 'Osakanabiyori',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Osakanabiyori'),
        ),
        body: tabBarSection,
      ),
    );
  }
}