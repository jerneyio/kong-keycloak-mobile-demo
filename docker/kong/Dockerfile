FROM kong:0.14-centos

LABEL description="Centos 7 + Kong 0.14 + kong-oidc plugin"

RUN yum install -y git unzip && yum clean all

RUN luarocks install kong-oidc