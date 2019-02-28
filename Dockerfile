FROM thyrlian/android-sdk

# Define environment variables
ENV HOME /root
ENV DEBIAN_FRONTEND noninteractive
ENV RBENV_DIR ~/.rbenv
ENV RUBY_VERSION 2.5.3
ENV RUBY_VERSION_PATH 2.5
ENV NODE_MAJOR_VERSION 10
ENV YARN_VERSION 1.13.0

# Install required libraries and dependencies
RUN apt-get update
RUN apt-get install -y build-essential git-core curl \
  zlib1g-dev libssl-dev libreadline-dev libyaml-dev \
  libxml2-dev libxslt1-dev libcurl4-openssl-dev \
  software-properties-common libffi-dev apt-transport-https \
  autoconf bison libssl-dev  libreadline6-dev libncurses5-dev \
  libgdbm3 libgdbm-dev

# Install Ruby
RUN cd
RUN wget http://ftp.ruby-lang.org/pub/ruby/$RUBY_VERSION_PATH/ruby-$RUBY_VERSION.tar.gz
RUN tar -xzvf ruby-$RUBY_VERSION.tar.gz
RUN cd ruby-$RUBY_VERSION/
RUN ./ruby-$RUBY_VERSION/configure
RUN make
RUN make install

RUN gem install bundler

# Install NodeJS
RUN curl -sL https://deb.nodesource.com/setup_$NODE_MAJOR_VERSION.x | bash -
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update
RUN apt-get install -y nodejs yarn

RUN nodejs -v
RUN yarn -v
RUN ruby -v
