# 04. Blazor Security

Securing your client-side application is critical. Blazor integrates with the standard ASP.NET Core Authorization system.

---

## 1. AuthenticationStateProvider
The core service for managing security in Blazor. It tells the app who the current user is.

---

## 2. AuthorizeView Component
A powerful way to show or hide UI elements based on the user's role or claims.
```razor
<AuthorizeView>
    <Authorized>
        <p>Hello, @context.User.Identity.Name!</p>
    </Authorized>
    <NotAuthorized>
        <p>Please log in.</p>
    </NotAuthorized>
</AuthorizeView>
```

---

## 3. Attribute-based Security
You can secure entire pages by adding the `[Authorize]` attribute at the top of your `.razor` file.
```razor
@page "/admin"
@attribute [Authorize(Roles = "Admin")]
```

---

## 4. Securing APIs
Remember: **Client-side security is only for UI convenience.** You must always secure your backend APIs using JWT tokens or Cookies, as a savvy user can always bypass client-side checks.

---

## 🚀 Pro Tip
For Blazor WASM, use **OpenID Connect (OIDC)** and **OAuth 2.0**. For Blazor Server, standard **Cookies** are often the best and simplest choice.
