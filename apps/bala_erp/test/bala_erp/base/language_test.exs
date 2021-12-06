defmodule BalaErp.Base.LanguageTest do
  use BalaErp.DataCase

  @context BalaErp.Base.Language

  describe "languages" do
    alias BalaErp.Base.Schema.Language

    import BalaErp.Base.LanguageFixtures

    @invalid_attrs %{
      active: nil,
      code: nil,
      date_format: nil,
      decimal_separator: nil,
      name: nil,
      thousands_separator: nil,
      time_format: nil
    }

    test "list_languages/0 returns all languages" do
      language = language_fixture()
      assert @context.list_languages() == [language]
    end

    test "get_language!/1 returns the language with given id" do
      language = language_fixture()
      assert @context.get_language!(language.id) == language
    end

    test "create_language/1 with valid data creates a language" do
      valid_attrs = %{
        active: true,
        code: "some code",
        date_format: "yyyy.mm.dd",
        decimal_separator: ".",
        name: "some name",
        thousands_separator: "_",
        time_format: "hh.mm"
      }

      assert {:ok, %Language{} = language} = @context.create_language(valid_attrs)
      assert language.active == true
      assert language.code == "some code"
      assert language.date_format == "yyyy.mm.dd"
      assert language.decimal_separator == "."
      assert language.name == "some name"
      assert language.thousands_separator == "_"
      assert language.time_format == "hh.mm"
    end

    test "create_language/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = @context.create_language(@invalid_attrs)
    end

    test "update_language/2 with valid data updates the language" do
      language = language_fixture()

      update_attrs = %{
        code: "some code",
        date_format: "yyyy.mm.dd",
        decimal_separator: ".",
        name: "some name"
      }

      assert {:ok, %Language{} = language} = @context.update_language(language, update_attrs)
      assert language.code == "some code"
      assert language.date_format == "yyyy.mm.dd"
      assert language.decimal_separator == "."
      assert language.name == "some name"
    end

    test "update_language/2 with invalid data returns error changeset" do
      language = language_fixture()
      assert {:error, %Ecto.Changeset{}} = @context.update_language(language, @invalid_attrs)
      assert language == @context.get_language!(language.id)
    end

    test "delete_language/1 deletes the language" do
      language = language_fixture()
      assert {:ok, %Language{}} = @context.delete_language(language)
      assert_raise Ecto.NoResultsError, fn -> @context.get_language!(language.id) end
    end

    test "change_language/1 returns a language changeset" do
      language = language_fixture()
      assert %Ecto.Changeset{} = @context.change_language(language)
    end
  end
end
