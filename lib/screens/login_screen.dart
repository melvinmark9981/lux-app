import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Close button
                Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                    icon: Icon(Icons.close, color: Colors.black54, size: 30),
                    onPressed: () {
                      // Handle close button action
                      Navigator.pop(context);
                    },
                    padding: EdgeInsets.zero,
                    constraints: BoxConstraints(),
                  ),
                ),

                SizedBox(height: 30),

                // App Logo and Name
                Column(
                  children: [
                    // Pixel Pattern Logo
                    Image.asset(
                      'assets/images/pixel_logo.png', // Add this image to your assets
                      height: 100,
                      width: 100,
                      errorBuilder: (context, error, stackTrace) {
                        // If image is not found, use the pixel pattern from Image 3
                        return PixelLogoWidget(
                          size: 100,
                          color: Color(0xFFFF3355),
                        );
                      },
                    ),

                    SizedBox(height: 16),

                    // App Name
                    Text(
                      'APPLUX',
                      style: TextStyle(
                        color: Color(0xFFFF3355),
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.2,
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 40),

                // LOGIN Text
                Text(
                  'LOGIN',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    letterSpacing: 1.5,
                  ),
                ),

                SizedBox(height: 40),

                // Username / Email Address Field
                Container(
                  decoration: BoxDecoration(
                    color: Color(0xFFF5F5F5),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Username / Email Address',
                      hintStyle: TextStyle(color: Colors.grey, fontSize: 16),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 18,
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 16),

                // Password Field
                Container(
                  decoration: BoxDecoration(
                    color: Color(0xFFF5F5F5),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: TextField(
                    obscureText: _obscureText,
                    decoration: InputDecoration(
                      hintText: 'Password',
                      hintStyle: TextStyle(color: Colors.grey, fontSize: 16),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 18,
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscureText
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined,
                          color: Colors.grey,
                        ),
                        onPressed: () {
                          setState(() {
                            _obscureText = !_obscureText;
                          });
                        },
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 30),

                // Log in Button
                Container(
                  width: double.infinity,
                  height: 55,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/profile');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFFF4D67),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 0,
                    ),
                    child: Text(
                      'Log in',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 16),

                // Help and Create Account row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () {
                        // Handle help action
                      },
                      child: Text(
                        'Help',
                        style: TextStyle(
                          color: Color(0xFFFF4D67),
                          fontSize: 16,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/register');
                      },
                      child: Text(
                        'Create one now',
                        style: TextStyle(
                          color: Color(0xFFFF4D67),
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 16),

                // OR Divider
                Row(
                  children: [
                    Expanded(
                      child: Divider(color: Colors.grey.shade300, thickness: 1),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        'or',
                        style: TextStyle(color: Colors.grey, fontSize: 16),
                      ),
                    ),
                    Expanded(
                      child: Divider(color: Colors.grey.shade300, thickness: 1),
                    ),
                  ],
                ),

                SizedBox(height: 24),

                // Social Login Buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildSocialButton(
                      onPressed: () {},
                      icon: 'assets/images/google_icon.png',
                      fallbackIcon: Icons.g_mobiledata,
                      fallbackColor: Colors.red,
                      backgroundColor: Colors.white,
                    ),
                    _buildSocialButton(
                      onPressed: () {},
                      icon: 'assets/images/apple_icon.png',
                      fallbackIcon: Icons.apple,
                      fallbackColor: Colors.white,
                      backgroundColor: Colors.black,
                    ),
                    _buildSocialButton(
                      onPressed: () {},
                      icon: 'assets/images/facebook_icon.png',
                      fallbackIcon: Icons.facebook,
                      fallbackColor: Colors.white,
                      backgroundColor: Color(0xFF1877F2),
                    ),
                    _buildSocialButton(
                      onPressed: () {},
                      icon: 'assets/images/twitter_icon.png',
                      fallbackIcon: Icons.close,
                      fallbackColor: Colors.white,
                      backgroundColor: Colors.black,
                    ),
                  ],
                ),

                SizedBox(height: 24),

                // Additional buttons for testing other screens
                Column(
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/sales_dashboard');
                      },
                      child: Text(
                        'View Sales Dashboard',
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/admin');
                      },
                      child: Text(
                        'Admin Panel',
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSocialButton({
    required VoidCallback onPressed,
    required String icon,
    required IconData fallbackIcon,
    required Color fallbackColor,
    required Color backgroundColor,
  }) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: backgroundColor,
          border: Border.all(color: Colors.grey.shade200, width: 1),
        ),
        child: Center(
          child: Image.asset(
            icon,
            width: 24,
            height: 24,
            errorBuilder: (context, error, stackTrace) {
              return Icon(fallbackIcon, color: fallbackColor, size: 24);
            },
          ),
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

    // Draw a simplified pixel pattern based on Image 3
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
