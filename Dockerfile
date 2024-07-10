FROM kong:3.3.0
LABEL description="Alpine + Kong 3.3.0 + kong-oidc plugin"
ENV OIDC_PLUGIN_VERSION=1.3.2-1
USER root
#RUN apk --no-cache add curl git unzip luarocks
#RUN apt-get update -y
#RUN apt-get install -y curl git unzip luarocks
RUN git clone https://github.com/aoalatas/kong-oidc.git
RUN mv kong-oidc/kong-oidc.rockspec kong-oidc/kong-oidc-1.3.2-1.rockspec
RUN luarocks install kong-oidc/kong-oidc-1.3.2-1.rockspec
#RUN luarocks install kong-spec-expose
#RUN luarocks install lua-resty-redis-connector
USER kong