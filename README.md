# SilentSnitch

<br/>

![WatchWise Logo](https://github.com/dyingpotato890/SilentSnitch/blob/main/assets/img/logo%20-%20white.png)

<br/>

**SilentSnitch** is a lightweight, privacy-focused Instagram unfollowers monitor app built with **Flutter**. Track who unfollowed you — no login, no personal credentials required.

---

## Download

**Currently, SilentSnitch is not available on the Google Play Store.**

A direct download link is provided here:

<p align="center">
  <a href="https://drive.google.com/file/d/1K6ubQeIMTJWrVTTBefILXZqstrv6oAYU/view?usp=sharing">
    <img src="https://img.shields.io/badge/⬇️ Download%20APK-blue?style=for-the-badge" alt="Download SilentSnitch" />
  </a>
</p>


---

## Features

- 🔍 Detect Instagram accounts that unfollowed you
- 🛡️ 100% secure — **no Instagram login or password required**
- 🧠 Smart tracking with local comparison
- 💾 Lightweight and offline-first
- 📱 Built using Flutter for cross-platform support

**Important Note:** Since the app doesn't connect directly to Instagram or require login, it relies on you manually providing your follower data. It cannot retroactively identify unfollowers from before your first data update.

---

### Privacy
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

## Development (For Developers)

If you'd like to contribute to SilentSnitch or run it locally:

### Prerequisites

* [Flutter SDK](https://flutter.dev/docs/get-started/install) installed on your machine.
* Basic knowledge of Flutter and Dart.

### Installation

1.  Clone the repository:
    ```bash
    git clone https://github.com/dyingpotato890/SilentSnitch.git
    cd SilentSnitch
    ```
2.  Get the dependencies:
    ```bash
    flutter pub get
    ```

### Running the App

```bash
flutter run
```

---

## Contributing

Contributions are welcome! Feel free to open issues or submit pull requests. Please follow these steps:

1. Fork the repository.
2. Create a new branch:
    ```bash
    git checkout -b feature-name
    ```
3. Commit your changes:
    ```bash
    git commit -m "Description of changes"
    ```
4. Push to the branch:
    ```bash
    git push origin feature-name
    ```
5. Submit a pull request

---

## License
This project is licensed under the GPL-3.0 License. See the `LICENSE` file for details.  
