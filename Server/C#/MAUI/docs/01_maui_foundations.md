# 01. .NET MAUI Foundations

.NET Multi-platform App UI (MAUI) is a cross-platform framework for creating native mobile and desktop apps with C# and XAML.

---

## 1. One Codebase, Multiple Platforms
MAUI allows you to write your app once and deploy it to:
- **Android**
- **iOS**
- **macOS** (via Catalyst)
- **Windows** (via WinUI 3)

---

## 2. XAML & Data Binding
MAUI uses XAML (Extensible Application Markup Language) for UI and C# for logic. It relies heavily on the **MVVM (Model-View-ViewModel)** pattern.

### XAML Example
```xml
<StackLayout>
    <Label Text="{Binding Greeting}" />
    <Button Text="Click Me" Command="{Binding ClickCommand}" />
</StackLayout>
```

---

## 3. Native Features
MAUI provides easy access to native device features through a single C# API:
- **Connectivity**: Check if the device is online.
- **Geolocation**: Get the user's location.
- **Sensors**: Access the accelerometer or compass.
- **Secure Storage**: Store encrypted data locally.

---

## 4. Blazor Hybrid
You can embed Blazor components into a MAUI app. This allows you to reuse your web UI on mobile and desktop while still having full access to native device features.

---

## 🚀 Pro Tip
Use the **CommunityToolkit.Mvvm** library. It uses "Source Generators" to automatically create the boilerplate code for your ViewModels, saving you hours of repetitive typing.
