## log_format

### conf
```conf
log_format main "time_ngx:$time_local\t"
                "http_host:$host\t"
                "hostname:$hostname\t"
                "remote_addr:$remote_addr\t"
                "remote_user:$remote_user\t"
# status,method
                "status:$status\t"
                "method:$request_method\t"
                "scheme:$scheme\t"
                "path:$uri\t"
                "query:$args\t"
# Request
                "req_bytes:$request_length\t"
                "req_time:$request_time\t"
                "res_bytes:$bytes_sent\t"
                "res_body_bytes:$body_bytes_sent\t"
                "res_cache_control:$sent_http_cache_control\t"
                "res_content_type:$sent_http_content_type\t"
# upstream
                "upstream_addr:$upstream_addr\t"
                "upstream_taken_time:$upstream_response_time\t"
                "upstream_cache_status:$upstream_cache_status\t"
# tracker
                "x_forwarded_for:$http_x_forwarded_for\t"
                "x_forwarded_for_proto:$http_x_forwarded_for_proto\t"
                "referer:$http_referer\t"
                "accept_language:$http_accept_language\t"
                "user_agent:$http_user_agent\t"
# TLS cipher
                "ssl_cipher:$ssl_cipher\t"
                "ssl_protocol:$ssl_protocol\t"
                "ssl_server_name:$ssl_server_name\t"
                "ssl_client_verify:$ssl_client_verify\t"
                "http2:$http2\t";
```

# sample log
```
time_ngx:13/Dec/2016:12:20:51 +0900	
http_host:172.18.15.23	
hostname:e266fe5fd998	
remote_addr:10.42.131.60	
status:200	
method:GET	
scheme:http	
path:/index.html	
query:-	
req_bytes:375	
req_time:0.000	
res_bytes:948	
res_body_bytes:612	
res_cache_control:-	
res_content_type:text/html; charset=UTF-8	
upstream_addr:-	
upstream_taken_time:-	
upstream_cache_status:-	
x_forwarded_for:10.8.0.2	
x_forwarded_for_proto:-	
referer:-	
accept_language:ja,en-US;q=0.7,en;q=0.3	
user_agent:Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:50.0) Gecko/20100101 Firefox/50.0	
ssl_cipher:-	
ssl_protocol:-	
ssl_server_name:-	
http2:
```