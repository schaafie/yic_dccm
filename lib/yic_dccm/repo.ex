defmodule YicDccm.Repo do
  use Ecto.Repo,
    otp_app: :yic_dccm,
    adapter: Ecto.Adapters.Postgres
end
