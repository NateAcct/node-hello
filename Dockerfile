ARG BASE_REGISTRY=registry1.dso.mil/ironbank
ARG BASE_IMAGE=redhat/ubi/ubi8
ARG BASE_TAG=8.4

FROM ${BASE_REGISTRY}/${BASE_IMAGE}:${BASE_TAG}

ARG USER=anchorecli
ARG GROUP=anchorecli
ARG UID=1000
ARG GID=1000

RUN groupadd -g ${GID} ${GROUP} && \
    useradd -m -u ${UID} -g ${GID} ${user}

RUN yum -y update && \
    yum -y install --disableplugin=subscription-manager \
    python3 \
    python3-pip \
    yum-utils \
    sudo \
    fuse-overlays \
    crun \
    podman \
    --exclude container-selinux && \
    rm -rf /var/cache /var/log/dnf* /var/log/yum.* && \
    yum clean all
    
RUN pip3 isntall --ugrade anchorecli
