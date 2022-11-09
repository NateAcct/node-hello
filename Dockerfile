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

# RUN anchore-cli --url http://localhost:8228/v1 --u admin --p foobar system status

ADD containers.conf /etc/containers/

RUN chmod 644 /etc/containers/containers.conf; \
    sed -i -e 's|^#mount_program|mount_program|g' -e '/additionalimage.*/a "/var/lib/shared",' -e 's|^mountopt[[:space:]]*=.*$|mountopt = "nodev,fsync=0"|g' /etc/containers/storage.conf
    
RUN mkdir -p /var/lib/shared/overlay-images /var/lib/shared/overlay-layers /var/lib/shared/vfs-images /var/lib/shared/vfs-layers; \
    touch /var/lib/shared/overlay-images/images.lock; \
    touch /var/lib/shared/overlay-layers/layers.lock; \
    touch /var/lib/shared/vfs-images/images.lock; \
    touch /var/lib/shared/vfs-layers/layers.lock
    
ENV _CONTAINERS_USERNS_CONFIGURED=""

RUN echo ${USER} ' ALL=(root)   NOPASSWD: /usr/bin/podman' >> /etc/sudoers

USER ${USER}

CMD ["/bin/bash"]
