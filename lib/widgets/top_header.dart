import 'package:flutter/material.dart';
import 'right_sidebar.dart';

class TopHeader extends StatelessWidget {
  final GlobalKey<ScaffoldState>? scaffoldKey;
  final bool showRightMenu;

  const TopHeader({
    super.key,
    this.scaffoldKey,
    this.showRightMenu = false,
  });

  @override
  Widget build(BuildContext context) {
    bool isMobile = MediaQuery.of(context).size.width < 768;
    
    return Container(
      height: 70,
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        children: [
          // Menu button for mobile
          if (isMobile && scaffoldKey != null)
            IconButton(
              onPressed: () {
                scaffoldKey!.currentState?.openDrawer();
              },
              icon: const Icon(Icons.menu),
            ),
          
          // Breadcrumb
          const Text(
            'Home',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          
          const Spacer(),
          // const SizedBox(width: 10),
          
          // Search Bar - adjust width for mobile
          Container(
            width: isMobile ? 150 : 300,
            height: 40,
            decoration: BoxDecoration(
              color: const Color(0xFF2D3748),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const TextField(
              decoration: InputDecoration(
                hintText: 'Search',
                hintStyle: TextStyle(color: Colors.white70),
                suffixIcon: Icon(Icons.search, color: Colors.white70),
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
              ),
              style: TextStyle(color: Colors.white),
            ),
          ),
          
          
          
          
          // Action Icons - hide some on mobile
          if (!isMobile) ...[

            const SizedBox(width: 20),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.calendar_today_outlined),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.notifications_outlined),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.power_settings_new),
            ),
          ],
          
          // Three dots menu for mobile right sidebar
          if (isMobile && showRightMenu)
            PopupMenuButton<String>(
              icon: const Icon(Icons.more_vert),
              onSelected: (value) {
                if (value == 'calendar') {
                  _showRightSidebarBottomSheet(context);
                }
              },
              itemBuilder: (BuildContext context) => [
                const PopupMenuItem<String>(
                  value: 'calendar',
                  child: Row(
                    children: [
                      Icon(Icons.calendar_today),
                      SizedBox(width: 8),
                      Text('Calendar & Events'),
                    ],
                  ),
                ),
                const PopupMenuItem<String>(
                  value: 'notifications',
                  child: Row(
                    children: [
                      Icon(Icons.notifications),
                      SizedBox(width: 8),
                      Text('Notifications'),
                    ],
                  ),
                ),
                const PopupMenuItem<String>(
                  value: 'settings',
                  child: Row(
                    children: [
                      Icon(Icons.settings),
                      SizedBox(width: 8),
                      Text('Settings'),
                    ],
                  ),
                ),
              ],
            ),
          
          const SizedBox(width: 10),
          
          // User Avatar
          const CircleAvatar(
            radius: 18,
            child: Icon(Icons.person), // Fallback icon since asset might not exist
          ),
        ],
      ),
    );
  }

  void _showRightSidebarBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => DraggableScrollableSheet(
        initialChildSize: 0.7,
        minChildSize: 0.5,
        maxChildSize: 0.9,
        builder: (context, scrollController) => Container(
          decoration: const BoxDecoration(
            color: Color(0xFFF8F9FA),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Column(
            children: [
              Container(
                width: 50,
                height: 5,
                margin: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              const Expanded(child: RightSidebar()),
            ],
          ),
        ),
      ),
    );
  }
}
