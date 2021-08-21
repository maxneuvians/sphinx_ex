defmodule SphinxEx.Repo do
  use Ecto.Repo,
    otp_app: :sphinx_ex,
    adapter: Ecto.Adapters.Postgres
end
