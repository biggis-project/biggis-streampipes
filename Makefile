CONFDIR=config/

help:
	@echo
	@echo "Useful targets:"
	@echo " - restart : stops all containers, cleans config and starts them again"
	@echo " - clean   : just remove the '${CONFIGDIR}' directory"
	@echo " - down    : stop all containers"
	@echo " - ps      : print status about running containers"
	@echo

restart: down clean up
	@echo RESTART FINISHED

clean:
	@if [ -d "${CONFDIR}" ]; then sudo rm -r ${CONFDIR}; else echo already clean; fi

up:
	@HOSTNAME=`hostname` docker-compose up -d

down:
	@HOSTNAME=`hostname` docker-compose down

ps:
	@docker-compose ps
