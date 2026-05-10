# 06. Mobile Testing

Mobile testing ensures applications work correctly across a fragmented ecosystem of devices, OS versions, and screen sizes.

## 1. Types of Mobile Apps
- **Native**: Built for a specific platform (Swift/Kotlin).
- **Hybrid**: Web app wrapped in a native shell (Ionic, Capacitor).
- **Cross-Platform**: Single codebase for multiple platforms (React Native, Flutter).

## 2. Frameworks
| Framework | Language | Platforms |
| :--- | :--- | :--- |
| **Appium** | Multi-language | iOS, Android (industry standard) |
| **Detox** | JavaScript | React Native (fast, reliable) |
| **Espresso** | Java/Kotlin | Android native |
| **XCUITest** | Swift | iOS native |
| **Maestro** | YAML | iOS, Android (simple, fast setup) |

## 3. Device Farms
- **BrowserStack**: Cloud-based real devices.
- **AWS Device Farm**: Automated testing on real devices.
- **Firebase Test Lab**: Google's cloud testing infrastructure.
- **Local Emulators/Simulators**: Android Studio Emulator, Xcode Simulator.

## 4. Mobile-Specific Testing
- **Gestures**: Swipe, pinch, zoom, long-press.
- **Orientation**: Portrait vs. Landscape.
- **Connectivity**: Offline mode, slow networks (3G/Edge).
- **Push Notifications**: Delivery and behavior testing.
- **Permissions**: Camera, location, storage access dialogs.
