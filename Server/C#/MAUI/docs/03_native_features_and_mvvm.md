# 03. Native Features & MVVM

Taking your app beyond the UI and into the device internals.

---

## 1. Accessing Native APIs
MAUI allows you to call native APIs directly from C#.
- **Permissions**: Request access to Camera, Location, or Contacts.
- **Platform-Specific Code**: Use the `Platforms` folder to write code that only runs on Android or iOS.

---

## 2. The MVVM Pattern
**Model-View-ViewModel** is the "Gold Standard" for MAUI development.
- **View**: The XAML UI.
- **Model**: The data classes.
- **ViewModel**: The "Glue" that handles logic and commands. It implements `INotifyPropertyChanged` to update the UI automatically.

---

## 3. Dependency Injection in MAUI
MAUI has the same built-in DI container as ASP.NET Core. You register your ViewModels and Services in `MauiProgram.cs`.

---

## 🚀 Pro Tip
Check out **MAUI Community Toolkit**. It contains dozens of reusable behaviors, converters, and UI elements that will save you from reinventing the wheel.
