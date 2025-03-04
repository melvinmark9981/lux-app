import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  // This would come from your authentication service
  bool isLoggedIn = false;

  // Sample user data
  Map<String, dynamic> userData = {
    'username': 'abc123123123',
    'email': 'abc1231@gmail.com',
    'userType': 'Member', // 'Guest' or 'Member'
    'avatar': '', // URL to avatar image if available
  };

  void toggleLoginState() {
    setState(() {
      isLoggedIn = !isLoggedIn;
      userData['userType'] = isLoggedIn ? 'Member' : 'Guest';
      if (!isLoggedIn) {
        userData['username'] = 'Guest282514';
        userData['email'] = '';
      } else {
        userData['username'] = 'abc123123123';
        userData['email'] = 'abc1231@gmail.com';
      }
    });
  }

  void navigateToEditProfile() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditProfileScreen(userData: userData),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.edit, color: Colors.black),
            onPressed: navigateToEditProfile,
          ),
          IconButton(
            icon: const Icon(Icons.settings, color: Colors.black),
            onPressed: () {
              // Navigate to settings
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Profile Header
              Center(
                child: Column(
                  children: [
                    // Avatar
                    CircleAvatar(
                      radius: 60,
                      backgroundColor: Colors.grey.shade300,
                      backgroundImage:
                          isLoggedIn && userData['avatar'].isNotEmpty
                              ? NetworkImage(userData['avatar'])
                              : null,
                      child:
                          isLoggedIn && userData['avatar'].isEmpty
                              ? const Icon(
                                Icons.person,
                                size: 60,
                                color: Colors.white,
                              )
                              : null,
                    ),
                    const SizedBox(height: 10),
                    // Username
                    Text(
                      userData['username'],
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    // Email if logged in
                    if (isLoggedIn && userData['email'].isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.only(top: 4.0),
                        child: Text(
                          userData['email'],
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey.shade600,
                          ),
                        ),
                      ),
                    const SizedBox(height: 10),
                    // User type badge
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 5,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.red.shade400),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        userData['userType'],
                        style: TextStyle(
                          color: Colors.red.shade400,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              // Login/Register or Logout button
              GestureDetector(
                onTap: toggleLoginState,
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      isLoggedIn ? 'LOG OUT' : 'LOGIN / REGISTER',
                      style: TextStyle(
                        color: Colors.red.shade400,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 30),

              // First row of menu items
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildMenuItem(Icons.shopping_cart, 'Cart'),
                  _buildMenuItem(Icons.star, 'Collection'),
                  _buildMenuItem(Icons.confirmation_number, 'Coupons'),
                  _buildMenuItem(Icons.card_giftcard, 'Gifts'),
                ],
              ),

              const SizedBox(height: 30),

              // Second row of menu items
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildMenuItem(Icons.comment, 'Comments'),
                  _buildMenuItem(Icons.calendar_today, 'Pre-Orders'),
                  _buildMenuItem(Icons.notifications, 'Notification'),
                  _buildMenuItem(Icons.view_module, 'Installation'),
                ],
              ),

              const SizedBox(height: 30),

              // Others section
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Others',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ),

              const SizedBox(height: 10),

              // Help menu item
              _buildListMenuItem(Icons.help_outline, 'Help'),

              // Feedback menu item
              _buildListMenuItem(Icons.chat_bubble_outline, 'Feedback'),

              // Check for updates menu item
              _buildListMenuItem(Icons.system_update, 'Check for updates'),

              // About menu item
              _buildListMenuItem(Icons.info_outline, 'About'),

              // For admin: Content management (if needed)
              if (isLoggedIn && userData['userType'] == 'Member')
                _buildListMenuItem(Icons.content_paste, 'Content management'),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 60,
        decoration: BoxDecoration(color: Colors.red.shade400),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildNavItem(Icons.bookmark, 'Home', true),
            _buildNavItem(Icons.grid_view, 'Apps', false),
            _buildNavItem(Icons.gamepad, 'Games', false),
            _buildNavItem(Icons.person, 'Profile', false),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem(IconData icon, String label) {
    return Column(
      children: [
        Icon(icon, color: Colors.red.shade400, size: 28),
        const SizedBox(height: 8),
        Text(label, style: const TextStyle(fontSize: 14)),
      ],
    );
  }

  Widget _buildListMenuItem(IconData icon, String label) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              border: Border.all(color: Colors.red.shade400),
            ),
            child: Icon(icon, color: Colors.red.shade400, size: 20),
          ),
          const SizedBox(width: 15),
          Text(label, style: const TextStyle(fontSize: 16)),
          const Spacer(),
          Icon(Icons.arrow_forward_ios, color: Colors.grey.shade400, size: 16),
        ],
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, bool isSelected) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          color: Colors.white.withOpacity(isSelected ? 1.0 : 0.7),
          size: 24,
        ),
        Text(
          label,
          style: TextStyle(
            color: Colors.white.withOpacity(isSelected ? 1.0 : 0.7),
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}

class EditProfileScreen extends StatefulWidget {
  final Map<String, dynamic> userData;

  const EditProfileScreen({Key? key, required this.userData}) : super(key: key);

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  late TextEditingController usernameController;
  late TextEditingController phoneController;
  late TextEditingController emailController;

  @override
  void initState() {
    super.initState();
    usernameController = TextEditingController(
      text: widget.userData['username'],
    );
    phoneController = TextEditingController(text: '123456789');
    emailController = TextEditingController(text: widget.userData['email']);
  }

  @override
  void dispose() {
    usernameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile picture section
            Center(
              child: Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        width: 120,
                        height: 120,
                        decoration: BoxDecoration(
                          color: Colors.red.shade400,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.person,
                          size: 80,
                          color: Colors.white,
                        ),
                      ),
                      Positioned(
                        right: 0,
                        bottom: 0,
                        child: Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: Colors.red,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.camera_alt,
                            color: Colors.white,
                            size: 24,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 40),

            // Username field
            Text(
              'Username',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            _buildTextField(controller: usernameController, isVerified: true),

            const SizedBox(height: 20),

            // Contact number field
            Text(
              'Contact number',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                // Country code selector
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 12,
                  ),
                  decoration: BoxDecoration(
                    border: Border(bottom: BorderSide(color: Colors.grey)),
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 30,
                        height: 20,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(
                              'https://via.placeholder.com/30x20',
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(width: 5),
                      Text('+60', style: TextStyle(fontSize: 16)),
                      Icon(Icons.arrow_drop_down),
                    ],
                  ),
                ),
                const SizedBox(width: 15),
                // Phone number input
                Expanded(
                  child: TextField(
                    controller: phoneController,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      border: UnderlineInputBorder(),
                      hintText: 'Phone number',
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            // Email field
            Text(
              'Email address',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            _buildTextField(controller: emailController, isVerified: true),

            // Email verification notice
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                'We will send related account info & product news to this verified email address.',
                style: TextStyle(color: Colors.grey, fontSize: 14),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    bool isVerified = false,
  }) {
    return Stack(
      alignment: Alignment.centerRight,
      children: [
        TextField(
          controller: controller,
          decoration: InputDecoration(border: UnderlineInputBorder()),
        ),
        if (isVerified)
          Container(
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: Colors.green,
              shape: BoxShape.circle,
            ),
            child: Icon(Icons.check, color: Colors.white, size: 16),
          ),
      ],
    );
  }
}
