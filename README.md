# TSC Sprout Recipe Generator - Full Stack App

Complete setup with **Express.js backend**, **MongoDB database**, and **Modern frontend**.

## 🚀 Quick Setup

### Prerequisites
- **Node.js** (v16+)
- **npm** or **yarn**
- **MongoDB Atlas** account (free tier available)

### Database Connection String
```
MONGODB_URI=mongodb+srv://junaid123:12345678%40@cluster0.cs5y2fn.mongodb.net/tsc_db?retryWrites=true&w=majority&appName=Cluster0
```

---

## 📂 Project Structure

```
reciepe generator/
├── backend/                 # Express.js API server
│   ├── server.js           # Main server file
│   ├── package.json        # Dependencies
│   ├── .env                # Environment variables
│   └── routes/
│       └── recipes.js      # Recipe API endpoints
│
├── frontend/               # Web application
│   └── index.html          # Single-page app with embedded styles & scripts
│
└── README.md              # This file
```

---

## 🔧 Backend Setup

### 1. Install Dependencies
```bash
cd backend
npm install
```

This installs:
- **express** - Web framework
- **mongodb** - Database driver
- **cors** - Cross-Origin Resource Sharing
- **dotenv** - Environment variables
- **pdfkit** - PDF generation (optional)
- **nodemon** - Auto-reload during development

### 2. Environment Variables
The `.env` file is already configured with your MongoDB URI:
```env
MONGODB_URI=mongodb+srv://junaid123:12345678%40@cluster0.cs5y2fn.mongodb.net/tsc_db?retryWrites=true&w=majority&appName=Cluster0
PORT=5000
NODE_ENV=development
```

### 3. Start Backend Server
```bash
# Development (with auto-reload)
npm run dev

# Production
npm start
```

**Server runs on:** `http://localhost:5000`

---

## 💻 Frontend Setup

### 1. Open in Browser
Simply open the `frontend/index.html` file in any web browser, or serve it with a simple HTTP server:

```bash
# Using Python
cd frontend
python -m http.server 8000

# Using Node.js (http-server)
cd frontend
npx http-server
```

**App runs on:** `http://localhost:8000`

---

## 🔌 API Endpoints

### GET /api/health
Health check endpoint.
```bash
curl http://localhost:5000/api/health
```

### GET /api/recipes
Get all saved recipes.
```bash
curl http://localhost:5000/api/recipes
```

### GET /api/recipes/:id
Get a specific recipe by ID.
```bash
curl http://localhost:5000/api/recipes/RECIPE_ID
```

### POST /api/recipes/save
Save a new recipe to the database.
```bash
curl -X POST http://localhost:5000/api/recipes/save \
  -H "Content-Type: application/json" \
  -d '{
    "title": "Broccoli Sprout Salad",
    "description": "A healthy salad",
    "ingredients": ["sprouts", "lettuce"],
    "servings": "4 servings",
    "prep_time": "15 minutes",
    "html": "<html>...</html>"
  }'
```

### POST /api/recipes/webhook
Webhook endpoint for n8n or external sources.
```bash
curl -X POST http://localhost:5000/api/recipes/webhook \
  -H "Content-Type: application/json" \
  -d '{ recipe data }'
```

### DELETE /api/recipes/:id
Delete a recipe.
```bash
curl -X DELETE http://localhost:5000/api/recipes/RECIPE_ID
```

### PUT /api/recipes/:id
Update a recipe.
```bash
curl -X PUT http://localhost:5000/api/recipes/RECIPE_ID \
  -H "Content-Type: application/json" \
  -d '{ updated recipe data }'
```

---

## 📊 Database Schema

### Recipes Collection
```javascript
{
  _id: ObjectId,
  title: String,
  description: String,
  ingredients: Array,
  instructions: Array,
  servings: String,
  prep_time: String,
  equipment: String,
  cuisine: String,
  nutritionalFocus: Array,
  html: String,              // Full HTML recipe (for preview)
  image_url: String,         // Optional image URL
  nutrition: Object,         // Nutrition breakdown
  createdAt: Date,
  updatedAt: Date
}
```

---

## 🌐 how the App Works

### 1. **User Fills Form**
User enters ingredients, sprout variety, cooking preferences, etc.

### 2. **Generate Recipe**
Frontend sends request to n8n webhook:
```
POST https://thesproutingcompany.app.n8n.cloud/webhook/recipeapp
```

### 3. **n8n Processes & Returns**
n8n uses your AI/recipe logic and returns recipe data.

### 4. **Frontend Saves to Backend**
The response is automatically saved to MongoDB via:
```
POST http://localhost:5000/api/recipes/save
```

### 5. **Display in History**
Recipe appears in the "Recipe History" section and persists even after:
- Page refresh ✅
- Browser close ✅
- Any time (stored in DB) ✅

### 6. **Actions Available**
- **Preview** - View full recipe
- **Download PDF** - Save recipe as PDF
- **Delete** - Remove from database & history

---

## 🔀 Important Configuration

### Update Frontend API URL (if needed)
In `frontend/index.html`, find this line:
```javascript
const API_BASE_URL = 'http://localhost:5000/api';
```

Change `localhost:5000` if your backend runs elsewhere.

### Update Webhook URL (if needed)
In `frontend/index.html`:
```javascript
const WEBHOOK_URL = 'https://thesproutingcompany.app.n8n.cloud/webhook/recipeapp';
```

---

## 🐛 Troubleshooting

### Backend won't connect to MongoDB
- ✅ Check MongoDB URI in `.env`
- ✅ Verify internet connection
- ✅ Check firewall allows MongoDB connection
- ✅ Ensure IP whitelist in MongoDB Atlas includes your IP

### Frontend can't reach backend
- ✅ Ensure backend is running (`npm run dev`)
- ✅ Check if API URL is correct in frontend
- ✅ Check browser console for CORS errors
- ✅ Ensure both are on same network

### Recipes not saving
- ✅ Check backend console for errors
- ✅ Verify MongoDB connection is active
- ✅ Check network tab in browser dev tools

### PDF download not working
- ✅ Ensure html2pdf library is loaded
- ✅ Check that recipe has HTML content

---

## 📦 Dependencies

### Backend
- **express**: Web server
- **mongodb**: Database
- **cors**: Cross-origin requests
- **dotenv**: Environment config
- **nodemon**: Dev auto-reload (optional)
- **pdfkit**: PDF generation (optional)

### Frontend
- **html2pdf.js**: PDF generation (CDN)
- No build process - pure HTML/CSS/JS

---

## 🚀 Deployment

### Backend Deployment (Heroku, Railway, Render)
1. Push code to GitHub
2. Connect to Heroku/Railway/Render
3. Set `MONGODB_URI` environment variable
4. Deploy

### Frontend Deployment (Vercel, Netlify, GitHub Pages)
1. Upload `frontend/index.html` to any static hosting
2. Update `API_BASE_URL` to production backend URL

---

## 📄 License
ISC

---

## 💡 Features

✅ **Persistent Storage** - All recipes saved in MongoDB  
✅ **Real-time History** - Recipes appear immediately after generation  
✅ **PDF Export** - Download recipes as PDF files  
✅ **Delete & Manage** - Remove unwanted recipes  
✅ **Beautiful UI** - Responsive design with animations  
✅ **Webhook Integration** - Works with n8n for AI recipe generation  
✅ **No Page Reload Needed** - Single-page app architecture  

---

**Need Help?** Check the backend console or browser DevTools for error messages!
