import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class MainContent extends StatelessWidget {
  const MainContent({super.key});

  @override
  Widget build(BuildContext context) {
    bool isMobile = MediaQuery.of(context).size.width < 768;
    
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          // Top Rating Project Card
          Container(
            height: isMobile ? 180 : 230,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF6366F1), Color(0xFFEC4899)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Stack(
              children: [
                Positioned(
                  left: 15,
                  top: 20,
                  right: 20,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Text(
                          'PREMIUM 2.0',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Top Rating\nProject',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: isMobile ? 20 : 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Trending project and high rating\nProject Created by team',
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: isMobile ? 12 : 14,
                        ),
                      ),
                      const SizedBox(height: 15),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white.withOpacity(0.2),
                          foregroundColor: Colors.white,
                        ),
                        child: const Text('Learn More'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          
          const SizedBox(height: 20),
          
          // Projects and Top Creators Row - Stack on mobile
          isMobile 
              ? Column(
                  children: [
                    _buildAllProjectsWidget(),
                    const SizedBox(height: 20),
                    _buildTopCreatorsWidget(),
                  ],
                )
              : Row(
                  children: [
                    Expanded(flex: 2, child: _buildAllProjectsWidget()),
                    const SizedBox(width: 20),
                    Expanded(flex: 1, child: _buildTopCreatorsWidget()),
                  ],
                ),
          
          const SizedBox(height: 20),
          
          // Performance Chart
          Container(
            height: isMobile ? 250 : 300,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Over All Performance',
                          style: TextStyle(
                            fontSize: isMobile ? 16 : 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Text(
                          'The Years',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                    if (!isMobile)
                      const Row(
                        children: [
                          _LegendItem(color: Color(0xFFEC4899), label: 'Pending'),
                          SizedBox(width: 20),
                          _LegendItem(color: Color(0xFF6366F1), label: 'Project Done'),
                        ],
                      ),
                  ],
                ),
                if (isMobile) ...[
                  const SizedBox(height: 10),
                  const Row(
                    children: [
                      _LegendItem(color: Color(0xFFEC4899), label: 'Pending'),
                      SizedBox(width: 20),
                      _LegendItem(color: Color(0xFF6366F1), label: 'Project Done'),
                    ],
                  ),
                ],
                const SizedBox(height: 20),
                Expanded(
                  child: LineChart(
                    LineChartData(
                      gridData: const FlGridData(show: false),
                      titlesData: const FlTitlesData(show: true),
                      borderData: FlBorderData(show: false),
                      lineBarsData: [
                        LineChartBarData(
                          spots: const [
                            FlSpot(0, 30),
                            FlSpot(1, 25),
                            FlSpot(2, 35),
                            FlSpot(3, 40),
                            FlSpot(4, 32),
                            FlSpot(5, 45),
                          ],
                          isCurved: true,
                          color: const Color(0xFFEC4899),
                        ),
                        LineChartBarData(
                          spots: const [
                            FlSpot(0, 20),
                            FlSpot(1, 30),
                            FlSpot(2, 25),
                            FlSpot(3, 35),
                            FlSpot(4, 28),
                            FlSpot(5, 38),
                          ],
                          isCurved: true,
                          color: const Color(0xFF6366F1),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAllProjectsWidget() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF2D3748),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'All Projects',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          ...List.generate(3, (index) => _buildProjectItem()),
        ],
      ),
    );
  }

  Widget _buildTopCreatorsWidget() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF2D3748),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Top Creators',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          ...List.generate(4, (index) => _buildCreatorItem()),
        ],
      ),
    );
  }

  Widget _buildProjectItem() {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      child: const Row(
        children: [
          CircleAvatar(
            radius: 20,
            backgroundColor: Color(0xFF6366F1),
            child: Icon(Icons.code, color: Colors.white),
          ),
          SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Technology behind the Blockchain',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  'Project #1 • See project details',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          Icon(Icons.edit, color: Colors.white70, size: 16),
        ],
      ),
    );
  }

  Widget _buildCreatorItem() {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      child: Row(
        children: [
          CircleAvatar(
            radius: 15,
            // backgroundImage: AssetImage('assets/images/profile.png'),
          ),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '@iamshaeen_art',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
                Text(
                  '9821',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 10,
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: Color(0xFF6366F1),
              borderRadius: BorderRadius.circular(2),
            ),
          ),
        ],
      ),
    );
  }
}

class _LegendItem extends StatelessWidget {
  final Color color;
  final String label;

  const _LegendItem({required this.color, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: 8),
        Text(
          label,
          style: const TextStyle(fontSize: 12),
        ),
      ],
    );
  }
}
