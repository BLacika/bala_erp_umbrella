defmodule BalaErp.Accounting.BankAccountFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `BalaErp.Accounting.BankAccount` context.
  """

  @doc """
  Generate a bank_account.
  """
  def bank_account_fixture(attrs \\ %{}) do
    {:ok, bank_account} =
      attrs
      |> Enum.into(%{
        account_number: "12345678-12345678-12345678",
        bank: "OTP Bank Zrt.",
        bank_identifier: "OTPBANK1",
        name: "Bank - HUF"
      })
      |> BalaErp.Accounting.BankAccount.create_bank_account()

    bank_account
  end
end
