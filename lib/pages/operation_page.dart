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
                  const Text(
                    'Unfollower Detector',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(height: 12),

                  const Text(
                    'Find out who unfollowed you',
                    style: TextStyle(fontSize: 16, color: Colors.white70),
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(height: 60),

                  SizedBox(
                    height: 500,
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
                                            result
                                                .files
                                                .single
                                                .path!;
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
                                            result
                                                .files
                                                .single
                                                .path!; // print('File Path: ${filePath}');
                                      }
                                    },
                                  ),

                                  const SizedBox(height: 80),

                                  // Submit Button
                                  SizedBox(
                                    height: 45,
                                    width: 320,
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
                                          borderRadius: BorderRadius.circular(
                                            12,
                                          ),
                                        ),
                                        side: BorderSide(
                                          width: 1,
                                          color: Color.fromRGBO(88, 81, 219, 1),
                                        ),
                                        elevation: 0,
                                      ),
                                      child: const Text(
                                        'FIND UNFOLLOWERS',
                                        style: TextStyle(
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

                  const SizedBox(height: 30),

                  Center(
                    child: TextButton(
                      style: ButtonStyle(
                        foregroundColor: WidgetStateColor.resolveWith(
                          (Set<WidgetState> states) =>
                              const Color.fromARGB(255, 254, 254, 254),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder:
                            (context) => HowToPage()
                          )
                        );
                      },

                      child: Text('How To Use SilentSnitch'),
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
