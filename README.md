# Zenput

**Zenput** is a project focused on creating a dynamic form-based
system for server usage and data analysis. It allows users to generate
custom forms, collect data efficiently, and analyze reports to gain
actionable insights. This tool is ideal for streamlining data
collection and improving decision-making through detailed analysis.

This project serves as a basic Flutter template utilizing GetX for state management.

## Features

This starter template includes the following features:

1. **Makefile Integration**
    - A `Makefile` is provided to simplify the execution of various commands. If you're unfamiliar with Makefiles, consider looking up some online resources to understand how they work.

2. **SharedPreference Helper**
    - A `SharedPreference` helper class is included to manage shared preferences. Feel free to modify this class according to your specific requirements.

3. **Firebase Helper**
    - The project includes a Firebase helper class that initializes all Firebase-related services. Please make sure to configure Firebase in your project first.

4. **API Integration**
    - API calling is handled using the Dio client, complete with interceptors and loggers. *(Note: Implement response handling in a dedicated class as a TODO item.)*

5. **Asset and Color Management with flutter_gen**
    - We use `flutter_gen` for managing assets and colors, which generates files to make these easier to manage.

6. **Icon Management with flutter_icons**
    - The project includes the `flutter_icons` package. To use it, simply configure your icons in the `pubspec.yaml` file.

7. **JSON Serialization with json_serializable**
    - The `json_serializable` package is implemented for generating `toJson` and `fromJson` methods, making it easier to work with JSON.

8. **Package and App Name Configuration**
    - You can easily change the package name and app name. The necessary packages for this task are already installed.

9. **Theme Configuration**
    - The template includes a theme configuration. You can modify it to suit your needs.

10. **Localization Configuration**
- The template includes a localization configuration. You can modify it to suit your needs.

11. **Custom Snack Bars**
- The template includes a Custom Snack Bars. You can modify it to suit your needs.

12. **Added Deep Linking Files**
    - Deep linking is used to open app from links (FYI when you want deep linking to work you need to configure routes) you can find deep linking files in /deeplinking_file
      folder. Also upload this files in .well-known and do the setup of deep linking


## Getting Started

Currently, we are using Flutter version `3.22.2` and Dart version `3.4.3`.

### Initial Setup Steps:

1. **Open your terminal and navigate to the project directory.**
2. Run the following commands based on your operating system:

    - **For macOS:**
      ```bash
      make initial_setup_commands
      ```

    - **For Windows:**
        - If you haven't installed `make` yet, refer to this guide: [How to Run a Makefile in Windows](https://medium.com/@samsorrahman/how-to-run-a-makefile-in-windows-b4d115d7c516).
        - Once `make` is installed, run:
          ```bash
          make initial_setup_commands
          ```
        - Alternatively, you can manually execute the commands listed under `initial_setup_commands` in the `Makefile`.

After completing these steps, you should be all set to run the project.

## SharedPreference Helper
You can find these file in following directory : /lib/data/utils/my_shared_pref.dart
You can update this file as per your needs

## Firebase Helper
You can find these file in following directory : /lib/data/utils/firebase_helper.dart
To use this firebase helper you need to configure firebase into you flutter project.
You will find all the configuration about notification, Remote Config, crashlytics.
1. Firebase Notifications (We have also configured awesome_notifications).
2. Firebase Remote Configuration
3. Firebase Crashlytics

