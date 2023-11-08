SHELL := /bin/bash

help:
	@echo ""
	@echo "Commands:"
	@echo " stop                Parar todos os serviços"
	@echo " app-logs            Logs do app"
	@echo " start               Iniciar todos os serviços"
	@echo " kibana-logs         Logs do kibana"
	@echo " mongodb-logs        Logs do mongodb"
	@echo " heartbeat-logs      Logs do heartbeat"
	@echo " metricbeat-logs     Logs do metricbeat"
	@echo " elasticsearch-logs  Logs do elasticsearch"


start:
	docker network ls|grep observability > /dev/null || docker network create observability
	docker compose -f docker-compose.yml up -d
	docker compose -f app/docker-compose.yml up -d

stop:
	docker compose down -v
	docker compose -f app/docker-compose.yml down -v
	docker network ls|grep observability > /dev/null || docker network rm observability

elasticsearch-logs:
	docker logs -f elasticsearch

kibana-logs:
	docker logs -f kibana

metricbeat-logs:
	docker logs -f metricbeat

heartbeat-logs:
	docker logs -f heartbeat

app-logs:
	docker logs -f app

mongodb-logs:
	docker logs -f mongodb