cd ~/paskowe-typy/backend && git pull
cd ~/paskowe-typy/frontend && git pull

cd ~/paskowe-typy/paskowe-typy-config
docker compose build
docker compose down
docker compose up -d
