# CalculatorApp

**A simple open‑source calculator app built with Kotlin & Jetpack Compose.**

## 🚀 Get the APK – _no Android Studio needed_

1. Create a free **GitHub** account (if you don’t have one).
2. Click **“Import repository”** and select this ZIP, or create a new repo and upload the files.
3. Commit/push to the **`main`** branch.  
   GitHub Actions (already configured) will automatically build a **Debug APK**.
4. After the workflow finishes (≈ 3‑4 min), open the job, scroll to **Artifacts**, and download `calculator-debug-apk`.

That’s it — install the `.apk` on any Android 5.0+ device.

## 🛠 Build locally (optional)

```bash
./gradlew :app:assembleDebug
```

The APK will appear under `app/build/outputs/apk/debug/`.

## License

MIT