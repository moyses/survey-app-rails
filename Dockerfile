FROM ruby:3.0.4

WORKDIR /survey-app-rails

RUN apt-get update -qq && apt-get install -y nodejs postgresql-client imagemagick libvips

COPY Gemfile /survey-app-rails/Gemfile
COPY Gemfile.lock /survey-app-rails/Gemfile.lock

RUN bundle install

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]

EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]
