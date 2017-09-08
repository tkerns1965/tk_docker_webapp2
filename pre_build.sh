# explicitly create new volume(s)
# if omitted, volume(s) will be implicitly created
#   by the 'docker run' statement below
docker volume create vol_tkdw2_mariadb_data
docker volume create vol_tkdw2_mariadb_socket
docker volume create vol_tkdw2_python_socket

# connect a busybox container to the volume(s)
docker run -di \
  --name bb_temp \
  --mount src=vol_tkdw2_mariadb_data,dst=/mariadb/data \
  --mount src=vol_tkdw2_mariadb_socket,dst=/mariadb/socket \
  --mount src=vol_tkdw2_python_socket,dst=/python/socket \
  busybox:1.27.2

# change ownership of the folder(s) on the volume(s)
docker exec bb_temp \
  sh -c " \
    chown 999:999 /mariadb/socket && \
    chown www-data:www-data /python/socket \
    "

# stop the busybox container
docker stop bb_temp

# remove the busybox container
docker rm bb_temp
