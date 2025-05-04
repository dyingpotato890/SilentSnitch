import 'package:flutter/material.dart';
import 'package:silent_snitch/widgets/background.dart';
import 'package:silent_snitch/widgets/instr_image.dart';
import 'package:silent_snitch/widgets/instr_text.dart';

class HowToPage extends StatelessWidget {
  const HowToPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Background
        Background(),

        // Main Section
        SafeArea(
          child: SingleChildScrollView(
            // padding: const EdgeInsets.symmetric(
            //   horizontal: 24.0,
            //   vertical: 32.0,
            // ),

            padding: EdgeInsets.fromLTRB(24, 10, 24, 32),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                        'How To Use SilentSnitch',
                        style: TextStyle(
                          fontFamily: 'Ubuntu',
                          fontSize: 20,
                          decoration: TextDecoration.none,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    const SizedBox(width: 48),
                  ],
                ),


                const SizedBox(height: 16),

                Text(
                  'SilentSnitch lets you track who unfollows you without needing to log in. Follow these two simple steps to get started.',
                  style: TextStyle(
                    fontFamily: 'Ubuntu',
                    fontSize: 18,
                    decoration: TextDecoration.none,
                    color: Colors.white,
                  ),
                ),

                const SizedBox(height: 24),

                // SECTION 1: Getting Your Instagram Data
                Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.black.withAlpha(77),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.download_rounded, color: Colors.white),

                          SizedBox(width: 8),

                          Flexible(
                            child: Text(
                              'STEP 1: Download Your Instagram Data',
                              style: TextStyle(
                                fontFamily: 'Ubuntu',
                                fontSize: 20,
                                decoration: TextDecoration.none,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 16),

                      InstrText(
                        step: '1',
                        instr: 'Go to your Instagram profile.',
                      ),

                      InstrImage(
                        step: '2',
                        instr:
                            "Under 'Settings and Activity' Select 'Accounts Center'",
                        imgPath: 'assets/img/accountscenter.png',
                      ),

                      InstrImage(
                        step: '3',
                        instr:
                            "Select 'Your information and permissions' under 'Account Settings'.",
                        imgPath: 'assets/img/accountsettings.png',
                      ),

                      InstrImage(
                        step: '4',
                        instr:
                            "Select 'Download your information' under 'Your information and permissions'.",
                        imgPath: 'assets/img/yourinfoandperm.jpg',
                      ),

                      InstrImage(
                        step: '5',
                        instr: "Select 'Download or transfer information'.",
                        imgPath: 'assets/img/download.png',
                      ),

                      InstrImage(
                        step: '6',
                        instr:
                            "Select 'Some of your information' to download only the necessary data.",
                        imgPath: 'assets/img/howmuchinfo.png',
                      ),

                      InstrImage(
                        step: '7',
                        instr:
                            "Navigate to the 'Connections' section and click on 'Followers and Following'.",
                        imgPath: 'assets/img/connections.png',
                      ),

                      InstrImage(
                        step: '8',
                        instr: "Select 'Download to device'",
                        imgPath: 'assets/img/whatdoyouwant.jpg',
                      ),

                      InstrImage(
                        step: '9',
                        instr:
                            "Ensure that the following options are selected before you click 'Create file'",
                        imgPath: 'assets/img/createfiles.jpg',
                      ),

                      InstrText(
                        step: '10',
                        instr:
                            'Wait for Instagram to send your files to your Email',
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 24),

                // SECTION 2: Using SilentSnitch App
                Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.black.withAlpha(77),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.app_shortcut_rounded, color: Colors.white),
                          SizedBox(width: 8),
                          Text(
                            'STEP 2: Using SilentSnitch',
                            style: TextStyle(
                              fontFamily: 'Ubuntu',
                              fontSize: 20,
                              decoration: TextDecoration.none,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 16),

                      InstrText(
                        step: '1',
                        instr:
                            'Once you receive the email from Instagram, download and extract the ZIP file',
                      ),

                      InstrText(
                        step: '2',
                        instr:
                            'In the Homepage, upload the files to the designated location, ensuring the filenames match exactly.',
                      ),

                      InstrText(
                        step: '3',
                        instr:
                            "The app will process your data and display the accounts that don't follow you back.",
                      ),

                      InstrText(
                        step: '4',
                        instr:
                            "By clicking on a card, you'll be redirected to their profile, allowing you to unfollow them.",
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
