## Install Deps

```sh
bundle install
```

## Start App

```sh
bundle exec ruby main.rb
```

## Build Container

```sh
docker build -t 'ruby-app:latest' 
```

## Deploy

```sh
gcloud run deploy --source .
```