import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: 'World Time',
      theme: const CupertinoThemeData(
        primaryColor: Colors.blueAccent,
        brightness: Brightness.light,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: const Color.fromARGB(255, 207, 204, 204),
      child: SafeArea(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color:Color.fromARGB(255, 207, 204, 204),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            _buildHeaderImage('assets/china.png'), 
                            const SizedBox(width: 8),
                            _buildHeaderImage('assets/melbourne.png'), 
                            const SizedBox(width: 8),
                            _buildHeaderImage('assets/paris.png'), 
                            const SizedBox(width: 8),
                            _buildHeaderImage('assets/tokyo.png'), 
                          ],
                        ),
                        Container(
                          width: 32,
                          height: 32,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 255, 255, 255),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: const Icon(
                            CupertinoIcons.add,
                            color: Colors.black,
                            size: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(16.0, 0, 16.0, 24.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'World Time',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return _buildTimeZoneCard(
                      TimeZoneData(
                        city: [
                          'Tokyo',
                          'Sydney', 
                          'Los Angeles',
                          'New York',
                          'London'
                        ][index],
                        timezone: [
                          'UTC+9',
                          'UTC+11',
                          'UTC-8', 
                          'UTC-5',
                          'UTC+0'
                        ][index],
                        time: [
                          '01:40',
                          '03:40',
                          '08:40',
                          '11:40', 
                          '16:40'
                        ][index],
                        emoji: [
                          '🌙',
                          '🌙',
                          '☀️',
                          '☀️',
                          '☀️'
                        ][index],
                        isSelected: index == 2,
                      )
                    );
                  },
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(
                    CupertinoIcons.search,
                    color: Colors.grey,
                    size: 24,
                  ),
                  Icon(
                    CupertinoIcons.clock,
                    color: Colors.grey,
                    size: 24,
                  ),
                  Icon(
                    CupertinoIcons.globe,
                    color: Colors.black,
                    size: 24,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeaderImage(String imagePath) {
    return Container(
      width: 32,
      height: 32,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.grey[300],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Image.asset(
          imagePath,
          width: 32,
          height: 32,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                color: Colors.grey[400],
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Icon(
                CupertinoIcons.globe,
                color: Colors.white,
                size: 16,
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildTimeZoneCard(TimeZoneData timeZone) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: timeZone.isSelected ? Colors.black : const Color.fromARGB(255, 207, 204, 204),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Colors.white,
          width: 2,
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  timeZone.timezone,
                  style: TextStyle(
                    color: timeZone.isSelected ? Colors.grey[400] : Colors.grey[600],
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  timeZone.city,
                  style: TextStyle(
                    color: timeZone.isSelected ? Colors.white : Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Text(
                timeZone.time,
                style: TextStyle(
                  color: timeZone.isSelected ? Colors.white : Colors.black,
                  fontSize: 32,
                  fontWeight: FontWeight.w300,
                  fontFamily: 'SF Pro Display',
                ),
              ),
              const SizedBox(width: 8),
              Text(
                timeZone.emoji,
                style: const TextStyle(fontSize: 20),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class TimeZoneData {
  final String city;
  final String timezone;
  final String time;
  final String emoji;
  final bool isSelected;

  const TimeZoneData({
    required this.city,
    required this.timezone,
    required this.time,
    required this.emoji,
    required this.isSelected,
  });
}