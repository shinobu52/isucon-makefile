# 1. install dstat command
# 2. install stress command
# 3. install ab(apache benchmark) command
# 4. install alp
# 5. install pt-query-digest
.PHONY: init
init:
	sudo apt update && \
	make install_dstat && \
	make install_stress && \
	make install_ab && \
	make install_alp && \
	make isntall_pt

.PHONY: install_stress
install_stress:
	sudo apt install stress

.PHONY: install_dstat
install_dstat:
	sudo apt install dstat

.PHONY: install_ab
install_ab:
	sudo apt install apache2-utils

.PHONY: install_alp
install_alp:
	wget https://github.com/tkuchiki/alp/releases/download/v1.0.21/alp_linux_amd64.tar.gz && \
	tar -zxvf alp_linux_amd64.tar.gz && \
	sudo install alp /usr/local/bin/alp

.PHONY: isntall_pt
install_pt:
	sudo apt -y install percona-toolkit

# install netdata
.PHONY: install_netdata
install_netdata:
	sudo apt -y install netdata

.PHONY: install_k6
install_k6:
	sudo gpg -k && \
	sudo gpg --no-default-keyring --keyring /usr/share/keyrings/k6-archive-keyring.gpg --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys C5AD17C747E3415A3642D57D77C6C491D6AC1D69 && \
	echo "deb [signed-by=/usr/share/keyrings/k6-archive-keyring.gpg] https://dl.k6.io/deb stable main" | sudo tee /etc/apt/sources.list.d/k6.list && \
	sudo snap install k6
