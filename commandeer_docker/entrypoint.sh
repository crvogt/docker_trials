#!/bin/bash
set -e

# Check if Ollama is already accessible (e.g., running on host with --network host)
if curl -s http://localhost:11434/api/tags > /dev/null 2>&1; then
    echo "Ollama service already running (host or existing instance)"
else
    # Start Ollama service in the background
    echo "Starting Ollama service..."
    ollama serve > /dev/null 2>&1 &

    # Wait a moment for Ollama to initialize
    sleep 2
    echo "Ollama service started"
fi

# Execute the main command (typically bash)
exec "$@"
