import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:dynamic_background/domain/models/painter_data/lava_painter_data.dart';
import 'package:dynamic_background/widgets/views/dynamic_bg.dart';

class DisplayPage extends StatefulWidget {
  final Map<String, List<String>> unfollowers;

  const DisplayPage({
    super.key,
    required this.unfollowers,
  });

  @override
  State<DisplayPage> createState() => _DisplayPageState();
}

class _DisplayPageState extends State<DisplayPage> {

  // URL launcher
  void _launchUrl(String url) async {
    try {
      final uri = Uri.parse(url);
      if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
        throw Exception('Could not launch $url');
      }
    } catch (e) {
      print('Error launching URL: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    // Get usernames from the map
    final List<String> usernames = widget.unfollowers["Username"] ?? [];
    final List<String> links = widget.unfollowers["Link"] ?? [];
    
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          // Background
          DynamicBg(
            duration: const Duration(seconds: 35),
            painterData: LavaPainterData(
              width: 250.0,
              widthTolerance: 75.0,
              growAndShrink: true,
              growthRate: 10.0,
              growthRateTolerance: 5.0,
              blurLevel: 25.0,
              numBlobs: 5,
              backgroundColor: Color.fromRGBO(88, 81, 219, 1),
              colors: [
                Color.fromRGBO(88, 81, 219, 1),
                Color.fromRGBO(131, 58, 180, 1),
                Color.fromRGBO(193, 53, 132, 1),
                Color.fromRGBO(225, 48, 108, 1),
                Color.fromRGBO(253, 29, 29, 1),
                Color.fromRGBO(245, 96, 64, 1),
                Color.fromRGBO(247, 119, 55, 1),
                Color.fromRGBO(252, 175, 69, 1),
                Color.fromRGBO(255, 220, 128, 1),
              ],
              allSameColor: false,
              fadeBetweenColors: true,
              changeColorsTogether: false,
              speed: 20.0,
              speedTolerance: 5.0,
            ),
            child: Container(),
          ),

          // Main Content
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(24, 20, 24, 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Header
                  Row(
                    children: [
                      IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
                      ),

                      const Expanded(
                        child: Text(
                          'Unfollower Results',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      
                      const SizedBox(width: 48),
                    ],
                  ),

                  const SizedBox(height: 24),

                  // Results counter
                  Container(
                    height: 40,
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: Text(
                        '${usernames.length} Accounts Found',
                        style: const TextStyle(
                          color: Color.fromRGBO(88, 81, 219, 1),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  
                  const SizedBox(height: 16),
                  
                  // Results list
                  Expanded(
                    child: usernames.isEmpty
                      // Empty state
                      ? const Center(
                          child: Text(
                            'No unfollowers found',
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                        )
                      // Unfollowers list
                      : Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.white.withAlpha(51),
                            borderRadius: BorderRadius.circular(24),
                          ),
                          
                          child: ListView.builder(
                            itemCount: usernames.length,
                            itemBuilder: (context, index) {
                              final username = usernames[index];
                              final link = links[index];                            
                              final hasLink = link.isNotEmpty;
                              
                              return GestureDetector(
                                onTap: hasLink ? () => _launchUrl(links[index]) : null,
                                
                                child: Container(
                                  margin: const EdgeInsets.only(bottom: 12),
                                  padding: const EdgeInsets.all(16),
                                  decoration: BoxDecoration(
                                    color: Colors.white.withAlpha(26),
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  
                                  child: Row(
                                    children: [
                                      const CircleAvatar(
                                        backgroundColor: Colors.white24,
                                        child: Icon(Icons.person, color: Colors.white),
                                      ),

                                      const SizedBox(width: 16),

                                      Expanded(
                                        child: Text(
                                          username,
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
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