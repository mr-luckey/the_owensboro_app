# Fix Google Play Services / Firebase DEVELOPER_ERROR on Android

The errors you see:
- `GoogleApiManager: Failed to get service from broker`
- `SecurityException: Unknown calling package name 'com.google.android.gms'`
- `ConnectionResult{statusCode=DEVELOPER_ERROR}`

occur because **your app's SHA-1 certificate fingerprint is not registered** in the Firebase project. This is required for Google Play Services and Google Sign-In.

## Fix (one-time setup)

### 1. Get your SHA-1 and SHA-256

From the project root, run:

```bash
cd android && ./gradlew signingReport
```

Or on Windows:

```bash
cd android
gradlew.bat signingReport
```

In the output, find **Variant: debug** (and **release** if you use a release keystore) and copy:
- **SHA-1**
- **SHA-256**

Example:
```
Variant: debug
Config: debug
Store: ~/.android/debug.keystore
Alias: AndroidDebugKey
SHA1: AA:BB:CC:...
SHA-256: DD:EE:FF:...
```

### 2. Add fingerprints in Firebase Console

1. Open [Firebase Console](https://console.firebase.google.com/) and select project **the-owensboro-app**.
2. Go to **Project settings** (gear icon) → **Your apps**.
3. Select the Android app with package name **com.techorphic.TheOwensboroApp**.
4. Click **Add fingerprint** and paste your **SHA-1**.
5. Click **Add fingerprint** again and paste your **SHA-256**.
6. Save. You do **not** need to re-download `google-services.json` for SHA changes (only if you add a new app).

### 3. (If you use Google Sign-In) OAuth client

1. In the same Firebase project, go to **Build → Authentication → Sign-in method** and enable **Google** if needed.
2. In [Google Cloud Console](https://console.cloud.google.com/) → **APIs & Services → Credentials**, ensure there is an **OAuth 2.0 Client ID** of type **Android** for package name `com.techorphic.TheOwensboroApp` and the same SHA-1 you added in Firebase.  
   Firebase often creates this when you add the SHA-1; if Google Sign-In still fails, create the Android OAuth client manually with that package name and SHA-1.

### 4. Rebuild and run

```bash
flutter clean
flutter pub get
flutter run
```

After adding SHA-1/SHA-256, the DEVELOPER_ERROR and "Unknown calling package name" messages should stop. If you use an **emulator**, use one with **Google Play** (not a “Google APIs” or AOSP-only image) so Play Services works correctly.
