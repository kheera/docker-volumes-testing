# docker-volumes-testing
Dockerfile and docker-compose.yml I used to troubleshoot an npm install issue. 

1. Clone and run docker-compose up.
2. Connect to container with docker exec -it test-service-container bash.
3. cd to /var/www and run npm init and npm install axios.
