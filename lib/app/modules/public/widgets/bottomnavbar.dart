import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:sufi_one/app/theme/color_constant.dart';

class BottomNavbar extends StatefulWidget {
  final int selectedIndex;
  final void Function(int)? onItemTapped;

  const BottomNavbar({
    super.key,
    required this.selectedIndex,
    this.onItemTapped,
  });

  @override
  State<BottomNavbar> createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(
      length: 4,
      vsync: this,
      initialIndex: widget.selectedIndex,
    );

    _tabController.addListener(() {
      if (_tabController.indexIsChanging) {
        widget.onItemTapped?.call(_tabController.index); // Panggil callback
      }
    });
  }

  @override
  void didUpdateWidget(covariant BottomNavbar oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.selectedIndex != _tabController.index) {
      _tabController.index = widget.selectedIndex;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ConvexAppBar(
      controller: _tabController,
      style: TabStyle.reactCircle,
      height: 50,
      curveSize: 100,
      backgroundColor: AppColors.navIcon,
      activeColor: AppColors.bg1,
      color: AppColors.bg2,
      elevation: 10,
      items: const [
        TabItem(icon: Icons.home, title: 'Home'), // index 0
        TabItem(icon: Icons.perm_device_information, title: 'About'), // index 1
        TabItem(icon: Icons.contact_support, title: 'Support'), // index 2
        TabItem(icon: Icons.person, title: 'Profile'), // index 3
      ],
    );
  }

  @override
  void dispose() {
    _tabController.dispose(); // mencegah memory leak
    super.dispose();
  }
}
