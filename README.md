# Write your project name here

**ProjectName** description

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



## Payment Gateway

What are the main steps/events that happen in a payment gateway?
Every payment Gateway uses these steps before redirecting users to the payment page.

1. Initiate payment. // Collects user inputs, such as Amount, currency, name,email,Number etc...
2. Create Order.  // Collected data now sent to Payment Gateway server, which creats an Order and generates an unique Order ID 
3. create a session for that Order
4. Give Session Web URL, where the user will interact and make Payments.

When a user clicks on the 'Pay' button, they will not see the first three processes and will need to wait for a few seconds.
After this wait, the user is directly redirected to the web session.

If you want to send a session link to the user's email,
hold on after creating the session and send it to your server, which will then send an email with the payment session link.
In this example we have integrated Two Payment Gateway for your reference

We have added direct link to Official Docs, please checkout them for more detailed Explanations.
1. [CashFree](https://docs.cashfree.com/docs/flutter-integration)
2. [Stripe](https://pub.dev/packages/flutter_stripe)

firstly, Lets start with CashFree integration in Flutter
### Cashfree

Requirements :-
checkout [cashfree flutter sdk](https://pub.dev/packages/flutter_cashfree_pg_sdk) for latest version and how to use it.
```agsl
dependencies:
    flutter_cashfree_pg_sdk: ^2.1.3+33
```

we will be using sandbox for creating order in Test Mode
[create cashfree Order](https://sandbox.cashfree.com/pg/orders)

```agsl
   // read appid and secret key from .env file
    final String appId = dotenv.env['CASHFREE_APPID'] ?? '';
    final String secretKey = dotenv.env['CASHFREE_SCRETKEY'] ?? '';

```
if you do not know about `.env` files,do not worry.

we will be discussing about .env shortly.

but before that here is headers and body structure for creating order on cashfree.

we will make post request to   `https://sandbox.cashfree.com/pg/orders` with below headers and body


```agsl

    final headers = {
      'Content-Type': 'application/json',
      'x-client-id': appId,
      'x-client-secret': secretKey,
      'x-api-version': '2025-01-01',
    };

    final data = {
      'order_id': 'enter your unique id or UUID',
      'order_amount': orderamount,
      'order_currency': 'INR',
      'customer_details': {
        'customer_id': 'CUST001',
        'customer_email': "abcd@gmail.com",
        'customer_phone': "9000012345",
      },
      'order_note': 'Test Order',
      'order_meta': {
        'return_url':
            'https://example.com/return', // Replace with your return URL
      },
    };
```

if you want to get status of recently created orders then visit [fetch order](https://docs.cashfree.com/reference/pgfetchorder)

To know more about Cashfree integration in flutter, or Latest doc kindly visit to [official cashfree site](https://docs.cashfree.com/docs/flutter-integration)

### Stripe
Android
This plugin requires several changes to be able to work on Android devices. Please make sure you follow all these steps:

1. Use Android 5.0 (API level 21) and above
2. Use Kotlin version 1.5.0 and above: example
3. Requires Android Gradle plugin 8 and higher
4. Using a descendant of Theme.AppCompat for your activity: example, example night theme

```
// example
// go to file android/app/src/main/res/values/styles.xml
// you can add these lines 

   <style name="NormalTheme" parent="Theme.MaterialComponents">
        <item name="android:windowBackground">?android:colorBackground</item>
    </style>
```

5. Using an up-to-date Android gradle build tools version: example and an up-to-date gradle version accordingly: example
6. Using FlutterFragmentActivity instead of FlutterActivity in MainActivity.kt: example
7. Add the following rules to your proguard-rules.pro file: example

```
-dontwarn com.stripe.android.pushProvisioning.PushProvisioningActivity$g
-dontwarn com.stripe.android.pushProvisioning.PushProvisioningActivityStarter$Args
-dontwarn com.stripe.android.pushProvisioning.PushProvisioningActivityStarter$Error
-dontwarn com.stripe.android.pushProvisioning.PushProvisioningActivityStarter
-dontwarn com.stripe.android.pushProvisioning.PushProvisioningEphemeralKeyProvider
```
 Rebuild the app, as the above changes don't update with hot reload


For Stripe Integration you need Two keys

1. Stripe's Publishable key
2. Stripe's Secret Key

**Don't have Stripe key's?** [get from here](https://dashboard.stripe.com/test/apikeys) .

**Note**: This Key's should be kept confidential for any data leak.

**Here we have used `.env` for keeping Key's within project.**

**Make sure** to add `.env` file to `.gitignore`, for unnecessary data leak

To use `.env` file's data in flutter app, you will need to follow below steps

create a file `.env` in root directory of Flutter project

``` css

├── android
├── assets
├── ios
├── lib
├── web
├── .env
└── pubspec.yaml
```

store key's in `.env` file 

```
STRIPE_SECRET=sk_test_51Pxxxxxxx
STRIPE_PUBKEY=pk_test_51Py9xxxxxxxx
```

Add `.env` file under assets in pubspec.yaml
```
assets:
  - .env
```
use [flutter_dotenv](https://pub.dev/packages/flutter_dotenv) flutter package to read .env file data

install __flutter_dotenv__ package with command
```agsl
flutter pub add flutter_dotenv
```

Or directly add in pubspec.yaml under dependencies

```agsl
dependencies:
  flutter_dotenv: ^5.1.0
```
and run flutter pub get after that

Loads `.env` file in main.dart

```
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future main() async {
  await dotenv.load(fileName: ".env");
}
```
using env data in flutter app
```
 headers: {
          'Authorization': 'Bearer ${dotenv.env['STRIPE_SECRET']}',
          'Content-Type': 'application/x-www-form-urlencoded'
        }
```


### Flavors 

To setup flavors in IOS/MACOS follow this [instructions](https://docs.flutter.dev/deployment/flavors)

For **Android**

go to android-> app -> build.gradle
```agsl
android {
    // ...
        buildTypes {
        release {
            // TODO: Add your own signing config for the release build.
            // Signing with the debug keys for now, so `flutter run --release` works.
            signingConfig signingConfigs.debug
        }
    }
    
    // add these line to create flavors for dev and Prod
    // Or edit them as per your choice
    flavorDimensions "app"
    productFlavors {
        // ... other flavors
        dev {
            dimension "app"
            applicationIdSuffix ".dev"
            versionNameSuffix "-dev"
            resValue "string", "app_name", "Dev App"
            buildConfigField "String", "TARGET_FILE", "\"lib/main_dev.dart\""
        }
        prod {
            dimension "app"
            resValue "string", "app_name", "Prod App"   // the name will be displayed as app name on devices below the app icon
            buildConfigField "String", "TARGET_FILE", "\"lib/main.dart\""
        }
    }
}
```

Go to android -> app -> src -> main -> Androidmanifest.xml

```agsl
 <application
        android:name="${applicationName}"
        android:icon="@mipmap/ic_launcher"
        android:label="@string/app_name">  // replace this line to use app name according to flavors
```


If you are using flavors, you may want to change App Icons 
then you can do like this

here i am using `flutter_launcher_icons` package for generating app icons

for more detail about package
read docs of [flutter_launcher_icons](https://pub.dev/packages/flutter_launcher_icons)

```agsl
// add below code in pubspec.yaml

flutter_launcher_icons:
  android: true
  ios: true
  image_path: "assets/logo/app_icon.png"  // default app icon
  flavors:
    dev:
      image_path: "assets/app_icons/dev_image.jpg"
      android: "app_dev"
      ios: "RunnerDev"
    prod:
      image_path: "assets/app_icons/prod_image.jpg"
      android: "app_staging"
      ios: "RunnerProd"


```
To use different firebase for different flavors
you have to create folder's according to it

go to android -> app -> src 

and create dev and prod folder

Add google-services.json files into respective flavor folders


create .yaml files in root directory of the app, to generate icons according to flavors
```agsl
// give name to file like this
flutter_launcher_icons-dev.yaml
flutter_launcher_icons-prod.yaml
```

and inside those file add 

```agsl

// in flutter_launcher_icons-dev.yaml

flutter_launcher_icons:
  android: true
  ios: true
  image_path: "assets/app_icons/dev_image.jpg"
  
// in flutter_launcher_icons-prod.yaml
flutter_launcher_icons:
  android: true
  ios: true
  image_path: "assets/app_icons/prod_image.jpg"  // path to icon image file
```

```agsl
// To generate icons 
// this command will search for all .yaml file whose name starts with flutter_launcher_icons

flutter pub run flutter_launcher_icons:main -f flutter_launcher_icons*
```


now rebuild your app
and use command line to build according to flavor

For dev
```agsl
flutter run --flavor dev -t lib/main_dev.dart
```

For Production
```agsl
flutter run --flavor prod -t lib/main.dart
```


