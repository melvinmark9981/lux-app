import 'package:flutter/material.dart';

class AdminPage extends StatefulWidget {
  const AdminPage({Key? key}) : super(key: key);

  @override
  _AdminPageState createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final List<String> _tabTitles = ['Users', 'Content', 'Analytics', 'Products'];

  // Sample data for users
  final List<Map<String, dynamic>> _users = List.generate(
    10,
    (index) => {
      'id': index + 1,
      'username': 'User ${index + 1}',
      'email': 'user${index + 1}@example.com',
      'userType': index % 3 == 0 ? 'Admin' : 'Member',
      'avatar': '',
      'status': index % 4 == 0 ? 'Inactive' : 'Active',
    },
  );

  // Sample data for content
  final List<Map<String, dynamic>> _content = List.generate(
    5,
    (index) => {
      'id': index + 1,
      'title': 'Content ${index + 1}',
      'type': index % 2 == 0 ? 'Article' : 'Review',
      'status': index % 3 == 0 ? 'Draft' : 'Published',
      'date': '2025-02-${10 + index}',
    },
  );

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabTitles.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Admin Dashboard',
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings, color: Colors.black),
            onPressed: () {
              // Navigate to settings
            },
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          isScrollable: true,
          labelColor: Colors.red.shade400,
          unselectedLabelColor: Colors.grey,
          indicatorColor: Colors.red.shade400,
          tabs: _tabTitles.map((title) => Tab(text: title)).toList(),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildUsersTab(),
          _buildContentTab(),
          _buildAnalyticsTab(),
          _buildProductsTab(),
        ],
      ),
      bottomNavigationBar: Container(
        height: 60,
        decoration: BoxDecoration(color: Colors.red.shade400),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildNavItem(Icons.bookmark, 'Home', false),
            _buildNavItem(Icons.grid_view, 'Apps', false),
            _buildNavItem(Icons.gamepad, 'Games', false),
            _buildNavItem(Icons.person, 'Profile', true),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red.shade400,
        onPressed: () {
          // Action based on current tab
          switch (_tabController.index) {
            case 0:
              _showAddUserDialog();
              break;
            case 1:
              _showAddContentDialog();
              break;
            default:
              break;
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildUsersTab() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Search users...',
              prefixIcon: const Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              filled: true,
              fillColor: Colors.grey.shade100,
            ),
            onChanged: (value) {
              // Implement search functionality
            },
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: _users.length,
            itemBuilder: (context, index) {
              final user = _users[index];
              return Card(
                margin: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 8.0,
                ),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.grey.shade300,
                    child: Text(user['username'][0]),
                  ),
                  title: Text(user['username']),
                  subtitle: Text(user['email']),
                  trailing: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color:
                          user['userType'] == 'Admin'
                              ? Colors.blue.shade100
                              : Colors.green.shade100,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      user['userType'],
                      style: TextStyle(
                        color:
                            user['userType'] == 'Admin'
                                ? Colors.blue.shade800
                                : Colors.green.shade800,
                      ),
                    ),
                  ),
                  onTap: () {
                    // View/edit user details
                  },
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildContentTab() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Search content...',
              prefixIcon: const Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              filled: true,
              fillColor: Colors.grey.shade100,
            ),
            onChanged: (value) {
              // Implement search functionality
            },
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: _content.length,
            itemBuilder: (context, index) {
              final content = _content[index];
              return Card(
                margin: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 8.0,
                ),
                child: ListTile(
                  leading: Icon(
                    content['type'] == 'Article'
                        ? Icons.article
                        : Icons.rate_review,
                    color: Colors.red.shade400,
                  ),
                  title: Text(content['title']),
                  subtitle: Text("${content['type']} • ${content['date']}"),
                  trailing: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color:
                          content['status'] == 'Published'
                              ? Colors.green.shade100
                              : Colors.amber.shade100,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      content['status'],
                      style: TextStyle(
                        color:
                            content['status'] == 'Published'
                                ? Colors.green.shade800
                                : Colors.amber.shade800,
                      ),
                    ),
                  ),
                  onTap: () {
                    // View/edit content
                  },
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildAnalyticsTab() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.bar_chart, size: 80, color: Colors.red.shade200),
          const SizedBox(height: 20),
          Text(
            'Analytics Dashboard',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Text(
            'Visualize app performance and user data',
            style: TextStyle(color: Colors.grey.shade600),
          ),
          const SizedBox(height: 30),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red.shade400,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
            ),
            onPressed: () {
              // Generate analytics report
            },
            child: const Text('Generate Report'),
          ),
        ],
      ),
    );
  }

  Widget _buildProductsTab() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.shopping_bag, size: 80, color: Colors.red.shade200),
          const SizedBox(height: 20),
          Text(
            'Product Management',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Text(
            'Manage your products and inventory',
            style: TextStyle(color: Colors.grey.shade600),
          ),
          const SizedBox(height: 30),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red.shade400,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
            ),
            onPressed: () {
              // Add new product
            },
            child: const Text('Add New Product'),
          ),
        ],
      ),
    );
  }

  void _showAddUserDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Add New User'),
          content: const SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Username',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'User Type',
                    border: OutlineInputBorder(),
                  ),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red.shade400,
              ),
              onPressed: () {
                // Add user logic
                Navigator.pop(context);
              },
              child: const Text('Add User'),
            ),
          ],
        );
      },
    );
  }

  void _showAddContentDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Add New Content'),
          content: const SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Title',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Type',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Status',
                    border: OutlineInputBorder(),
                  ),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red.shade400,
              ),
              onPressed: () {
                // Add content logic
                Navigator.pop(context);
              },
              child: const Text('Add Content'),
            ),
          ],
        );
      },
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
