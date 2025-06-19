## Install Deps

```sh
bundle install
```

## Deploy Functions

```sh
gcloud run deploy ruby-http-function \
--source . \
--function hello_get \
--base-image google-22/ruby34 \
--region northamerica-northeast2 \
--allow-unauthenticated
```

d