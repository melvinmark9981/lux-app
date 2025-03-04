import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  bool _agreedToTerms = false;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _verificationController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _verificationController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

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
                      'assets/images/pixel_logo.png',
                      height: 100,
                      width: 100,
                      errorBuilder: (context, error, stackTrace) {
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

                // REGISTRATION Text
                Text(
                  'REGISTRATION',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    letterSpacing: 1.5,
                  ),
                ),

                SizedBox(height: 40),

                // Email Address Field
                Container(
                  decoration: BoxDecoration(
                    color: Color(0xFFF5F5F5),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: TextField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      hintText: 'Email Address',
                      hintStyle: TextStyle(color: Colors.grey, fontSize: 16),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 18,
                      ),
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),
                ),

                SizedBox(height: 16),

                // Verification Code Field with Send button
                Container(
                  decoration: BoxDecoration(
                    color: Color(0xFFF5F5F5),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _verificationController,
                          decoration: InputDecoration(
                            hintText: 'Verification Code',
                            hintStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 16,
                            ),
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 18,
                            ),
                          ),
                          keyboardType: TextInputType.number,
                        ),
                      ),
                      Container(
                        height: 56,
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Center(
                          child: Text(
                            'Send',
                            style: TextStyle(
                              color: Color(0xFFFF3355),
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 16),

                // Password Field with hint
                Container(
                  decoration: BoxDecoration(
                    color: Color(0xFFF5F5F5),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: TextField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText:
                          '8-30 characters (mix of both digits & letters)',
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

                // Confirm Password Field
                Container(
                  decoration: BoxDecoration(
                    color: Color(0xFFF5F5F5),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: TextField(
                    controller: _confirmPasswordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: 'Confirm Password',
                      hintStyle: TextStyle(color: Colors.grey, fontSize: 16),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 18,
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 24),

                // Terms Checkbox
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 24,
                      height: 24,
                      child: Checkbox(
                        value: _agreedToTerms,
                        onChanged: (value) {
                          setState(() {
                            _agreedToTerms = value ?? false;
                          });
                        },
                        activeColor: Color(0xFFFF3355),
                        side: BorderSide(color: Color(0xFFFF3355), width: 1.5),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                    ),
                    SizedBox(width: 12),
                    Expanded(
                      child: RichText(
                        text: TextSpan(
                          text: 'Read and agree to the ',
                          style: TextStyle(color: Colors.grey, fontSize: 14),
                          children: [
                            _buildTermsLink('Terms of Service'),
                            TextSpan(text: ', '),
                            _buildTermsLink('Privacy Policy'),
                            TextSpan(text: ', '),
                            _buildTermsLink('Community User Agreement'),
                            TextSpan(text: ', and '),
                            _buildTermsLink('Community Privacy Agreement'),
                            TextSpan(text: '.'),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 24),

                // Register Button
                Container(
                  width: double.infinity,
                  height: 55,
                  child: ElevatedButton(
                    onPressed:
                        _agreedToTerms
                            ? () {
                              Navigator.pushNamed(context, '/profile_setup');
                            }
                            : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFFF4D67),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 0,
                      disabledBackgroundColor: Color(
                        0xFFFF4D67,
                      ).withOpacity(0.7),
                    ),
                    child: Text(
                      'Register',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 24),

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

                // Return to Login
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacementNamed(context, '/login');
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Return to Login',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey.shade700,
                        ),
                      ),
                      Icon(Icons.chevron_right, color: Colors.grey.shade700),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  TextSpan _buildTermsLink(String text) {
    return TextSpan(
      text: text,
      style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold),
      recognizer:
          TapGestureRecognizer()
            ..onTap = () {
              // Handle terms link tap
            },
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
