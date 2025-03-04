import 'package:flutter/material.dart';

class SidebarNavigation extends StatelessWidget {
  final String currentRoute;

  const SidebarNavigation({Key? key, required this.currentRoute})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      color: Colors.white,
      child: Column(
        children: [
          SizedBox(height: 20),

          // App Logo
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                Image.asset(
                  'assets/images/pixel_logo.png',
                  height: 36,
                  width: 36,
                  errorBuilder: (context, error, stackTrace) {
                    return PixelLogoWidget(size: 36, color: Color(0xFFFF3355));
                  },
                ),
                SizedBox(width: 12),
                Text(
                  'APPLUX',
                  style: TextStyle(
                    color: Color(0xFFFF3355),
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1,
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 40),

          // Navigation Menu Items
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                _buildNavItem(
                  context: context,
                  icon: Icons.dashboard,
                  title: 'Dashboard',
                  route: '/dashboard',
                  isSelected: currentRoute == '/dashboard',
                ),
                _buildNavItem(
                  context: context,
                  icon: Icons.calendar_today,
                  title: 'Event',
                  route: '/event',
                  isSelected: currentRoute == '/event',
                ),
                _buildNavItem(
                  context: context,
                  icon: Icons.leaderboard,
                  title: 'Leaderboard',
                  route: '/leaderboard',
                  isSelected: currentRoute == '/leaderboard',
                ),
                _buildNavItem(
                  context: context,
                  icon: Icons.message,
                  title: 'Message',
                  route: '/message',
                  isSelected: currentRoute == '/message',
                ),
                _buildNavItem(
                  context: context,
                  icon: Icons.receipt,
                  title: 'Order',
                  route: '/order',
                  isSelected: currentRoute == '/order',
                ),
                _buildNavItem(
                  context: context,
                  icon: Icons.inventory,
                  title: 'Product',
                  route: '/product',
                  isSelected: currentRoute == '/product',
                ),
                _buildNavItem(
                  context: context,
                  icon: Icons.people,
                  title: 'Registered Users',
                  route: '/registered_users',
                  isSelected: currentRoute == '/registered_users',
                ),
                _buildNavItem(
                  context: context,
                  icon: Icons.bar_chart,
                  title: 'Sales Report',
                  route: '/sales_report',
                  isSelected: currentRoute == '/sales_report',
                ),
                _buildNavItem(
                  context: context,
                  icon: Icons.settings,
                  title: 'Settings',
                  route: '/settings',
                  isSelected: currentRoute == '/settings',
                ),
              ],
            ),
          ),

          // Sign Out Button
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 20.0,
            ),
            child: ElevatedButton(
              onPressed: () {
                // Handle sign out
                Navigator.pushReplacementNamed(context, '/login');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFFF4D67),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                minimumSize: Size(double.infinity, 50),
                elevation: 0,
              ),
              child: Text(
                'Sign Out',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
            ),
          ),

          // Help Button
          Padding(
            padding: const EdgeInsets.only(bottom: 20.0, left: 16.0),
            child: Row(
              children: [
                Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.grey.shade400, width: 1),
                  ),
                  child: Icon(
                    Icons.question_mark,
                    color: Colors.grey.shade400,
                    size: 18,
                  ),
                ),
                SizedBox(width: 10),
                Text(
                  'Help',
                  style: TextStyle(color: Colors.grey.shade400, fontSize: 16),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem({
    required BuildContext context,
    required IconData icon,
    required String title,
    required String route,
    required bool isSelected,
  }) {
    return InkWell(
      onTap: () {
        if (!isSelected) {
          Navigator.pushReplacementNamed(context, route);
        }
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        color:
            isSelected
                ? Color(0xFFFF3355).withOpacity(0.05)
                : Colors.transparent,
        child: Row(
          children: [
            Container(
              width: 4,
              height: 20,
              decoration: BoxDecoration(
                color: isSelected ? Color(0xFFFF3355) : Colors.transparent,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            SizedBox(width: 16),
            Icon(
              icon,
              color: isSelected ? Color(0xFFFF3355) : Colors.grey.shade500,
              size: 22,
            ),
            SizedBox(width: 12),
            Text(
              title,
              style: TextStyle(
                color: isSelected ? Color(0xFFFF3355) : Colors.grey.shade500,
                fontSize: 16,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PixelLogoWidget extends StatelessWidget {
  final double size;
  final Color color;

  const PixelLogoWidget({Key? key, required this.size, required this.color})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(size, size),
      painter: PixelLogoPainter(color: color),
    );
  }
}

class PixelLogoPainter extends CustomPainter {
  final Color color;

  PixelLogoPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final double gridSize =
        size.width / 8; // Divide into 8x8 grid for simplicity
    final Paint paint =
        Paint()
          ..color = color
          ..style = PaintingStyle.fill;

    // Draw a simplified pixel pattern based on the image
    // Main larger squares
    canvas.drawRect(
      Rect.fromLTWH(2 * gridSize, 1 * gridSize, 2 * gridSize, 2 * gridSize),
      paint,
    );
    canvas.drawRect(
      Rect.fromLTWH(4 * gridSize, 2 * gridSize, 2 * gridSize, 2 * gridSize),
      paint,
    );
    canvas.drawRect(
      Rect.fromLTWH(1 * gridSize, 3 * gridSize, 2 * gridSize, 2 * gridSize),
      paint,
    );
    canvas.drawRect(
      Rect.fromLTWH(3 * gridSize, 4 * gridSize, 2 * gridSize, 2 * gridSize),
      paint,
    );

    // Smaller squares
    canvas.drawRect(
      Rect.fromLTWH(1 * gridSize, 1 * gridSize, gridSize, gridSize),
      paint,
    );
    canvas.drawRect(
      Rect.fromLTWH(4.5 * gridSize, 1 * gridSize, gridSize, gridSize),
      paint,
    );
    canvas.drawRect(
      Rect.fromLTWH(6 * gridSize, 1.5 * gridSize, gridSize, gridSize),
      paint,
    );
    canvas.drawRect(
      Rect.fromLTWH(0.5 * gridSize, 5 * gridSize, gridSize, gridSize),
      paint,
    );
    canvas.drawRect(
      Rect.fromLTWH(6 * gridSize, 4 * gridSize, gridSize, gridSize),
      paint,
    );
    canvas.drawRect(
      Rect.fromLTWH(2 * gridSize, 6 * gridSize, gridSize, gridSize),
      paint,
    );
    canvas.drawRect(
      Rect.fromLTWH(5 * gridSize, 6 * gridSize, gridSize, gridSize),
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
