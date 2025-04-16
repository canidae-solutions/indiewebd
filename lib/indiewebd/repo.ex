defmodule Indiewebd.Repo do
  use Ecto.Repo,
    otp_app: :indiewebd,
    adapter: Ecto.Adapters.Postgres
end
