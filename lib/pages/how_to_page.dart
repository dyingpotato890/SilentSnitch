import 'package:flutter/material.dart';
import 'package:silent_snitch/widgets/background.dart';
import 'package:silent_snitch/widgets/instr_image.dart';
import 'package:silent_snitch/widgets/instr_text.dart';

class HowToPage extends StatelessWidget {
  const HowToPage({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);

    return Scaffold(
      body: Background(
        child: Stack(
          children: [
            // Main Section
            SafeArea(
              child: SingleChildScrollView(
                padding: EdgeInsets.fromLTRB(
                  media.width * 0.058,
                  media.height * 0.014,
                  media.width * 0.058,
                  media.height * 0.035,
                ),
    
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
                      ],
                    ),
    
                    SizedBox(height: media.height * 0.018),
    
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Colors.white.withOpacity(0.15),
                            Colors.white.withOpacity(0.05),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: Colors.white.withOpacity(0.2),
                          width: 1,
                        ),
                      ),
                      child: Text(
                        'SilentSnitch lets you track who unfollows you without needing to log in. Follow these two simple steps to get started.',
                        style: TextStyle(
                          fontFamily: 'Ubuntu',
                          fontSize: 18,
                          decoration: TextDecoration.none,
                          color: Colors.white,
                        ),
                      ),
                    ),
    
                    SizedBox(height: media.height * 0.028),
    
                    // SECTION 1: Getting Your Instagram Data
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Colors.black.withOpacity(0.4),
                            Colors.black.withOpacity(0.3),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(18),
                        border: Border.all(
                          color: Colors.white.withOpacity(0.1),
                          width: 1,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 12,
                            offset: const Offset(0, 5),
                          ),
                        ],
                      ),
    
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                            decoration: BoxDecoration(
                              color: const Color(0xFF6C63FF).withOpacity(0.3),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFF6C63FF),
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(Icons.download_rounded, color: Colors.white, size: 20),
                                ),
    
                                SizedBox(width: media.width * 0.02),
    
                                Flexible(
                                  child: Text(
                                    'STEP 1: Download Your Instagram Data',
                                    style: TextStyle(
                                      fontFamily: 'Ubuntu',
                                      fontSize: 18,
                                      decoration: TextDecoration.none,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
    
                          SizedBox(height: media.height * 0.018),
    
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
    
                    SizedBox(height: media.height * 0.028), // 24
    
                    // SECTION 2: Using SilentSnitch App
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Colors.black.withOpacity(0.4),
                            Colors.black.withOpacity(0.3),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(18),
                        border: Border.all(
                          color: Colors.white.withOpacity(0.1),
                          width: 1,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 12,
                            offset: const Offset(0, 5),
                          ),
                        ],
                      ),
    
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                            decoration: BoxDecoration(
                              color: const Color(0xFF6C63FF).withOpacity(0.3),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFF6C63FF),
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(Icons.app_shortcut_rounded, color: Colors.white, size: 20),
                                ),
    
                                SizedBox(width: media.width * 0.02),
    
                                Text(
                                  'STEP 2: Using SilentSnitch',
                                  style: TextStyle(
                                    fontFamily: 'Ubuntu',
                                    fontSize: 18,
                                    decoration: TextDecoration.none,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
    
                          SizedBox(height: media.height * 0.018), // 16
    
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
        ),
      ),
    );
  }
}