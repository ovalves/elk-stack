SHELL := /bin/bash

help:
	@echo ""
	@echo "Commands:"
	@echo "  start                Iniciar todos os serviços"
	@echo "  stop                 Parar todos os serviços"
	@echo "  elasticsearch-logs   Logs do elasticsearch"
	@echo "  kibana-logs          Logs do kibana"
	@echo "  metricbeat-logs      Logs do metricbeat"
	@echo "  heartbeat-logs       Logs do heartbeat"
	@echo "  app-logs             Logs do app"
	@echo "  mongodb-logs         Logs do mongodb"


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
	docker logs -f app-app-1

mongodb-logs:
	docker logs -f app-mongodb-1