defmodule BalaErp.Base.AttachmentTest do
  use BalaErp.DataCase

  @context BalaErp.Base.Attachment

  describe "attachments" do
    alias BalaErp.Base.Schema.Attachment

    import BalaErp.Base.AttachmentFixtures

    @invalid_attrs %{
      description: nil,
      file: nil,
      name: nil
    }

    test "list_attachments/0 returns all attachments" do
      attachment = attachment_fixture()
      assert @context.list_attachments() == [attachment]
    end

    test "get_attachment!/1 returns the attachment with given id" do
      attachment = attachment_fixture()
      assert @context.get_attachment!(attachment.id) == attachment
    end

    test "create_attachment/1 with valid data creates a attachment" do
      valid_attrs = %{
        description: "some description",
        file: "some file path",
        name: "some secret file",
        size: "some size",
        type: "some type"
      }

      assert {:ok, %Attachment{} = attachment} = @context.create_attachment(valid_attrs)
      assert attachment.description == "some description"
      assert attachment.file == "some file path"
      assert attachment.name == "some secret file"
      assert attachment.size == "some size"
      assert attachment.type == "some type"
    end

    test "create_attachment/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = @context.create_attachment(@invalid_attrs)
    end

    test "update_attachment/2 with valid data updates the attachment" do
      attachment = attachment_fixture()

      update_attrs = %{
        name: "some updated name",
        description: "some updated description"
      }

      assert {:ok, %Attachment{} = attachment} =
               @context.update_attachment(attachment, update_attrs)

      assert attachment.name == "some updated name"
      assert attachment.description == "some updated description"
    end

    test "update_attachment/2 with invalid data returns error changeset" do
      attachment = attachment_fixture()
      assert {:error, %Ecto.Changeset{}} = @context.update_attachment(attachment, @invalid_attrs)
      assert attachment == @context.get_attachment!(attachment.id)
    end

    test "delete_attachment/1 deletes the attachment" do
      attachment = attachment_fixture()
      assert {:ok, %Attachment{}} = @context.delete_attachment(attachment)
      assert_raise Ecto.NoResultsError, fn -> @context.get_attachment!(attachment.id) end
    end

    test "change_attachment/1 returns a attachment changeset" do
      attachment = attachment_fixture()
      assert %Ecto.Changeset{} = @context.change_attachment(attachment)
    end
  end
end
