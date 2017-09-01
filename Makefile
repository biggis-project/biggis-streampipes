CONFDIR=config/

# ----------------------------------
# targets used by users

help:
	@echo
	@echo "Useful targets:"
	@echo " - restart : restarts all containers using a fresh config dir"
	@echo " - down    : stop all containers and cleanup"
	@echo " - ps      : print status about running containers"
	@echo

restart: _down _clean _up ps
	@echo RESTART FINISHED

down: _down _clean
	@echo SHUTDOWN FINISHED

ps:
	@docker-compose ps

# ----------------------------------
# other internally used targets

_clean:
	@echo "Now cleaning the config file..."
	@if [ -d "${CONFDIR}" ]; then sudo rm -r ${CONFDIR}; else echo already clean; fi

_up:
	@HOSTNAME=`hostname` docker-compose up -d

_down:
	@HOSTNAME=`hostname` docker-compose down

