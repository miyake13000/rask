FROM  ruby:3.0.1
RUN mkdir /rask
WORKDIR /rask
COPY ./Gemfile /rask/Gemfile
COPY ./Gemfile.lock /rask/Gemfile.lock
RUN bundle install
COPY ./docker-entrypoint.sh /docker-entrypoint.sh
CMD ["/docker-entrypoint.sh"]
