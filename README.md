# SilentSnitch

<br/>

![SilentSnitch Logo](https://github.com/dyingpotato890/SilentSnitch/blob/main/assets/img/logo%20-%20white.png)

<br/>

**SilentSnitch** is a lightweight, privacy-focused Instagram unfollowers monitor app built with **Flutter**. Track who unfollowed you — no login, no personal credentials required.

---

## Download

**Currently, SilentSnitch is not available on the Google Play Store.**

A direct download link is provided here:

<p align="center">
  <a href="https://drive.google.com/drive/u/2/folders/1zIktU557OuIHspF4VLEh9yVFtDI--N90">
    <img src="https://img.shields.io/badge/⬇ Download%20APK-green?style=for-the-badge" alt="Download SilentSnitch" />
  </a>
</p>

<p align="center">
  <strong>Loved it? ⭐️ Show your support by starring the repo!</strong>
</p>

---

## Features

- Detect Instagram accounts that unfollowed you
- 100% secure — **no Instagram login or password required**
- Smart tracking with local comparison
- Lightweight and offline-first

**Important Note:** Since the app doesn't connect directly to Instagram or require login, it relies on you manually providing your follower data. It cannot retroactively identify unfollowers from before your first data update.

---

## Privacy
SilentSnitch is designed with your privacy in mind.

- **No Login Required**: We never ask for your Instagram username or password.
- **Local Data Storage**: All follower data is stored locally on your device and is not transmitted externally.
- **No Third-Party Access**: The app does not interact with any third-party services to access your Instagram data.
  
---

## How To Use SilentSnitch

Follow these two simple steps to start tracking your unfollowers:

**STEP 1: Download Your Instagram Data**

1.  Go to your Instagram profile.
2.  Under `Settings and Activity` Select `Accounts Center`.
3.  Select `Your information and permissions` under `Account Settings`.
4.  Select `Download your information` under `Your information and permissions`.
5.  Select `Download or transfer information`.
6.  Select `Some of your information` to download only the necessary data.
7.  Navigate to the `Connections` section and click on `Followers and Following`.
8.  Select `Download to device`.
9.  Ensure that the following options are selected before you click `Create file`:
    * Format: JSON
    * Date range: All time
10. Wait for Instagram to send your files to your Email.

**STEP 2: Using SilentSnitch**

1.  Once you receive the email from Instagram, download and extract the ZIP file.
2.  In the Homepage of SilentSnitch, upload the following files to the designated locations, ensuring the filenames match exactly:
    * `followers.json`
    * `following_1.json`
3.  The app will process your data and display the accounts that don't follow you back.
4.  By clicking on a user in the list, you'll be redirected to their Instagram profile, allowing you to easily unfollow them if you wish.

---

## Contributing

We welcome contributions from the community! To contribute:

1. **Fork** this repository.
2. **Clone** your fork:  
   ```bash
   git clone https://github.com/your-username/SilentSnitch.git
3. Create a **new branch** for your feature or fix:
   ```bash
   git checkout -b your-feature-name
  
5. Make your changes and commit them with clear messages.
6. Push to your fork:
   ```bash
   git push origin your-feature-name

8. Open a Pull Request to the main branch of this repository.

⚠️ Note: All pull requests require approval before they are merged. Please make sure your code follows the existing style and includes appropriate documentation if needed.

---

## License
This project is licensed under the GPL-3.0 License. See the `LICENSE` file for details.  
