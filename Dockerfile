FROM thyrlian/android-sdk

# Define environment variables
ENV HOME /root
ENV DEBIAN_FRONTEND noninteractive
ENV RUBY_VERSION 2.5.3
ENV NODE_MAJOR_VERSION 10
ENV YARN_VERSION 1.13.0

# Install required libraries and dependencies
RUN apt-get update
RUN apt-get install -y build-essential git-core curl \
  zlib1g-dev libssl-dev libreadline-dev libyaml-dev \
  libxml2-dev libxslt1-dev libcurl4-openssl-dev \
  software-properties-common libffi-dev apt-transport-https

# Install Ruby
RUN apt-get install -y rbenv ruby-build ruby-dev
RUN git clone https://github.com/rbenv/ruby-build.git "$(rbenv root)"/plugins/ruby-build

RUN rbenv install -l
RUN rbenv install $RUBY_VERSION

RUN echo 'eval "$(rbenv init -)"' >> ~/.bashrc
RUN rbenv global $RUBY_VERSION

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
