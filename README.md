# docker-volumes-testing
Dockerfile and docker-compose.yml I used to troubleshoot an npm install issue. 

1. Clone and run docker-compose up.
2. Connect to container with docker exec -it test-service-container bash.
3. cd to /var/www and run npm init and npm install axios.
4. If running npm in docker then the node-modules folder should only exist in docker, it can't be shared with windows.
5. `npm run watch` won't file changes if the changed files exist on a windows share. To fix this people 
    tend to use `npm run watch-poll` which works, but can drive up CPU usage.

# An alternative - run npm in Windows

1. Using the above technique works okay, but can be slow and kills my cpu.
2. Instead, it's possible to run npm in Windows.
3. Install the same version of npm in Windows which is installed in Docker.
4. Delete any node_module folders (and files) which were created in Docker. This helps solve issues with packages being installed in one OS but used in another.
5. Remove the node_module volumes from the Dockerfile. The node_modules, as setup in this Dockerfile, only exists within 
    Docker. Even if there are files in a matching folder in Windows they won't show in Docker and vice versa.
5. Run npm on the host instead of within docker. npm init; npm install; npm watch.
