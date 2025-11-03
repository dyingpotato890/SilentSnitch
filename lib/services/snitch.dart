import 'dart:convert';
import 'dart:io';

import 'package:silent_snitch/services/celeb.dart';

class Snitch {
  Future<Map<String, List<String>>> findUnfollowed({
    required followersPath,
    required String followingPath,
  }) async {
    // Load Files
    final File followersFile = File(followersPath);
    final File followingFile = File(followingPath);

    final String followersContent = await followersFile.readAsString();
    final String followingContent = await followingFile.readAsString();

    final dynamic followersData = jsonDecode(followersContent);
    final dynamic followingData = jsonDecode(followingContent);

    // Pulling User ID And Link For Followers And Following
    List<String> followersList = [];
    List<String> followingList = [];
    List<String> followingHREF = [];

    Celebrity obj = Celebrity();
    List<String> celebrity = obj.allCeleb();

    for (var i in followersData) {
      final value = i["string_list_data"]?[0]?['value'];
      if (value != null) {
        followersList.add(value);
      }
    }

    for (var i in followingData["relationships_following"]) {
      final title = i["title"];
      final href = i["string_list_data"]?[0]?['href'];
      
      if (title != null) {
        followingList.add(title);
      }
      if (href != null) {
        followingHREF.add(href);
      }
    }

    // Find Unfollowers
    Map<String, List<String>> unfollow = {
      "Username": [],
      "Link": [],
      "Verified": [],
    };

    for (int i = 0; i < followingList.length; i++) {
      final username = followingList[i];
      if (!followersList.contains(username)) {
        unfollow['Username']?.add(username);
        unfollow['Link']?.add(followingHREF[i]);
        unfollow['Verified']?.add(
          findCeleb(username: username, celebrity: celebrity),
        );
      }
    }

    return unfollow;
  }

  String findCeleb({required username, required celebrity}) {
    if (celebrity.contains(username)) {
      return "Yes";
    } else {
      return "No";
    }
  }
}