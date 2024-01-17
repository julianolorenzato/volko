defmodule Volko.Repo do
  use Ecto.Repo,
    otp_app: :volko,
    adapter: Ecto.Adapters.Postgres
end
