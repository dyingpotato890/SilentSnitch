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
      body: Background(
        child: SafeArea(
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
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.15),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ),

                    const Expanded(
                      child: Text(
                        'Unfollower Results',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontFamily: 'Ubuntu',
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),

                    // Empty space to balance the header
                    SizedBox(width: 48),
                  ],
                ),

                SizedBox(height: media.height * 0.028), // 24
                
                // Results counter
                Container(
                  height: 50,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        const Color(0xFF6C63FF),
                        const Color(0xFF6C63FF).withOpacity(0.8),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(14),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFF6C63FF).withOpacity(0.4),
                        spreadRadius: 1,
                        blurRadius: 12,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),

                  child: Center(
                    child: Text(
                      '${usernames.length} Accounts Found',
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        fontFamily: 'Ubuntu',
                        letterSpacing: 0.5,
                      ),
                    ),
                  ),
                ),

                SizedBox(height: media.height * 0.018), // 16
                
                // Results list
                Expanded(
                  child: usernames.isEmpty
                      // Empty state
                      ? Container(
                          padding: const EdgeInsets.all(24),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.08),
                            borderRadius: BorderRadius.circular(24),
                            border: Border.all(
                              color: Colors.white.withOpacity(0.1),
                              width: 1,
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.check_circle_outline,
                                color: Colors.white.withOpacity(0.5),
                                size: 64,
                              ),
                              const SizedBox(height: 16),
                              const Text(
                                'No unfollowers found',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontFamily: 'Ubuntu',
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                'Everyone is following you back!',
                                style: TextStyle(
                                  color: Colors.white.withOpacity(0.7),
                                  fontSize: 14,
                                  fontFamily: 'Ubuntu',
                                ),
                              ),
                            ],
                          ),
                        )
                      // Unfollowers list
                      : Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Colors.white.withOpacity(0.18),
                                Colors.white.withOpacity(0.08),
                              ],
                            ),
                            borderRadius: BorderRadius.circular(24),
                            border: Border.all(
                              color: Colors.white.withOpacity(0.2),
                              width: 1.5,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.15),
                                blurRadius: 15,
                                offset: const Offset(0, 5),
                              ),
                            ],
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
                                    color: hasLink 
                                        ? Colors.white.withOpacity(0.1)
                                        : Colors.white.withOpacity(0.07),
                                    borderRadius: BorderRadius.circular(16),
                                    border: Border.all(
                                      color: hasLink 
                                          ? const Color(0xFF6C63FF).withOpacity(0.3)
                                          : Colors.white.withOpacity(0.1),
                                      width: 1,
                                    ),
                                  ),

                                  child: Row(
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                            colors: [
                                              const Color.fromRGBO(131, 58, 180, 1),
                                              const Color.fromRGBO(193, 53, 132, 1),
                                            ],
                                            begin: Alignment.topLeft,
                                            end: Alignment.bottomRight,
                                          ),
                                          shape: BoxShape.circle,
                                          boxShadow: [
                                            BoxShadow(
                                              color: const Color.fromRGBO(131, 58, 180, 0.4),
                                              blurRadius: 8,
                                              offset: const Offset(0, 2),
                                            ),
                                          ],
                                        ),
                                        child: const Icon(
                                          Icons.person,
                                          color: Colors.white,
                                          size: 20,
                                        ),
                                      ),

                                      SizedBox(width: media.width * 0.035),

                                      Expanded(
                                        child: Text(
                                          username,
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontFamily: 'Ubuntu',
                                          ),
                                        ),
                                      ),
                                      
                                      if (hasLink)
                                        Icon(
                                          Icons.open_in_new,
                                          color: Colors.white.withOpacity(0.6),
                                          size: 18,
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
      ),
    );
  }
}