defmodule BalaErp.Repo do
  use Ecto.Repo,
    otp_app: :bala_erp,
    adapter: Ecto.Adapters.Postgres
end
