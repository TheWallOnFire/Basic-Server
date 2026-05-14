# 02. MAUI Layouts & Navigation

Creating a responsive and intuitive user experience across mobile and desktop.

---

## 1. Common Layouts
- **StackLayout**: Arranges elements in a single line (Horizontal or Vertical).
- **Grid**: A flexible table-like structure (Rows and Columns).
- **FlexLayout**: Similar to CSS Flexbox, great for wrapping content.
- **AbsoluteLayout**: Position elements at specific coordinates (Rarely used).

---

## 2. Shell Navigation
MAUI Shell is the recommended way to handle navigation. It provides:
- **Flyout Menus**: Side drawers.
- **Tabs**: Bottom or top navigation.
- **Route-based Navigation**: `Shell.Current.GoToAsync("//details")`.

---

## 3. Responsive Design
Use **Visual State Manager** or **Device.RuntimePlatform** to change the layout depending on whether the app is running on a small phone screen or a large desktop monitor.

---

## 🚀 Pro Tip
Always use **Grid** for complex screens. It is more performant than nesting multiple `StackLayouts` and gives you much better control over responsiveness.
