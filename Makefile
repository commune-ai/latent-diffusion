down:
	docker-compose down

up:
	docker-compose up -d --remove-orphans
backend: 
	./start.sh --backend; docker exec -it ocean_backend_1;

restart:
	./start.sh --purge && ./start.sh;


prune_volumes:	
	docker system prune --all --volumes

bash:
	docker exec -it ${arg} bash
build_backend:
	docker-compose -f "backend/backend.yml" build;

app:
	make streamlit
kill_all:
	docker kill $(docker ps -q)

logs:
	docker logs ${arg} --tail=100 --follow

streamlit:
	docker exec -it ocean_backend_1 bash -c "streamlit run algocean/${arg}/module.py "
enter_backend:
	docker exec -it ocean_backend_1 bash
pull:
	git submodule update --init --recursive
	
kill_all:
	docker kill $(docker ps -q) 

jupyter:
	docker exec -it ocean_backend_1 bash -c "jupyter lab --allow-root --ip=0.0.0.0 --port=8888"