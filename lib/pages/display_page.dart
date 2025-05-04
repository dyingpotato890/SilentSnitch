import 'package:flutter/material.dart';
import 'package:silent_snitch/widgets/background.dart';
import 'package:url_launcher/url_launcher.dart';

class DisplayPage extends StatefulWidget {
  final Map<String, List<String>> unfollowers;

  const DisplayPage({super.key, required this.unfollowers});

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
    // Get Usernames And Links
    final List<String> usernames = widget.unfollowers["Username"] ?? [];
    final List<String> links = widget.unfollowers["Link"] ?? [];

    var media = MediaQuery.sizeOf(context);

    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          // Background
          Background(),

          // Main Content
          SafeArea(
            child: Padding(
              padding: EdgeInsets.fromLTRB(
                media.width * 0.058,
                media.height * 0.014,
                media.width * 0.058,
                media.height * 0.035,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Header
                  Row(
                    children: [
                      IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                        ),
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

                      SizedBox(width: media.width * 0.1),
                    ],
                  ),

                  SizedBox(height: media.height * 0.028), // 24
                  // Results counter
                  Container(
                    height: 40,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
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

                  SizedBox(height: media.height * 0.018), // 16
                  // Results list
                  Expanded(
                    child:
                        usernames.isEmpty
                            // Empty state
                            ? const Center(
                              child: Text(
                                'No unfollowers found',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
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
                                    onTap:
                                        hasLink
                                            ? () => _launchUrl(links[index])
                                            : null,

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
                                            child: Icon(
                                              Icons.person,
                                              color: Colors.white,
                                            ),
                                          ),

                                          SizedBox(width: media.width * 0.035),

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
