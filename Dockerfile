FROM  quay.io/helmpack/chart-testing:v3.7.1

RUN apk add --update git openssh-client sed rsync
RUN mkdir -p /root/.ssh /ct/s
RUN git config --global user.email "foerster@forestsoft.de"
RUN git config --global user.name "Sebastian" 

COPY ./.ct/ /root/.ct/

COPY release.sh /ct/release.sh
COPY build.sh /ct/build.sh

ENTRYPOINT ["/ct/run.sh"]
