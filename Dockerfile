ARG PACKS="./stackstorm-email/tmp/stackstorm-st2"

FROM stackstorm/st2packs:builder AS builder
# considering you have your "local" pack under the `stackstorm-st2` dir relative to Dockerfile
# Here we copy local "stackstorm-st2" dir into Docker's "/tmp/stackstorm-st2"
COPY stackstorm-st2 /tmp/stackstorm-st2/
# Check it
RUN ls -la /tmp/stackstorm-st2

RUN /opt/stackstorm/st2/bin/st2-pack-install ${PACKS}
FROM stackstorm/st2packs:runtime
