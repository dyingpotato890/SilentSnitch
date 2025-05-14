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
  // State for filtering celebrities
  bool _hideCelebrities = false;

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
    // Get Usernames, Links and Verified status
    final List<String> usernames = widget.unfollowers["Username"] ?? [];
    final List<String> links = widget.unfollowers["Link"] ?? [];
    final List<String> verified = widget.unfollowers["Verified"] ?? [];

    // Filter out celebrities if the toggle is on
    List<String> filteredUsernames = [];
    List<String> filteredLinks = [];

    for (int i = 0; i < usernames.length; i++) {
      if (_hideCelebrities && verified[i] == "Yes") {
        continue;
      }
      filteredUsernames.add(usernames[i]);
      filteredLinks.add(links[i]);
    }

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
                        color: Colors.white.withAlpha(38),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: Center(
                          child: Icon(
                            Icons.arrow_back_ios,
                            color: Colors.white,
                            size: 20,
                          ),
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
                    const SizedBox(width: 48),
                  ],
                ),

                SizedBox(height: media.height * 0.028), // 24
                
                // Filter toggle and Results counter
                Row(
                  children: [
                    // Celebrity filter toggle
                    Expanded(
                      child: Container(
                        height: 50,
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        decoration: BoxDecoration(
                          color: Colors.white.withAlpha(20),
                          borderRadius: BorderRadius.circular(14),
                          border: Border.all(
                            color: Colors.white.withAlpha(51),
                            width: 1,
                          ),
                        ),
                        child: Row(
                          children: [
                            const Text(
                              'Hide Celebrities',
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Ubuntu',
                                fontSize: 14,
                              ),
                            ),
                            const Spacer(),
                            Switch(
                              value: _hideCelebrities,
                              onChanged: (value) {
                                setState(() {
                                  _hideCelebrities = value;
                                });
                              },
                              activeColor: const Color(0xFF6C63FF),
                              activeTrackColor: const Color(0xFF6C63FF).withAlpha(102),
                            ),
                          ],
                        ),
                      ),
                    ),
                    
                    const SizedBox(width: 12),
                    
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
                            const Color(0xFF6C63FF).withAlpha(204),
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(14),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xFF6C63FF).withAlpha(102),
                            spreadRadius: 1,
                            blurRadius: 12,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Center(
                        child: Text(
                          '${filteredUsernames.length} Accounts',
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
                  ],
                ),

                SizedBox(height: media.height * 0.018),
                
                // Results list
                Expanded(
                  child: filteredUsernames.isEmpty
                      // Empty state
                      ? Container(
                          padding: const EdgeInsets.all(24),
                          decoration: BoxDecoration(
                            color: Colors.white.withAlpha(20),
                            borderRadius: BorderRadius.circular(24),
                            border: Border.all(
                              color: Colors.white.withAlpha(25),
                              width: 1,
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.check_circle_outline,
                                color: Colors.white.withAlpha(128),
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
                                _hideCelebrities 
                                    ? 'Only celebrity accounts don\'t follow back' 
                                    : 'Everyone is following you back!',
                                style: TextStyle(
                                  color: Colors.white.withAlpha(179),
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
                                Colors.white.withAlpha(46),
                                Colors.white.withAlpha(20),
                              ],
                            ),
                            borderRadius: BorderRadius.circular(24),
                            border: Border.all(
                              color: Colors.white.withAlpha(51),
                              width: 1.5,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withAlpha(38),
                                blurRadius: 15,
                                offset: const Offset(0, 5),
                              ),
                            ],
                          ),

                          child: ListView.builder(
                            itemCount: filteredUsernames.length,
                            itemBuilder: (context, index) {
                              final username = filteredUsernames[index];
                              final link = filteredLinks[index];
                              final hasLink = link.isNotEmpty;
                              
                              // Find the original index to get verified status
                              final originalIndex = usernames.indexOf(username);
                              final isCelebrity = originalIndex != -1 && verified[originalIndex] == "Yes";

                              return GestureDetector(
                                onTap: hasLink ? () => _launchUrl(link) : null,

                                child: Container(
                                  margin: const EdgeInsets.only(bottom: 12),
                                  padding: const EdgeInsets.all(16),
                                  decoration: BoxDecoration(
                                    color: hasLink 
                                        ? Colors.white.withAlpha(25)
                                        : Colors.white.withAlpha(18),
                                    borderRadius: BorderRadius.circular(16),
                                    border: Border.all(
                                      color: hasLink 
                                          ? const Color(0xFF6C63FF).withAlpha(77)
                                          : Colors.white.withAlpha(25),
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
                                        child: Row(
                                          children: [
                                            Text(
                                              username,
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 16,
                                                fontFamily: 'Ubuntu',
                                              ),
                                            ),
                                            if (isCelebrity) ...[
                                              const SizedBox(width: 5),
                                              Container(
                                                padding: const EdgeInsets.symmetric(
                                                  horizontal: 2,
                                                  vertical: 2,
                                                ),
                                                decoration: BoxDecoration(
                                                  color: const Color(0xFF6C63FF).withAlpha(51),
                                                  borderRadius: BorderRadius.circular(10),
                                                ),
                                                child: Icon(
                                                      Icons.verified,
                                                      color: Colors.white,
                                                      size: 14,
                                                    )
                                              ),
                                            ],
                                          ],
                                        ),
                                      ),
                                      
                                      if (hasLink)
                                        Icon(
                                          Icons.open_in_new,
                                          color: Colors.white.withAlpha(153),
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