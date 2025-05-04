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
  late String followersPath;
  late String followingPath;

  Snitch obj = Snitch();

  late Map<String, List<String>> remove;

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);

    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Background(),

          // Main
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(24, 20, 24, 80),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: media.height * 0.014),

                  Image.asset('assets/img/logo.png'),

                  SizedBox(height: media.height * 0.014),

                  const Text(
                    'Find out who unfollowed you',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black87,
                      fontFamily: 'Ubuntu',
                    ),
                    textAlign: TextAlign.center,
                  ),

                  SizedBox(height: media.height * 0.06),

                  SizedBox(
                    height: media.height * 0.53,
                    child: Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(24),
                        decoration: BoxDecoration(
                          color: Colors.white.withAlpha(51),
                          borderRadius: BorderRadius.circular(24),
                        ),

                        child: Column(
                          children: [
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  // Following
                                  FileSelector(
                                    icon: Icons.people_outline,
                                    label: 'Select Following List',
                                    filename: 'following.json',
                                    onTap: () async {
                                      FilePickerResult? result =
                                          await FilePicker.platform.pickFiles();

                                      if (result != null) {
                                        followingPath =
                                            result.files.single.path!;
                                      }
                                    },
                                  ),

                                  const SizedBox(height: 40),

                                  // Followers
                                  FileSelector(
                                    icon: Icons.person_add_outlined,
                                    label: 'Select Followers List',
                                    filename: 'followers_1.json',
                                    onTap: () async {
                                      FilePickerResult? result =
                                          await FilePicker.platform.pickFiles();

                                      if (result != null) {
                                        followersPath =
                                            result.files.single.path!;
                                      }
                                    },
                                  ),

                                  const SizedBox(height: 80),

                                  // Submit Button
                                  SizedBox(
                                    height: media.height * 0.046,
                                    width: media.width * 0.78,
                                    child: ElevatedButton(
                                      onPressed: () async {
                                        remove = await obj.findUnfollowed(
                                          followersPath: followersPath,
                                          followingPath: followingPath,
                                        );

                                        Navigator.push(
                                          // ignore: use_build_context_synchronously
                                          context,
                                          MaterialPageRoute(
                                            builder:
                                                (context) => DisplayPage(
                                                  unfollowers: remove,
                                                ),
                                          ),
                                        );
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.white,
                                        foregroundColor: const Color.fromRGBO(
                                          88,
                                          81,
                                          219,
                                          1,
                                        ),
                                        // padding: const EdgeInsets.symmetric(vertical: 16),
                                        shadowColor: Color.fromRGBO(
                                          88,
                                          81,
                                          219,
                                          1,
                                        ),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(12),
                                        ),
                                        elevation: 0,
                                      ),
                                      child: const Text(
                                        'FIND UNFOLLOWERS',
                                        style: TextStyle(
                                          fontFamily: 'Ubuntu',
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: media.height * 0.05),

                  Center(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white.withAlpha(70),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(width: 1, color: Colors.white30),
                      ),

                      child: TextButton(
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 24,
                            vertical: 12,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HowToPage(),
                            ),
                          );
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.help_outline_rounded,
                              color: Colors.black87,
                              size: 20,
                            ),
                            SizedBox(width: 8),
                            Text(
                              'How To Use SilentSnitch',
                              style: TextStyle(
                                color: Colors.black87,
                                fontFamily: 'Ubuntu',
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
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
