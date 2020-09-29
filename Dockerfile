FROM ruby:2.6.3

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
&& echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

RUN curl -sL https://deb.nodesource.com/setup_10.x | bash && apt-get update -qq && \
apt-get install -y build-essential libpq-dev nodejs yarn vim

RUN gem install bundler
ENV APP_HOME /careyou
RUN mkdir -p $APP_HOME
WORKDIR $APP_HOME
ADD . $APP_HOME
ADD Gemfile Gemfile
ADD Gemfile.lock Gemfile.lock
RUN bundle install
