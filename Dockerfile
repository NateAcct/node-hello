ARG BASE_REGISTRY=registry1.dso.mil/ironbank
ARG BASE_IMAGE=redhat/ubi/ubi8
ARG BASE_TAG=8.4

# FROM ${BASE_REGISTRY}/${BASE_IMAGE}:${BASE_TAG}
FROM registry.access.redhat.com/ubi8:8.4

ARG USER=anchorecli
ARG GROUP=anchorecli
ARG UID=1000
ARG GID=1000

RUN groupadd -g ${GID} ${GROUP} && useradd -m -u ${UID} -g ${GID} ${USER}

RUN yum -y update && \
    yum -y install --disableplugin=subscription-manager \
    python3 \
    python3-pip \
    yum-utils \
    sudo \
    fuse-overlayfs \
    crun \
    podman \
    --exclude container-selinux && \
    rm -rf /var/cache /var/log/dnf* /var/log/yum.* && \
    yum clean all
    
RUN pip3 install --upgrade anchorecli

RUN anchore-cli --url http://localhost:8228/v1 --u admin --p foobar system status
