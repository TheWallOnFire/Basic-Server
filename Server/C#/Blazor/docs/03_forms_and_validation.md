# 03. Blazor Forms & Validation

Handling user input safely and efficiently is a core requirement for any web application.

---

## 1. The EditForm Component
Blazor provides the `EditForm` component to wrap your forms. It integrates perfectly with data binding and validation.
```razor
<EditForm Model="@user" OnValidSubmit="HandleSubmit">
    <DataAnnotationsValidator />
    <ValidationSummary />

    <InputText @bind-Value="user.Name" />
    <button type="submit">Submit</button>
</EditForm>
```

---

## 2. Validation with Data Annotations
You use the same attributes you know from ASP.NET Core and EF Core:
- `[Required]`
- `[StringLength(50)]`
- `[EmailAddress]`

---

## 3. Input Components
Blazor has built-in components that handle the `Input` and `Change` events for you:
- `InputText`
- `InputNumber`
- `InputDate`
- `InputSelect` (Dropdowns)
- `InputCheckbox`

---

## 4. Custom Validation
You can write custom validation logic by creating a class that inherits from `ValidationAttribute` or by manually handling the `EditContext`.

---

## 🚀 Pro Tip
Always use `OnValidSubmit` instead of a standard `onclick` on the button. This ensures that your code only runs after all validation rules have passed.
