SHELL := /bin/bash

help:
	@echo ""
	@echo "Commands:"
	@echo "  start           Iniciar todos os serviços"
	@echo "  stop            Parar todos os serviços"


start:
	docker network ls|grep observability > /dev/null || docker network create observability
	docker compose -f docker-compose.yml up -d

stop:
	docker compose down -v
	docker network rm observability

elasticsearch-logs:
	docker logs -f elasticsearch

kibana-logs:
	docker logs -f kibana

metricbeat-logs:
	docker logs -f metricbeat