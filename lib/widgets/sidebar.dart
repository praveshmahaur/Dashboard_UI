import 'package:flutter/material.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({super.key});

  @override
  Widget build(BuildContext context) {
    bool isInDrawer = MediaQuery.of(context).size.width < 768;

    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Column(
            children: [
              // Logo Section
              Center(
                child: Container(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        decoration: const BoxDecoration(
                          color: Color(0xFFFF6B6B),
                          shape: BoxShape.circle,
                        ),
                        child: const Center(
                          child: Text(
                            'AS',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      const Text(
                        'Adstacks',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      if (isInDrawer) ...[
                        const Spacer(),
                        IconButton(
                          onPressed: () => Navigator.of(context).pop(),
                          icon: const Icon(Icons.close),
                        ),
                      ],
                    ],
                  ),
                ),
              ),

              Divider(height: 3, color: Colors.grey),
              // User Profile
              Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: const Color(0xFFF8F9FA),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      child: Icon(Icons.person), // Fallback icon
                    ),
                    SizedBox(height: 5),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Pooja Mishra',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 10),
                        Container(
                          width: 70,
                          padding: EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ), // text ke around space
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: const Color.fromARGB(255, 208, 33, 243),
                            ), // blue border
                            borderRadius: BorderRadius.circular(
                              10,
                            ), // optional: corners rounded
                          ),
                          child: Center(
                            child: Text(
                              'Admin',
                              style: TextStyle(color: Colors.black, fontSize: 12),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              Divider(height: 3, color: Colors.grey),

              // Navigation Items
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  children: [
                    _buildNavItem(
                      Icons.home,
                      'Home',
                      true,
                      context,
                      isInDrawer,
                    ),
                    _buildNavItem(
                      Icons.people,
                      'Employees',
                      false,
                      context,
                      isInDrawer,
                    ),
                    _buildNavItem(
                      Icons.access_time,
                      'Attendance',
                      false,
                      context,
                      isInDrawer,
                    ),
                    _buildNavItem(
                      Icons.bar_chart,
                      'Summary',
                      false,
                      context,
                      isInDrawer,
                    ),
                    _buildNavItem(
                      Icons.info,
                      'Information',
                      false,
                      context,
                      isInDrawer,
                    ),

                    const SizedBox(height: 20),

                    // Workspaces Section
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'WORKSPACES',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF6366F1),
                          ),
                        ),
                        Icon(Icons.add, size: 16, color: Colors.grey[600]),
                      ],
                    ),

                    const SizedBox(height: 10),

                    _buildWorkspaceItem('Adstacks', true),
                    _buildWorkspaceItem('Finance', false),
                  ],
                ),
              ),

              // Bottom Actions
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    _buildNavItem(
                      Icons.settings,
                      'Setting',
                      false,
                      context,
                      isInDrawer,
                    ),
                    _buildNavItem(
                      Icons.logout,
                      'Logout',
                      false,
                      context,
                      isInDrawer,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(
    IconData icon,
    String title,
    bool isActive,
    BuildContext context,
    bool isInDrawer,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 5),
      decoration: BoxDecoration(
        color: isActive ? const Color(0xFF6366F1).withOpacity(0.1) : null,
        borderRadius: BorderRadius.circular(8),
      ),
      child: ListTile(
        leading: Icon(
          icon,
          color: isActive ? const Color(0xFF6366F1) : Colors.grey[600],
          size: 20,
        ),
        title: Text(
          title,
          style: TextStyle(
            color: isActive ? const Color(0xFF6366F1) : Colors.grey[800],
            fontWeight: isActive ? FontWeight.w500 : FontWeight.normal,
          ),
        ),
        dense: true,
        contentPadding: const EdgeInsets.symmetric(horizontal: 12),
        onTap: () {
          if (isInDrawer) {
            Navigator.of(context).pop(); // Close drawer on mobile
          }
        },
      ),
    );
  }

  Widget _buildWorkspaceItem(String title, bool isExpanded) {
    return ListTile(
      title: Text(title, style: const TextStyle(fontSize: 14)),
      trailing: Icon(
        isExpanded ? Icons.keyboard_arrow_down : Icons.keyboard_arrow_right,
        size: 16,
      ),
      dense: true,
      contentPadding: const EdgeInsets.symmetric(horizontal: 12),
    );
  }
}
