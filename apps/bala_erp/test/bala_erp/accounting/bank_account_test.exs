defmodule BalaErp.Accounting.BankAccountTest do
  use BalaErp.DataCase

  @context BalaErp.Accounting.BankAccount

  describe "bank_accounts" do
    alias BalaErp.Accounting.Schema.BankAccount

    import BalaErp.Accounting.BankAccountFixtures

    @invalid_attrs %{
      name: nil,
      bank: nil,
      account_number: nil
    }

    test "list_bank_accounts/0 returns all bank_accounts" do
      bank_account = bank_account_fixture()
      assert @context.list_bank_accounts() == [bank_account]
    end

    test "get_bank_account!/1 returns the bank_account with given id" do
      bank_account = bank_account_fixture()
      assert @context.get_bank_account!(bank_account.id) == bank_account
    end

    test "create_bank_account/1 with valid data creates a bank_account" do
      valid_attrs = %{
        account_number: "some number",
        bank: "some bank",
        bank_identifier: "some identifier",
        name: "some name"
      }

      assert {:ok, %BankAccount{} = bank_account} = @context.create_bank_account(valid_attrs)
      assert bank_account.account_number == "some number"
      assert bank_account.bank == "some bank"
      assert bank_account.bank_identifier == "some identifier"
      assert bank_account.name == "some name"
    end

    test "create_bank_account/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = @context.create_bank_account(@invalid_attrs)
    end

    test "update_bank_account/2 with valid data updates the bank_account" do
      bank_account = bank_account_fixture()

      update_attrs = %{
        name: "KH - HUF",
        bank: "K&H Bank Zrt."
      }

      assert {:ok, %BankAccount{} = bank_account} =
               @context.update_bank_account(bank_account, update_attrs)

      assert bank_account.name == "KH - HUF"
      assert bank_account.bank == "K&H Bank Zrt."
    end

    test "update_bank_account/2 with invalid data returns error changeset" do
      bank_account = bank_account_fixture()

      assert {:error, %Ecto.Changeset{}} =
               @context.update_bank_account(bank_account, @invalid_attrs)

      assert bank_account == @context.get_bank_account!(bank_account.id)
    end

    test "delete_bank_account/1 deletes the bank_account" do
      bank_account = bank_account_fixture()
      assert {:ok, %BankAccount{}} = @context.delete_bank_account(bank_account)
      assert_raise Ecto.NoResultsError, fn -> @context.get_bank_account!(bank_account.id) end
    end

    test "change_bank_account/1 returns a bank_account changeset" do
      bank_account = bank_account_fixture()
      assert %Ecto.Changeset{} = @context.change_bank_account(bank_account)
    end
  end
end
