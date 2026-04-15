#!/bin/bash

# TSC Sprout Recipe App - Startup Script for macOS/Linux

echo ""
echo "╔════════════════════════════════════════════════════════════╗"
echo "║   TSC Sprout Recipe Generator - Full Stack Setup          ║"
echo "╚════════════════════════════════════════════════════════════╝"
echo ""

# Check if Node is installed
if ! command -v node &> /dev/null; then
    echo "❌ Node.js is not installed"
    echo "Please download from: https://nodejs.org/"
    exit 1
fi

echo "✅ Node.js found:"
node --version
echo ""

# Navigate to backend
cd backend || exit

echo "📦 Installing backend dependencies..."
echo ""

# Check if package.json exists
if [ ! -f "package.json" ]; then
    echo "❌ package.json not found in backend folder"
    exit 1
fi

# Install dependencies
npm install

if [ $? -ne 0 ]; then
    echo "❌ Failed to install dependencies"
    exit 1
fi

echo ""
echo "✅ Backend dependencies installed successfully!"
echo ""
echo "╔════════════════════════════════════════════════════════════╗"
echo "║           SETUP COMPLETE - STARTING SERVER                ║"
echo "╚════════════════════════════════════════════════════════════╝"
echo ""
echo "🚀 Starting backend server on http://localhost:5000"
echo ""
echo "📌 When you see 'Server running at http://localhost:5000'"
echo "    the backend is ready!"
echo ""
echo "💡 Open frontend in another terminal:"
echo "    - frontend/index.html in your browser"
echo "    OR"
echo "    - Run: npx http-server frontend"
echo ""

# Start the development server
npm run dev
