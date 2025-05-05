import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:silent_snitch/pages/display_page.dart';
import 'package:silent_snitch/pages/how_to_page.dart';
import 'package:silent_snitch/services/snitch.dart';
import 'package:silent_snitch/widgets/background.dart';
import 'package:silent_snitch/widgets/file_selector.dart';

class OperationPage extends StatefulWidget {
  const OperationPage({super.key});

  @override
  State<OperationPage> createState() => _OperationPageState();
}

class _OperationPageState extends State<OperationPage> {
  String? followersPath;
  String? followingPath;
  bool isFollowersSelected = false;
  bool isFollowingSelected = false;

  final Snitch snitch = Snitch();

  late Map<String, List<String>> unfollowers;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Background(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: size.height * 0.03),

                // Logo
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 12,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white.withAlpha(38),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: Colors.white.withAlpha(77),
                      width: 1,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withAlpha(26),
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [Image.asset('assets/img/logo - white.png', height: 36)],
                  ),
                ),

                SizedBox(height: size.height * 0.025),

                // Tagline
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),

                  decoration: BoxDecoration(
                    color: Colors.black.withAlpha(102),
                    borderRadius: BorderRadius.circular(30),
                  ),

                  child: const Text(
                    'Find who unfollowed you',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                      fontFamily: 'Ubuntu',
                    ),
                  ),
                ),

                SizedBox(height: size.height * 0.025),

                // Main content area
                SizedBox(
                  height: size.height * 0.58,
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 24,
                    ),

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
                          color: Colors.black.withAlpha(39),
                          blurRadius: 15,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),

                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Following selector
                        FileSelector(
                          icon: Icons.people_alt_rounded,
                          title: 'Following List',
                          subtitle:
                              isFollowingSelected
                                  ? 'File selected'
                                  : 'Tap to select following.json',
                          isSelected: isFollowingSelected,
                          onTap: () async {
                            FilePickerResult? result =
                                await FilePicker.platform.pickFiles();
                            if (result != null) {
                              setState(() {
                                followingPath = result.files.single.path!;
                                isFollowingSelected = true;
                              });
                            }
                          },
                        ),

                        const SizedBox(height: 20),

                        // Divider with text
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                height: 1,
                                color: Colors.white.withAlpha(51),
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                              ),
                              child: Text(
                                'AND',
                                style: TextStyle(
                                  color: Colors.white.withAlpha(179),
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),

                            Expanded(
                              child: Container(
                                height: 1,
                                color: Colors.white.withAlpha(51),
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 20),

                        // Followers selector
                        FileSelector(
                          icon: Icons.person_add_rounded,
                          title: 'Followers List',
                          subtitle:
                              isFollowersSelected
                                  ? 'File selected'
                                  : 'Tap to select followers_1.json',
                          isSelected: isFollowersSelected,
                          onTap: () async {
                            FilePickerResult? result =
                                await FilePicker.platform.pickFiles();
                            if (result != null) {
                              setState(() {
                                followersPath = result.files.single.path!;
                                isFollowersSelected = true;
                              });
                            }
                          },
                        ),

                        SizedBox(height: size.height * 0.07),

                        // Submit Button
                        SizedBox(
                          width: double.infinity,
                          height: 56,
                          child: ElevatedButton(
                            onPressed:
                                (isFollowersSelected && isFollowingSelected)
                                    ? () async {
                                      unfollowers = await snitch.findUnfollowed(
                                        followersPath: followersPath!,
                                        followingPath: followingPath!,
                                      );

                                      if (!mounted) return;
                                      Navigator.push(
                                        // ignore: use_build_context_synchronously
                                        context,
                                        MaterialPageRoute(
                                          builder:
                                              (context) => DisplayPage(
                                                unfollowers: unfollowers,
                                              ),
                                        ),
                                      );
                                    }
                                    : null,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF6C63FF),
                              foregroundColor: Colors.white,
                              disabledBackgroundColor: Colors.grey.withAlpha(
                                77,
                              ),
                              disabledForegroundColor: Colors.white.withAlpha(
                                128,
                              ),
                              elevation: 0,
                              shadowColor: const Color(
                                0xFF6C63FF,
                              ).withAlpha(128),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              side: BorderSide(
                                color: Colors.white.withAlpha(51),
                                width: 0.5,
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(Icons.search, size: 20),
                                const SizedBox(width: 8),
                                Text(
                                  'FIND UNFOLLOWERS',
                                  style: TextStyle(
                                    fontFamily: 'Ubuntu',
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 0.5,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(height: size.height * 0.03),

                // Help Button
                Container(
                  width: double.infinity,

                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Colors.white.withAlpha(39),
                        Colors.white.withAlpha(13),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(
                      color: Colors.white.withAlpha(51),
                      width: 1,
                    ),
                  ),

                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HowToPage(),
                        ),
                      );
                    },

                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 16,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),

                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.help_outline_rounded,
                          color: Colors.white.withAlpha(230),
                          size: 20,
                        ),

                        const SizedBox(width: 10),

                        Text(
                          'How To Use Silent Snitch',
                          style: TextStyle(
                            color: Colors.white.withAlpha(230),
                            fontFamily: 'Ubuntu',
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(height: size.height * 0.03),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
