.PHONY: all start run boot clear

app := arp-minutely-scanner

all: copy reload start boot

copy:
	@cp -i $(app) /usr/bin/

reload:
	@systemctl daemon-reload

end:
	systemctl start $(app).timer

boot:
	@systemctl enable $(app).timer

clear:
	systemctl stop $(app).timer
	@rm -f /usr/bin/$(app) /etc/systemd/system/$(app).* /var/log/$(app)
