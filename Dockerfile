# Set linux Alpine 3.7 image with ruby 2.5 installed
# Others oficial ruby images: https://hub.docker.com/_/ruby/
FROM thyrlian/android-sdk

# Define environment variables
ENV HOME /root
ENV DEBIAN_FRONTEND noninteractive

# Install required libraries and dependencies
RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y wget git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libxml2-dev libxslt1-dev libcurl4-openssl-dev software-properties-common libffi-dev

ENTRYPOINT ["./entrypoint.sh"]