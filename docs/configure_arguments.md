```shell
$ cat arguments.log | sed 's/ /\n/g'
nginx version: nginx/1.11.5
built by gcc 5.3.0 (Alpine 5.3.0)
built with OpenSSL 1.0.2j  26 Sep 2016
TLS SNI support enabled
configure
    arguments:
    --prefix=/etc/nginx
    --sbin-path=/usr/sbin/nginx
    --modules-path=/usr/lib/nginx/modules
    --conf-path=/etc/nginx/nginx.conf
    --error-log-path=/var/log/nginx/error.log
    --http-log-path=/var/log/nginx/access.log
    --pid-path=/var/run/nginx.pid
    --lock-path=/var/run/nginx.lock
    --http-client-body-temp-path=/var/cache/nginx/client_temp
    --http-proxy-temp-path=/var/cache/nginx/proxy_temp
    --http-fastcgi-temp-path=/var/cache/nginx/fastcgi_temp
    --http-uwsgi-temp-path=/var/cache/nginx/uwsgi_temp
    --http-scgi-temp-path=/var/cache/nginx/scgi_temp
    --user=nginx
    --group=nginx

    --with-http_ssl_module
    --with-http_gunzip_module
    --with-http_gzip_static_module
    --with-threads
    --with-stream
    --with-stream_ssl_module
    --with-compat
    --with-http_v2_module
    
    --add-module=./nginx-ct-1.3.1
    --add-module=./headers-more-nginx-module-0.31
```