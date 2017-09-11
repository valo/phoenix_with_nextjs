# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     PhoenixWithNextjs.Repo.insert!(%PhoenixWithNextjs.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

PhoenixWithNextjs.Repo.insert!(%PhoenixWithNextjs.Item{name: "Milk"})
PhoenixWithNextjs.Repo.insert!(%PhoenixWithNextjs.Item{name: "Butter"})
PhoenixWithNextjs.Repo.insert!(%PhoenixWithNextjs.Item{name: "Bread"})
