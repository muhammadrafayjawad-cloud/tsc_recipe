# 🚀 QUICK START GUIDE

## Your Full-Stack Recipe App is Ready!

### ✅ What's Been Created:

```
✓ Express.js Backend with MongoDB
✓ Updated Frontend with API Integration
✓ Persistent Recipe Database
✓ PDF Download Feature
✓ Delete & Manage Recipes
✓ Modern UI with Animations
```

---

## 🔨 STEP 1: Install Backend Dependencies

Open terminal in the `backend` folder:

```bash
cd backend
npm install
```

**This will install:**
- Express server
- MongoDB driver
- CORS support
- Environment config
- Auto-reload for development

---

## 🌍 STEP 2: Start the Backend Server

From the `backend` folder:

```bash
npm run dev
```

You should see:
```
✅ Connected to MongoDB
📋 Created recipes collection
🚀 Server running at http://localhost:5000
```

---

## 💻 STEP 3: Open the Frontend

### Option A: Direct (Simple)
- Open `frontend/index.html` directly in your browser

### Option B: Local Server (Recommended)
```bash
# From the project root or frontend folder
npx http-server frontend
```

Then visit: `http://localhost:8080`

---

## 🧪 STEP 4: Test the App

1. **Navigate to Generator**
   - Click "Generate Recipe" button or go to Recipe Builder

2. **Fill the Form**
   - Enter some ingredients
   - Select a sprout variety
   - Choose preferences

3. **Generate Recipe**
   - Click "Generate My Sprout Recipe"
   - Wait for the n8n webhook to respond

4. **See Results**
   - Recipe appears in "Recipe History"
   - **Refresh the page** → Recipe is still there! ✅

5. **Try Features**
   - Click **Preview** to view full recipe
   - Click **Save PDF** to download
   - Click **Delete** to remove from database

---

## 🔗 API Endpoints Available

```
GET    http://localhost:5000/api/health
GET    http://localhost:5000/api/recipes
GET    http://localhost:5000/api/recipes/:id
POST   http://localhost:5000/api/recipes/save
DELETE http://localhost:5000/api/recipes/:id
PUT    http://localhost:5000/api/recipes/:id
```

---

## 🗄️ Your MongoDB

**Database:** `tsc_db`  
**Connection:** Active via provided URI  
**Collections:** 
- `recipes` - Stores all generated recipes

---

## ⚙️ Configuration Files

### `.env` (Backend)
```env
MONGODB_URI=mongodb+srv://junaid123:12345678%40@cluster0.cs5y2fn.mongodb.net/tsc_db?retryWrites=true&w=majority&appName=Cluster0
PORT=5000
NODE_ENV=development
```

### Frontend Config (in index.html)
```javascript
const API_BASE_URL = 'http://localhost:5000/api';
const WEBHOOK_URL = 'https://thesproutingcompany.app.n8n.cloud/webhook/recipeapp';
```

---

## 🎯 Key Features Implemented

### ✅ Persistent Database Storage
- Recipes automatically saved to MongoDB
- Data survives page refresh
- Full history maintained

### ✅ Enhanced UI Features
- **Preview Modal** - View full recipe in a modal
- **PDF Download** - Save recipes as PDF files (html2pdf)
- **Delete Option** - Remove recipes from DB
- **Recipe Counter** - Shows total recipes in history
- **Loading Timer** - Shows generation progress

### ✅ API-Driven Architecture
- All CRUD operations via REST API
- Backend validates & saves data
- Frontend stays lightweight
- Easy to scale and extend

---

## 🛠️ Troubleshooting

### Backend won't start?
```bash
# Check Node.js is installed
node --version

# Try installing dependencies again
npm install

# Check for port 5000 conflicts
# Change PORT in .env if needed
```

### Can't connect to MongoDB?
- Check internet connection
- Verify MongoDB URI in `.env`
- Ensure IP whitelist in MongoDB Atlas

### Frontend can't reach backend?
- Make sure backend is running first
- Check `API_BASE_URL` in frontend/index.html
- Look at browser console for CORS errors

### Recipes not saving?
- Check backend console for error messages
- Verify MongoDB connection is active
- Check Network tab in DevTools

---

## 📊 The Flow

```
1. User fills form
   ↓
2. Clicks "Generate Recipe"
   ↓
3. Frontend sends to n8n webhook
   ↓
4. n8n returns recipe data
   ↓
5. Frontend sends to Backend API
   ↓
6. Backend saves to MongoDB
   ↓
7. Recipe appears in "Recipe History"
   ↓
8. Refresh page → Recipe still there! ✅
```

---

## 🚀 Next Steps

1. ✅ Install dependencies (`npm install`)
2. ✅ Start backend (`npm run dev`)
3. ✅ Open frontend (`frontend/index.html`)
4. ✅ Generate a recipe
5. ✅ Refresh page to confirm persistence
6. ✅ Try delete and download features

---

## 📝 File Structure

```
backend/
├── server.js              # Express app & MongoDB connection
├── package.json           # Dependencies
├── .env                   # Database URI & config
└── routes/
    └── recipes.js         # API endpoints (GET, POST, DELETE, PUT)

frontend/
└── index.html             # Complete SPA with API calls

README.md                   # Full documentation
QUICKSTART.md             # This file
```

---

## ✨ What's Different Now

| Before | Now |
|--------|-----|
| Data only in localStorage | ✅ Persisted in MongoDB |
| Lost on refresh | ✅ Survives page reload |
| No download option | ✅ PDF download included |
| No delete confirmation | ✅ Delete with confirmation |
| No backend | ✅ Full Express API server |

---

## 🎉 You're All Set!

Your app now has:
- ✅ Modern backend architecture
- ✅ Persistent MongoDB database
- ✅ API-driven frontend
- ✅ Complete CRUD operations
- ✅ PDF export capability
- ✅ Professional UI/UX

**Start the backend and enjoy!** 🚀

---

Need help? Check the backend console output for error messages!
