defmodule OurBills.User do
  use OurBills.BaseSchema

  @primary_key {:id, Ecto.UUID, autogenerate: true}
  @required_fields [:name, :password]

  schema "users" do
    field :name, :string
    field :password_hash, :string
    field :password, :string, virtual: true
    timestamps()
  end

  def build(params) do
    params
    |> changeset()
    |> apply_action(:insert)
  end

  def changeset(user, params), do: create_changeset(user, params)
  def changeset(params), do: create_changeset(%__MODULE__{}, params)

  defp create_changeset(module_or_user, params) do
    module_or_user
    |> cast(params, @required_fields)
    |> validate_required(@required_fields)
    |> validate_length(:password, min: 6)
    |> put_pass_hash()
  end

  defp put_pass_hash(%Ecto.Changeset{valid?: true, changes: %{password: password}} = changeset) do
    change(changeset, Argon2.add_hash(password))
  end

  defp put_pass_hash(changeset), do: changeset
end
