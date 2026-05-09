# Multer

## Description
Multer is the standard middleware for handling `multipart/form-data` (file uploads) in Express/Node.js applications.

## How to code it
```javascript
const multer = require('multer');

const storage = multer.diskStorage({
  destination: (req, file, cb) => cb(null, 'uploads/'),
  filename: (req, file, cb) => cb(null, `${Date.now()}-${file.originalname}`)
});

const upload = multer({
  storage,
  limits: { fileSize: 5 * 1024 * 1024 }, // 5MB
  fileFilter: (req, file, cb) => {
    const allowed = ['image/jpeg', 'image/png', 'image/webp'];
    cb(null, allowed.includes(file.mimetype));
  }
});

// Single file
app.post('/upload', upload.single('avatar'), (req, res) => {
  res.json({ file: req.file });
});

// Multiple files
app.post('/gallery', upload.array('photos', 10), (req, res) => {
  res.json({ files: req.files });
});
```

## Features
- Disk or memory storage
- File size and type filtering
- Single, multiple, and field-based uploads
