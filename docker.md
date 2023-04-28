podman machine stop
podman machine start
podman ps -a
podman container start pg11_7_dev


podman volume prune
podman container prune
podman volume rm pg11_7_dev
podman container rm pg11_7_dev
podman image rm 
podman machine ssh

podman run --name pg11_7_dev -e POSTGRES_PASSWORD='xxxxx' -d -p 5432:5432 -v pg11_7_dev:/var/lib/postgresql/data docker.io/postgres:11.7-alpine

podman machine ssh "echo localhost:5432:postgres:postgres:xxxxx >> ~/.pgpass"
podman machine ssh "chmod 0600 ~/.pgpass"

podman machine ssh "psql -h localhost -p 5432 -U postgres -c 'DROP ROLE IF EXISTS xxxx;DROP ROLE IF EXISTS xxxxx;DROP ROLE IF EXISTS xxxxx;CREATE ROLE xxxx;CREATE ROLE xxxxx;CREATE ROLE xxxxx;'"

podman container ls
