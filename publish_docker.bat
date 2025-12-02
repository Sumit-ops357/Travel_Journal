@echo off
echo Building and Pushing Docker Images for knightagentsumit123...

echo.
echo [1/4] Building Backend...
docker build -t knightagentsumit123/travel-backend:latest ./travel-backend

echo.
echo [2/4] Building Frontend...
docker build -t knightagentsumit123/travel-frontend:latest --build-arg REACT_APP_API_URL=http://localhost:5000/ ./travel-frontend

echo.
echo [3/4] Pushing Backend...
docker push knightagentsumit123/travel-backend:latest

echo.
echo [4/4] Pushing Frontend...
docker push knightagentsumit123/travel-frontend:latest

echo.
echo Done! Images published to Docker Hub.
