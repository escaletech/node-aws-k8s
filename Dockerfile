FROM cimg/base:stable

# Installs envsubst
RUN \
  apt-get update \
  && apt-get -y install gettext-base

# Installs aws-cli
RUN \
  apt-get install -y python-pip python-dev && \
  pip install --upgrade awscli

# Installs node
ENV NODE_VERSION 10.0.0
RUN curl -L -o node.tar.xz "https://nodejs.org/dist/v${NODE_VERSION}/node-v${NODE_VERSION}-linux-x64.tar.xz" && \
	tar -xJf node.tar.xz -C /usr/local --strip-components=1 && \
	rm node.tar.xz && \
	ln -s /usr/local/bin/node /usr/local/bin/nodejs

# Installs yarn
ENV YARN_VERSION 1.19.1
RUN curl -L -o yarn.tar.gz "https://yarnpkg.com/downloads/${YARN_VERSION}/yarn-v${YARN_VERSION}.tar.gz" && \
	tar -xzf yarn.tar.gz -C /opt/ && \
	rm yarn.tar.gz && \
	ln -s /opt/yarn-v${YARN_VERSION}/bin/yarn /usr/local/bin/yarn && \
	ln -s /opt/yarn-v${YARN_VERSION}/bin/yarnpkg /usr/local/bin/yarnpkg

# Installs kubernetes
RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl && \
	chmod +x ./kubectl && \
	mv ./kubectl /usr/local/bin

COPY ./scripts /scripts
