# Nodemailer

## Description
Nodemailer is the standard library for sending emails from Node.js applications. It supports SMTP, Gmail, Outlook, AWS SES, and many other providers.

## How to code it
```javascript
const nodemailer = require('nodemailer');

const transporter = nodemailer.createTransport({
  host: 'smtp.gmail.com',
  port: 587,
  secure: false,
  auth: {
    user: process.env.EMAIL_USER,
    pass: process.env.EMAIL_PASS,  // App password
  }
});

await transporter.sendMail({
  from: '"My App" <noreply@myapp.com>',
  to: 'user@example.com',
  subject: 'Welcome to My App!',
  text: 'Thanks for signing up.',
  html: '<h1>Welcome!</h1><p>Thanks for signing up.</p>',
  attachments: [
    { filename: 'invoice.pdf', path: './invoices/001.pdf' }
  ]
});
```

## Features
- SMTP, Gmail, Outlook, AWS SES, SendGrid
- HTML and plain text emails
- File attachments and embedded images
- Email templates (with handlebars/ejs)
- DKIM signing for deliverability
