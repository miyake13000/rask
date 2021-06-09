FROM  ruby:3.0.1

RUN mkdir /rask
WORKDIR /rask

COPY ./Gemfile /rask/Gemfile
COPY ./Gemfile.lock /rask/Gemfile.lock
RUN bundle install

RUN curl https://deb.nodesource.com/setup_12.x | bash
RUN curl https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update -qq && apt-get install -y nodejs yarn
COPY . /rask/
RUN bundle exec rails webpacker:install

COPY ./docker-entrypoint.sh /docker-entrypoint.sh

CMD ["/docker-entrypoint.sh"]
