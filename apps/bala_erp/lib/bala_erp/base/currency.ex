defmodule BalaErp.Base.Currency do
  @moduledoc """
  The Base.Currency context.
  """

  import Ecto.Query, warn: false
  alias BalaErp.Repo

  alias BalaErp.Base.Schema.Currency

  @doc """
  Returns the list of currencies.

  ## Examples

      iex> list_currencies()
      [%Currency{}, ...]

  """
  def list_currencies do
    Repo.all(Currency)
  end

  @doc """
  Gets a single currency.

  Raises if the Currency does not exist.

  ## Examples

      iex> get_currency!(123)
      %Currency{}

  """
  def get_currency!(id), do: Repo.get!(Currency, id)

  @doc """
  Creates a currency.

  ## Examples

      iex> create_currency(%{field: value})
      {:ok, %Currency{}}

      iex> create_currency(%{field: bad_value})
      {:error, ...}

  """
  def create_currency(attrs \\ %{}) do
    %Currency{}
    |> Currency.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a currency.

  ## Examples

      iex> update_currency(currency, %{field: new_value})
      {:ok, %Currency{}}

      iex> update_currency(currency, %{field: bad_value})
      {:error, ...}

  """
  def update_currency(%Currency{} = currency, attrs) do
    currency
    |> Currency.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Currency.

  ## Examples

      iex> delete_currency(currency)
      {:ok, %Currency{}}

      iex> delete_currency(currency)
      {:error, ...}

  """
  def delete_currency(%Currency{} = currency) do
    Repo.delete(currency)
  end

  @doc """
  Returns a data structure for tracking currency changes.

  ## Examples

      iex> change_currency(currency)
      %Todo{...}

  """
  def change_currency(%Currency{} = currency, attrs \\ %{}) do
    Currency.changeset(currency, attrs)
  end
end
