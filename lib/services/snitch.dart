import 'dart:convert';
import 'dart:io';

class Snitch {

  Future<Map<String, List<String>>> findUnfollowed({required followersPath, required String followingPath}) async {
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

    for (var i in followersData) {
      followersList.add(i["string_list_data"][0]['value']);
    }

    for (var i in followingData["relationships_following"]) {
      followingList.add(i["string_list_data"][0]['value']);
      followingHREF.add(i["string_list_data"][0]['href']);
    }

    // Find Unfollowers
    Map<String, List<String>> unfollow = {
      "Username": [],
      "Link": [],
    };

    for (var i in followingList) {
      if (!followersList.contains(i)) {
        unfollow['Username']?.add(i);
        unfollow['Link']?.add(followingHREF[followingList.indexOf(i)]);
      }
    }

    return unfollow;
  }
}