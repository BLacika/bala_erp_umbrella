defmodule BalaErp.Base.Rate do
  @moduledoc """
  The Base.Rate context.
  """

  import Ecto.Query, warn: false
  alias BalaErp.Repo

  alias BalaErp.Base.Schema.Rate

  @doc """
  Returns the list of rates.

  ## Examples

      iex> list_rates()
      [%Rate{}, ...]

  """
  def list_rates do
    Repo.all(Rate)
  end

  @doc """
  Gets a single rate.

  Raises if the Rate does not exist.

  ## Examples

      iex> get_rate!(123)
      %Rate{}

  """
  def get_rate!(id), do: Repo.get!(Rate, id)

  @doc """
  Creates a rate.

  ## Examples

      iex> create_rate(%{field: value})
      {:ok, %Rate{}}

      iex> create_rate(%{field: bad_value})
      {:error, ...}

  """
  def create_rate(attrs \\ %{}) do
    %Rate{}
    |> Rate.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a rate.

  ## Examples

      iex> update_rate(rate, %{field: new_value})
      {:ok, %Rate{}}

      iex> update_rate(rate, %{field: bad_value})
      {:error, ...}

  """
  def update_rate(%Rate{} = rate, attrs) do
    rate
    |> Rate.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Rate.

  ## Examples

      iex> delete_rate(rate)
      {:ok, %Rate{}}

      iex> delete_rate(rate)
      {:error, ...}

  """
  def delete_rate(%Rate{} = rate) do
    Repo.delete(rate)
  end

  @doc """
  Returns a data structure for tracking rate changes.

  ## Examples

      iex> change_rate(rate)
      %Todo{...}

  """
  def change_rate(%Rate{} = rate, attrs \\ %{}) do
    Rate.changeset(rate, attrs)
  end
end
