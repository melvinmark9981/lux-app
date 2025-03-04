import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class SalesDashboard extends StatefulWidget {
  const SalesDashboard({Key? key}) : super(key: key);

  @override
  _SalesDashboardState createState() => _SalesDashboardState();
}

class _SalesDashboardState extends State<SalesDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Container(
          height: 40,
          decoration: BoxDecoration(
            color: const Color(0xFFF5F5F5),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Icon(Icons.search, color: Colors.grey),
              ),
              Text(
                'Search',
                style: TextStyle(color: Colors.grey, fontSize: 16),
              ),
            ],
          ),
        ),
        actions: [
          Container(
            margin: EdgeInsets.all(8),
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: Color(0xFFE0F7F3),
              shape: BoxShape.circle,
            ),
            child: Center(child: Icon(Icons.shopping_bag, color: Colors.pink)),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Sales Summary',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              // Summary Cards
              Container(
                height: 150,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    SummaryCard(
                      value: '8,700',
                      growth: '+3.2%',
                      title: 'TOTAL\nREVENUE',
                      icon: Icons.stacked_line_chart,
                    ),
                    SizedBox(width: 12),
                    SummaryCard(
                      value: '7,240',
                      growth: '+4.3%',
                      title: 'TOTAL\nORDERS',
                      icon: Icons.assignment,
                    ),
                    SizedBox(width: 12),
                    SummaryCard(
                      value: '5,430',
                      growth: '+6.7%',
                      title: 'DOWNLOADS',
                      icon: Icons.shopping_bag,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              // Sales Chart
              SalesChartCard(),
              SizedBox(height: 20),
              // Top Products
              TopProductsCard(),
              SizedBox(height: 20),
              // User Reviews
              UserReviewsCard(),
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

class SummaryCard extends StatelessWidget {
  final String value;
  final String growth;
  final String title;
  final IconData icon;

  const SummaryCard({
    Key? key,
    required this.value,
    required this.growth,
    required this.title,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Use a fixed aspect ratio container with no height constraints
    return AspectRatio(
      aspectRatio: 1.3, // Adjust as needed for your design
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xFFFF5A7E),
          borderRadius: BorderRadius.circular(12),
        ),
        padding: EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 12),
        child: Stack(
          children: [
            // Main content
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Top row with RM and Today badge
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'RM',
                      style: TextStyle(fontSize: 14, color: Colors.white),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                      decoration: BoxDecoration(
                        color: Colors.white24,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        'Today',
                        style: TextStyle(fontSize: 12, color: Colors.white),
                      ),
                    ),
                  ],
                ),

                // Value
                Text(
                  value,
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),

                // Growth
                Text(
                  growth,
                  style: TextStyle(fontSize: 14, color: Color(0xFF9FFFA2)),
                ),

                // Spacer to push the title to bottom
                Spacer(),

                // Title row with icon
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Title with ellipsis
                    Expanded(
                      child: Text(
                        title,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    SizedBox(width: 4),
                    // Icon
                    Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        color: Colors.white24,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(icon, color: Colors.white, size: 12),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class SalesChartCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.pink.shade100),
      ),
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Sales',
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                  Row(
                    children: [
                      Text(
                        '\$22,097',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '.00',
                        style: TextStyle(fontSize: 28, color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(color: Colors.pink.shade100),
                ),
                child: Row(
                  children: [
                    Icon(Icons.calendar_today, size: 20, color: Colors.grey),
                    SizedBox(width: 8),
                    Text('Last 4 months'),
                    SizedBox(width: 8),
                    Icon(Icons.arrow_drop_down, color: Colors.grey),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 24),
          Container(
            height: 200,
            child: BarChart(
              BarChartData(
                alignment: BarChartAlignment.spaceAround,
                maxY: 100,
                barTouchData: BarTouchData(enabled: false),
                titlesData: FlTitlesData(
                  show: true,
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: (double value, TitleMeta meta) {
                        String text;
                        switch (value.toInt()) {
                          case 0:
                            text = 'JAN';
                            break;
                          case 1:
                            text = 'FEB';
                            break;
                          case 2:
                            text = 'MAR';
                            break;
                          case 3:
                            text = 'APR';
                            break;
                          default:
                            text = '';
                        }
                        return SideTitleWidget(
                          axisSide: meta.axisSide,
                          child: Text(
                            text,
                            style: const TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                        );
                      },
                      reservedSize: 30,
                    ),
                  ),
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: (double value, TitleMeta meta) {
                        String text = '';
                        if (value == 0) {
                          text = '\$10K';
                        } else if (value == 20) {
                          text = '\$30K';
                        } else if (value == 40) {
                          text = '\$50K';
                        } else if (value == 60) {
                          text = '\$70K';
                        } else if (value == 80) {
                          text = '\$90K';
                        } else if (value == 100) {
                          text = '\$110K';
                        }
                        return SideTitleWidget(
                          axisSide: meta.axisSide,
                          child: Text(
                            text,
                            style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 12,
                            ),
                          ),
                        );
                      },
                      reservedSize: 40,
                      interval: 20,
                    ),
                  ),
                  rightTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  topTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                ),
                gridData: FlGridData(show: false),
                borderData: FlBorderData(show: false),
                barGroups: [
                  BarChartGroupData(
                    x: 0,
                    barRods: [
                      BarChartRodData(
                        toY: 60,
                        color: Color(0xFFFFDCE5),
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(6),
                        ),
                        width: 25,
                      ),
                    ],
                  ),
                  BarChartGroupData(
                    x: 1,
                    barRods: [
                      BarChartRodData(
                        toY: 40,
                        color: Color(0xFFFFDCE5),
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(6),
                        ),
                        width: 25,
                      ),
                    ],
                  ),
                  BarChartGroupData(
                    x: 2,
                    barRods: [
                      BarChartRodData(
                        toY: 80,
                        color: Color(0xFFFF5A7E),
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(6),
                        ),
                        width: 25,
                      ),
                    ],
                  ),
                  BarChartGroupData(
                    x: 3,
                    barRods: [
                      BarChartRodData(
                        toY: 65,
                        color: Color(0xFFFFDCE5),
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(6),
                        ),
                        width: 25,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TopProductsCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.pink.shade100),
      ),
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Top Products',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.file_copy_outlined, color: Colors.grey),
                    onPressed: () {},
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: Colors.pink.shade100),
                    ),
                    child: Row(
                      children: [
                        Text('Apps', style: TextStyle(fontSize: 14)),
                        SizedBox(width: 4),
                        Icon(
                          Icons.arrow_drop_down,
                          size: 20,
                          color: Colors.grey,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Text('#', style: TextStyle(color: Colors.grey)),
              ),
              Expanded(
                flex: 5,
                child: Text('Name', style: TextStyle(color: Colors.grey)),
              ),
              Expanded(
                flex: 5,
                child: Text('Popularity', style: TextStyle(color: Colors.grey)),
              ),
              Expanded(
                flex: 2,
                child: Text('Sales', style: TextStyle(color: Colors.grey)),
              ),
            ],
          ),
          SizedBox(height: 16),
          ProductItem(
            index: '01',
            name: 'Game Booster 4x Faster Pro',
            popularity: 0.7,
            color: Colors.orange,
            sales: '46%',
          ),
          SizedBox(height: 16),
          ProductItem(
            index: '02',
            name: 'Game Booster VIP Lag Fix & GFX',
            popularity: 0.3,
            color: Colors.teal.shade200,
            sales: '17%',
          ),
          SizedBox(height: 16),
          ProductItem(
            index: '03',
            name: 'H4X Macro - Game Booster Pro',
            popularity: 0.4,
            color: Colors.blue,
            sales: '19%',
          ),
          SizedBox(height: 16),
          ProductItem(
            index: '04',
            name: 'Torque Pro (OBD 2 & Car)',
            popularity: 0.5,
            color: Colors.purple.shade200,
            sales: '28%',
          ),
        ],
      ),
    );
  }
}

