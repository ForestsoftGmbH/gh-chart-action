FROM  quay.io/helmpack/chart-testing:v3.7.1

RUN apk add --update git openssh-client sed rsync
RUN mkdir -p /root/.ssh
RUN git config --global user.email "foerster@forestsoft.de"
RUN git config --global user.name "Sebastian" 
RUN ssh-keyscan -t rsa github.com >> /root/.ssh/known_hosts 
RUN chmod 600 /root/.ssh/known_hosts

COPY ./.ct/ /root/.ct/
WORKDIR /ct/
COPY release.sh /ct/release.sh
COPY build.sh /ct/release.sh

ENTRYPOINT ["/ct/run.sh"]
