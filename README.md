# Next.JS app with server side rendering and Phoenix API

To start the app:

  * Install dependencies with `mix deps.get`
  * Install JS dependencies with `cd app && yarn && cd ..`
  * Create and migrate your database with `mix ecto.create && mix ecto.migrate`
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

This setup is going to start 2 processes:
  * A Phoenix server, which is routing the traffic and responding to API requests
  * A node server, which is doing the server side rendering

## Why this setup is awesome

This setup allows to develop a React app with server side rendering out of the box.
This ensures that the app can be easily indexed by web crawlers and render very quickly
on mobile devices.

You also define your API using Phoenix, which is a very fast and easy to develop
framework, very similar to Ruby on Rails. Most people rolling such setup use node.js
as an API backend, which is not ideal the moment and backend start scaling out and
the complexity of the business logic start to increase.

Also this setup can be deployed very easily to services like Heroku and can run on
a single dyno, which allows to use the free tiers.

## Deploying on Heroku

You can deploy the app very easily to heroku following these steps:

1. Clone the app with `git clone https://github.com/valo/phoenix_with_nextjs.git`
2. Go into the `phoenix_with_nextjs` folder `cd phoenix_with_nextjs`
3. Make sure you have installed and configured the [heroku cli](https://devcenter.heroku.com/articles/heroku-cli)
4. Create a heroku app with the needed buildpacks and a Postgres addon:

```bash
heroku create --buildpack "https://github.com/HashNuke/heroku-buildpack-elixir.git" --addons heroku-postgresql
heroku buildpacks:add https://github.com/gjaldon/heroku-buildpack-phoenix-static.git
```
5. Take a note of the URL of the new app and set the URL in the `WEBSITE_URL` variable

```bash
heroku config:add WEBSITE_URL=<url_of_the_new_app>
```

6. Deploy the app with `git push heroku`

## TODO:

* Hot module reloading is not working properly at the moment, because I haven't figured out
how to reverse proxy the WebSocket connection used by the HMR webpack plugin. Once this is
fixed the HMR will work.