##### Important Note
IOS require few more steps from your side to receive fcm notifications follow the [Docs](https://firebase.flutter.dev/docs/messaging/apple-integration/) steps and after that everything should be working fine from flutter side


## API Integration

You can find API Integrations related files in following directory : /lib/domain folder.
we have everything related to API integrations.
We are using DIO client for making API calls.
Please use following https methods like this
   ```bash
    DioAPIClient.get({please put necessary function parameters})
    DioAPIClient.post({please put necessary function parameters})
    DioAPIClient.put({please put necessary function parameters})
    DioAPIClient.delete({please put necessary function parameters})
   ```

There is a authentication interceptor in following directory: /lib/domain/network/interceptors/authentication_interceptor.dart
Please write a `Authorization` headers in authentication_interceptor.dart file.

## Asset and Color Management with flutter_gen

##### Important Note
Whenever you add new images or svg's run following command and also read about flutter_gen to know more:

- **For macOS:**
   ```bash
   make gen
   ```

- **For Windows:**
    - If you haven't installed `make` yet, refer to this guide: [How to Run a Makefile in Windows](https://medium.com/@samsorrahman/how-to-run-a-makefile-in-windows-b4d115d7c516).
    - Once `make` is installed, run:
      ```bash
      make gen
      ```
    - Alternatively, you can manually execute the commands listed under `gen` in the `Makefile`.


   ```bash
    Assets.images.samplePng.image();
    Assets.images.sampleSvg.svg();
   ```

## Icon Management with flutter_icons
Change app launch icon (replace assets/logo/app_icon.png with your app icon) then run this command
   ```
   dart run flutter_launcher_icons:main
   ```

## JSON Serialization with json_serializable
Please refer `json_serializable` [package](https://pub.dev/packages/json_serializable) to create toJson and fromJson.

## Package and App Name Configuration
- Change app package name
    ```
    flutter pub run change_app_package_name:main com.new.package.name
    ```

- Change app name
    ```
    flutter pub run rename_app:main all="My App Name"
    ```

## Theme Configuration

- Change theme
   ```dart
   MyTheme.changeTheme()
   ```

- Check current theme
   ```dart
   bool isThemeLight = MyTheme.getThemeIsLight()
   ```

## Localization Configuration

- Change app locale
   ```dart
   LocalizationService.updateLanguage('en')
   ```

- Get current locale

    ```dart
    LocalizationService.getCurrentLocal()
    ```
- Use translation

   ```dart
   Text(Strings.hello.tr)
   ```

## Custom Snack Bars

Use following functions to show snack bars
   ```dart
    CustomSnackBar.showCustomSnackBar(title: 'Done successfully!', message: 'item added to wishlist')
    CustomSnackBar.showCustomErrorSnackBar(title: 'Failed!', message: 'failed to load data')
    CustomSnackBar.showCustomToast(message: 'added to card')
    CustomSnackBar.showCustomErrorToast(message: 'added to card')
   ```

## Deep Linking Setup

    For Android: 
        In android/app/src/main/AndroidManifest.xml file please find these following tag
        <meta-data
            android:name="flutter_deeplinking_enabled"
            android:value="true" />
        You will find the comment there please do the needful changes

    For IOS got to Signing Capabilities and add Assiciates Domains
        Add domain in follwoing format:  applinks:domainname.com


## Keystore Credentials
- Alias : ``
- Password : ``
- JKS file : _Contact With Project Manager_

**⚠️ Warning**
> _This is confidential information do not share with others._

## Technical Requirements
Zenput uses the number of open source projects to work properly
- Flutter
- Java/Kotlin
- Swift

## Development Requirements
- Flutter Version : `3.22`
- Dart Version : `3.4.0`
- Java (Android Studio Default JDK) : `17.0.4`

## Gitlab
Zenput using `gitlab` powerful version control system to keep track of
changes to your project. Below are the branches.
- `main`
- `development`
- `production`


## Project Structure
``` css
.
├── android
├── deeplinking_files
│   └── .well-known
├── ios
├── assets
│   ├── color
│   ├── google_fonts
│   ├── images
│   │   ├── icons
│   │   └── images
│   ├── logo
│   └── svg
├── lib
│   ├── config
│   │   ├── custom_packages
│   │   ├── gen
│   │   ├── theme
│   │   └── translations
│   ├── data
│   │   ├── bindings
│   │   ├── controllers
│   │   ├── middlewares
│   │   ├── models
│   │   ├── services
│   │   └── utils
│   ├── domain
│   │   ├── network
│   │   └── repository
│   ├── presentation
│   │   └── custom_widgets
│   └── main.dart
├── web
├── Makefile
└── pubspace.yaml
```


## Library Used
Please follow following format:-
|Name|Description|Link|
|:--:|:--:|:--:|
|`get`| We are using `getx` for `state`, `route`, `theme` & `localization` management.| [View](https://pub.dev/packages/get)|

