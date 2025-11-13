import 'package:flutter/material.dart';
import '../widgets/sidebar.dart';
import '../widgets/top_header.dart';
import '../widgets/main_content.dart';
import '../widgets/right_sidebar.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: const Color(0xFFF8F9FA),
      drawer: MediaQuery.of(context).size.width < 768 
          ? const Drawer(child: Sidebar()) 
          : null,
      body: LayoutBuilder(
        builder: (context, constraints) {
          bool isMobile = constraints.maxWidth < 768;
          bool isTablet = constraints.maxWidth >= 768 && constraints.maxWidth < 1024;
          // bool isDesktop = constraints.maxWidth >= 1024;

          if (isMobile) {
            print("buildMobileLayout");
            return _buildMobileLayout();
          } else if (isTablet) {
            return _buildTabletLayout();
          } else {
            return _buildDesktopLayout();
          }
        },
      ),
    );
  }

  Widget _buildDesktopLayout() {
    return const Row(
      children: [
        SizedBox(width: 280, child: Sidebar()),
        Expanded(
          flex: 3,
          child: Column(
            children: [
              TopHeader(),
              Expanded(child: MainContent()),
            ],
          ),
        ),
        SizedBox(width: 320, child: RightSidebar()),
      ],
    );
  }

  Widget _buildTabletLayout() {
    return const Row(
      children: [
        SizedBox(width: 240, child: Sidebar()),
        Expanded(
          child: Column(
            children: [
              TopHeader(),
              Expanded(child: MainContent()),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildMobileLayout() {
    return SafeArea(
      child: Column(
        children: [
          TopHeader(
            scaffoldKey: _scaffoldKey,
            showRightMenu: true,
          ),
          const Expanded(child: MainContent()),
        ],
      ),
    );
  }
}
