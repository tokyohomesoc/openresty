.SILENT :
.PHONY : openresty

openresty:
	docker build -t tokyohomesoc/openresty:test .
	docker images
    docker history tokyohomesoc/openresty:test
