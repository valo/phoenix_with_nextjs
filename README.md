# Next.js app with server side rendering and Phoenix API

This is a skeleton of a [Phoenix](http://phoenixframework.org) application, which uses
[Next.js](https://zeit.co/blog/next3) for rendering the frontend and phoenix for
implementing the API. The app uses server side rendering out of the box and can be
deployed on heroku with several very simple steps.

To start the app:

  * Install dependencies with `mix deps.get`
  * Install JS dependencies with `cd app && yarn && cd ..`
  * Update your Postgres setup in `config/dev.exs`
  * Create and migrate your database with `mix ecto.create && mix ecto.migrate`
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:3000`](http://localhost:3000) from your browser. Keep in
mind that this is the address on which the node.js server is running. Using this URL
ensures that the hot module reloading will work properly.

This setup is going to start 2 processes:
  * A Phoenix server, which is routing the traffic and responding to API requests
  * A node server, which is doing the server side rendering

## Structure of the app

All the JS code is in `app/`. The API code is in `lib/` and follows the phoenix 1.3
directory structure. You can find more info on how the JS side works on [Learning Next.js](https://learnnextjs.com). You can read more about how to define the API
endpoints from the [Phoenix docs](https://hexdocs.pm/phoenix/overview.html) or from the excellent [Thoughtbot JSON API guide](https://robots.thoughtbot.com/building-a-phoenix-json-api)

## Why this setup is awesome

This setup allows to develop a React app with server side rendering out of the box.
This ensures that the app can be easily indexed by web crawlers and render very quickly
on mobile devices.

You also define your API using Phoenix, which is a very fast, easy to develop
framework, very similar to Ruby on Rails. Most people rolling such setup use node.js
as an API backend, which is not ideal when the backend starts scaling out and
the complexity of the business logic increases.

Also this setup can be deployed very easily to services like Heroku and can run on
a single dyno, which allows to run it easily on the free plans.

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
