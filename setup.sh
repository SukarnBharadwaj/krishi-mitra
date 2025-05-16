#!/bin/bash

echo "🚀 Starting Krishi Mitr Full Setup..."

# Step 1: Python Virtual Environment
echo "📦 Creating Python virtual environment (if not exists)..."
python3 -m venv backend/venv

echo "🐍 Activating Python environment and installing requirements..."
source backend/venv/bin/activate
pip install -r backend/requirements.txt

# Step 2: Node.js Dependencies
echo "📦 Installing Node.js dependencies..."
cd krishi-mitr || exit
npm install
cd ..

# Step 3: Backend Check
USE_PYTHON_BACKEND=false
USE_NODE_BACKEND=false

if [ -f krishi-mitr/backend/app.py ]; then
    USE_PYTHON_BACKEND=true
fi

if [ -f krishi-mitr/backend/server.js ]; then
    USE_NODE_BACKEND=true
fi

if [ "$USE_PYTHON_BACKEND" = true ]; then
    echo "🚀 Launching Python backend..."
    cd krishi-mitr/backend || exit
    python3 app.py
elif [ "$USE_NODE_BACKEND" = true ]; then
    echo "🚀 Launching Node.js backend..."
    cd krishi-mitr/backend || exit
    node server.js
else
    echo "❌ No valid backend found. Please check the 'backend' folder."
fi
