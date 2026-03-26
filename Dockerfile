FROM ruby:3.2

ARG UID
ARG GID

RUN apt-get update -qq && apt-get install -y \
  build-essential \
  libpq-dev \
  nodejs \
  postgresql-client \
  libvips-dev && \
  rm -rf /var/lib/apt/lists/*

RUN groupadd -g $GID appgroup \
 && useradd -m -u $UID -g appgroup appuser

WORKDIR /app

COPY Gemfile Gemfile.lock ./
RUN bundle install

COPY . .

USER appuser

EXPOSE 3000

CMD ["bash","-c","rm -f tmp/pids/server.pid && bundle exec rails server -b 0.0.0.0"]
