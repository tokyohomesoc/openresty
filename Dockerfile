FROM alpine:latest

MAINTAINER Tokyo HOME SOC <github@homesoc.tokyo>

# Docker Build Arguments
## LuaRocks
ARG LUAROCKS_VERSION="2.4.2"
## lua-resty-auto-ssl
ARG LUA_RESTY_AUTO_SSL="0.10.6-1"
## OpenResty
ARG RESTY_VERSION="1.11.2.3"
ARG RESTY_OPENSSL_VERSION="1.0.2k-r0"
ARG RESTY_PCRE_VERSION="8.39"
ARG RESTY_J="1"
ARG RESTY_CONFIG_OPTIONS="\
#    --with-file-aio \
#    --with-http_addition_module \
    --with-http_auth_request_module \
#    --with-http_dav_module \
#    --with-http_flv_module \
#    --with-http_geoip_module=dynamic \
    --with-http_gunzip_module \
    --with-http_gzip_static_module \
#    --with-http_image_filter_module=dynamic \
#    --with-http_mp4_module \
#    --with-http_random_index_module \
#    --with-http_realip_module \
#    --with-http_secure_link_module \
#    --with-http_slice_module \
    --with-http_ssl_module \
    --with-http_stub_status_module \
#    --with-http_sub_module \
    --with-http_v2_module \
#    --with-http_xslt_module=dynamic \
    --with-ipv6 \
#    --with-mail \
#    --with-mail_ssl_module \
#    --with-md5-asm \
#    --with-pcre-jit \
#    --with-sha1-asm \
    --with-stream \
    --with-stream_ssl_module \
    --with-threads \
    "

# These are not intended to be user-specified
ARG _RESTY_CONFIG_DEPS="\
    --with-pcre=/usr/local/src/pcre-${RESTY_PCRE_VERSION} \
#    --with-openssl=/tmp/openssl-${RESTY_OPENSSL_VERSION} \
    "
ARG _LUAROCKS_CONFIG_DEPS="\
    --prefix=/usr/local/openresty/luajit \
    --with-lua=/usr/local/openresty/luajit/ \
    --lua-suffix=jit \
    --with-lua-include=/usr/local/openresty/luajit/include/luajit-2.1 \
    "


# 1) Install apk dependencies
# 2) Download and untar OpenSSL, PCRE, and OpenResty
# 3) Build OpenResty
# 4) Cleanup

RUN \
    apk add --no-cache --virtual .build-deps \
        build-base \
        curl \
        gd-dev \
        geoip-dev \
        libxslt-dev \
        linux-headers \
        make \
        perl-dev \
        readline-dev \
        zlib-dev \
        openssl-dev=${RESTY_OPENSSL_VERSION} \
    && apk add --no-cache \
        gd \
        geoip \
        libgcc \
        libxslt \
        zlib \
        bash \
        openssl=${RESTY_OPENSSL_VERSION} \
    && mkdir -p /usr/local/src \
    && cd /usr/local/src \
#    && curl -fSL https://www.openssl.org/source/openssl-${RESTY_OPENSSL_VERSION}.tar.gz \
#        -o openssl-${RESTY_OPENSSL_VERSION}.tar.gz \
#    && tar xzf openssl-${RESTY_OPENSSL_VERSION}.tar.gz \
    && curl -fSL https://ftp.pcre.org/pub/pcre/pcre-${RESTY_PCRE_VERSION}.tar.gz \
        -o pcre-${RESTY_PCRE_VERSION}.tar.gz \
    && tar xzf pcre-${RESTY_PCRE_VERSION}.tar.gz \
    && curl -fSL https://openresty.org/download/openresty-${RESTY_VERSION}.tar.gz \
        -o openresty-${RESTY_VERSION}.tar.gz \
    && tar xzf openresty-${RESTY_VERSION}.tar.gz \
    && cd openresty-${RESTY_VERSION} \
#   =============================================
    && sed -ie 's/\[http_iconv/#\[http_iconv/g' configure \
    && sed -ie 's/\[http_echo/#\[http_echo/g' configure \
    && sed -ie 's/\[http_xss/#\[http_xss/g' configure \
    && sed -ie 's/\[http_coolkit/#\[http_coolkit/g' configure \
    && sed -ie 's/\[http_set_misc/#\[http_set_misc/g' configure \
    && sed -ie 's/\[http_form_input/#\[http_form_input/g' configure \
    && sed -ie 's/\[http_encrypted_session/#\[http_encrypted_session/g' configure \
    && sed -ie 's/\[http_drizzle/#\[http_drizzle/g' configure \
    && sed -ie 's/\[http_postgres/#\[http_postgres/g' configure \
    && sed -ie 's/\[http_lua_upstream/#\[http_lua_upstream/g' configure \
    && sed -ie 's/\[http_array_var/#\[http_array_var/g' configure \
    && sed -ie 's/\[http_memc/#\[http_memc/g' configure \
    && sed -ie 's/\[http_redis2/#\[http_redis2/g' configure \
    && sed -ie 's/\[http_redis/#\[http_redis/g' configure \
    && sed -ie 's/\[http_rds_json/#\[http_rds_json/g' configure \
    && sed -ie 's/\[http_rds_csv/#\[http_rds_csv/g' configure \
#   =============================================
    && ./configure -j${RESTY_J} ${_RESTY_CONFIG_DEPS} ${RESTY_CONFIG_OPTIONS} \
    && make -j${RESTY_J} \
    && make -j${RESTY_J} install \
    && cd /usr/local/src \
    && rm -rf \
#        openssl-${RESTY_OPENSSL_VERSION} \
#        openssl-${RESTY_OPENSSL_VERSION}.tar.gz \
        pcre-${RESTY_PCRE_VERSION} \
        pcre-${RESTY_PCRE_VERSION}.tar.gz \
        openresty-${RESTY_VERSION} \
        openresty-${RESTY_VERSION}.tar.gz \
    \
    # Install LuaRocks
    ## http://openresty.org/en/using-luarocks.html
    && curl -fSL http://luarocks.github.io/luarocks/releases/luarocks-${LUAROCKS_VERSION}.tar.gz \
        -o luarocks-${LUAROCKS_VERSION}.tar.gz \
    && tar -xzf luarocks-${LUAROCKS_VERSION}.tar.gz \
    && cd luarocks-${LUAROCKS_VERSION} \
    && ./configure ${_LUAROCKS_CONFIG_DEPS} \
    && make build \
    && make install \
    && cd .. \
    && rm -rf \
        luarocks-${LUAROCKS_VERSION} \
        luarocks-${LUAROCKS_VERSION}.tar.gz \
    \
    # Install lua-resty-auto-ssl
    ## https://github.com/GUI/lua-resty-auto-ssl
    &&  /usr/local/openresty/luajit/bin/luarocks install lua-resty-auto-ssl ${LUA_RESTY_AUTO_SSL} \
    && mkdir /etc/resty-auto-ssl \
    && apk del .build-deps \
    && ln -sf /dev/stdout /usr/local/openresty/nginx/logs/access.log \
    && ln -sf /dev/stderr /usr/local/openresty/nginx/logs/error.log

# Add additional binaries into PATH for convenience
ENV PATH=$PATH:/usr/local/openresty/luajit/bin/:/usr/local/openresty/nginx/sbin/:/usr/local/openresty/bin/

CMD ["/usr/local/openresty/bin/openresty", "-g", "daemon off;"]
