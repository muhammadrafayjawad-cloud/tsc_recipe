@echo off
REM TSC Sprout Recipe App - Startup Script for Windows

echo.
echo ╔════════════════════════════════════════════════════════════╗
echo ║   TSC Sprout Recipe Generator - Full Stack Setup          ║
echo ╚════════════════════════════════════════════════════════════╝
echo.

REM Check if Node is installed
where node >nul 2>nul
if %ERRORLEVEL% NEQ 0 (
    echo ❌ Node.js is not installed or not in PATH
    echo Please download from: https://nodejs.org/
    pause
    exit /b 1
)

echo ✅ Node.js found: 
node --version
echo.

REM Navigate to backend
cd backend
echo 📦 Installing backend dependencies...
echo.

REM Check if package.json exists
if not exist "package.json" (
    echo ❌ package.json not found in backend folder
    pause
    exit /b 1
)

REM Install dependencies
call npm install

if %ERRORLEVEL% NEQ 0 (
    echo ❌ Failed to install dependencies
    pause
    exit /b 1
)

echo.
echo ✅ Backend dependencies installed successfully!
echo.
echo ╔════════════════════════════════════════════════════════════╗
echo ║           SETUP COMPLETE - STARTING SERVER                ║
echo ╚════════════════════════════════════════════════════════════╝
echo.
echo 🚀 Starting backend server on http://localhost:5000
echo.
echo 📌 When you see "Server running at http://localhost:5000"
echo    the backend is ready!
echo.
echo 💡 Open frontend in another terminal:
echo    - frontend/index.html in your browser
echo    OR
echo    - Run: npx http-server frontend
echo.
echo Press any key to start the server...
pause

REM Start the development server
npm run dev
