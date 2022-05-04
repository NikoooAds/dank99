.PHONY: all start run clear

app := arp-minutely-scanner

all: copy reload start

copy:
	@cp -i $(app) /usr/bin/
	@cp -i $(app).* /etc/systemd/system/

reload:
	@systemctl daemon-reload

start:
	systemctl start $(app).timer

clear:
	systemctl stop $(app).timer
	@rm -f /usr/bin/$(app) /etc/systemd/system/$(app).* /var/log/$(app)