class ProductItem extends StatelessWidget {
  final String index;
  final String name;
  final double popularity;
  final Color color;
  final String sales;

  const ProductItem({
    Key? key,
    required this.index,
    required this.name,
    required this.popularity,
    required this.color,
    required this.sales,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Text(index, style: TextStyle(fontWeight: FontWeight.bold)),
        ),
        Expanded(
          flex: 5,
          child: Text(name, style: TextStyle(fontWeight: FontWeight.bold)),
        ),
        Expanded(
          flex: 5,
          child: Stack(
            children: [
              Container(
                height: 8,
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              Container(
                height: 8,
                width: MediaQuery.of(context).size.width * 0.3 * popularity,
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 2,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.blue.shade50,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Text(
              sales,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.blue.shade400,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class UserReviewsCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.pink.shade100),
      ),
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'User Reviews',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.star, size: 16, color: Colors.amber),
                        SizedBox(width: 4),
                        Text('4-5 Rating', style: TextStyle(fontSize: 14)),
                        SizedBox(width: 4),
                        Icon(
                          Icons.arrow_drop_down,
                          size: 20,
                          color: Colors.grey,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 8),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.calendar_today,
                          size: 16,
                          color: Colors.grey,
                        ),
                        SizedBox(width: 4),
                        Text('Last week', style: TextStyle(fontSize: 14)),
                        SizedBox(width: 4),
                        Icon(
                          Icons.arrow_drop_down,
                          size: 20,
                          color: Colors.grey,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 8),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    child: Row(
                      children: [
                        Text('Apps', style: TextStyle(fontSize: 14)),
                        SizedBox(width: 4),
                        Icon(
                          Icons.arrow_drop_down,
                          size: 20,
                          color: Colors.grey,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                flex: 2,
                child: Text('User', style: TextStyle(color: Colors.grey)),
              ),
              Expanded(
                flex: 2,
                child: Text('Product', style: TextStyle(color: Colors.grey)),
              ),
              Expanded(
                flex: 5,
                child: Text('Comments', style: TextStyle(color: Colors.grey)),
              ),
              Expanded(flex: 1, child: Container()),
            ],
          ),
          SizedBox(height: 16),
          ReviewItem(username: 'ClassicPub2245', product: 'TikTok'),
          Divider(),
          ReviewItem(username: 'Flora15567', product: 'Wechat'),
          Divider(),
          ReviewItem(username: 'Slip77890', product: 'Facebook'),
          Divider(),
          ReviewItem(username: 'Alex5670', product: 'Facebook'),
        ],
      ),
    );
  }
}

class ReviewItem extends StatelessWidget {
  final String username;
  final String product;

  const ReviewItem({Key? key, required this.username, required this.product})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.black,
                  radius: 16,
                  child: Icon(Icons.person, color: Colors.white, size: 16),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: Text(
                    username,
                    style: TextStyle(fontWeight: FontWeight.bold),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(product, style: TextStyle(fontWeight: FontWeight.w500)),
          ),
          Expanded(
            flex: 5,
            child: Text(
              'Lorem ipsum dolor sit amet consectetur. Nulla facilisis suspendisse eget finibus.',
              style: TextStyle(color: Colors.grey.shade700),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(
                'Reply',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
