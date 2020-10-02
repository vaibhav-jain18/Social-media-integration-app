# Social-media-integration-app

This is a flutter app for Social media login integration, the app currently supports twitter, facebook & Google authentication.

- ## Getting API keys
- for google login you don't need any key.
- to get Facebook and twitter login API keys make a quick google search😊
- after you get the keys open **_lib\app\API\keys.dart_** file and place the twitter keys there

- ## Follow following steps for one time setup of the project🔥

- go to [firebase](https://firebase.google.com/) and create new project
- enable google, facebook & twitter signin from Sign in methods under Authentication tab in firebase.
- after that go to project settings in firebase, make sure you are under General tab
- Scroll till bottom click on add fingerprint
- Make sure your device is connected to the computer and ADB is enabled
- Open terminal as Admin and run the command
  > `keytool -list -v -alias androiddebugkey -keystore %USERPROFILE%\.android\debug.keystore`
- If it asks for password enter _android_
- Copy the SHA1 key & head towards firebase screen and paste it click save.
- Download the **google-services.json** file make sure it is named as _google-services.json_ only and not ~~_google-services(1).json_~~
- copy paste the downloaded file at the directory **_project\android\app_** and perform rebuild of the project.
