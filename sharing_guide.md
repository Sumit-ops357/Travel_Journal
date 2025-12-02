# How to Share Your Travel Journal Application

Your application images have been successfully built and pushed to Docker Hub. This means they are now public and can be downloaded (pulled) by anyone, anywhere.

## 1. Your Public Images
Your images are hosted on Docker Hub under your username `knightagentsumit123`:

- **Backend**: `knightagentsumit123/travel-backend:latest`
- **Frontend**: `knightagentsumit123/travel-frontend:latest`

## 2. How to Share with Others (Easiest Way)
The easiest way for someone else to run your application is to share your `docker-compose.prod.yml` file with them.

### Steps for the other person:
1.  Create a folder (e.g., `my-travel-app`).
2.  Place the `docker-compose.prod.yml` file inside that folder.
3.  Open a terminal in that folder.
4.  Run the following command:
    ```bash
    docker-compose -f docker-compose.prod.yml up
    ```
    *(Or just `docker compose up` if they rename the file to `docker-compose.yml`)*

Docker will automatically download your images from Docker Hub, download the MongoDB image, and start everything connected together.

## 3. How to Run on "Play with Docker" (Manual Steps)
If you want to run it on a fresh instance like [Play with Docker](https://labs.play-with-docker.com/) without copying files, you can run the containers manually using commands.

**Step 1: Create a Network**
So the containers can talk to each other.
```bash
docker network create travel-net
```

**Step 2: Run the Database**
```bash
docker run -d --name travel-mongo-prod --network travel-net -p 27017:27017 mongo:6
```

**Step 3: Run the Backend**
Connect it to the network and point it to the database.
```bash
docker run -d --name travel-backend-prod --network travel-net -p 5000:5000 -e PORT=5000 -e MONGO_URI=mongodb://travel-mongo-prod:27017/travel-journal knightagentsumit123/travel-backend:latest
```

**Step 4: Run the Frontend**
```bash
docker run -d --name travel-frontend-prod --network travel-net -p 80:80 knightagentsumit123/travel-frontend:latest
```

**Step 5: Access the App**
- Open port **80** to see the Frontend.
- The Frontend will communicate with the Backend on port **5000**.

## 4. Verification
You can verify the images are on Docker Hub by visiting:
- [https://hub.docker.com/r/knightagentsumit123/travel-backend](https://hub.docker.com/r/knightagentsumit123/travel-backend)
- [https://hub.docker.com/r/knightagentsumit123/travel-frontend](https://hub.docker.com/r/knightagentsumit123/travel-frontend)
