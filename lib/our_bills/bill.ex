defmodule OurBills.Bill do
  use OurBills.BaseSchema

  @required_fields ~w(amount title bill_date)a
  @optional_fields ~w(description)a

  schema "bills" do
    field :amount, Money.Ecto.Amount.Type
    field :title, :string, max: 100
    field :description, :string, max: 255
    field :bill_date, :date

    timestamps()
  end

  def build(params) do
    params
    |> changeset()
    |> apply_action(:insert)
  end

  def changeset(attrs), do: create_changeset(%__MODULE__{}, attrs)
  def changeset(bill, attrs), do: create_changeset(bill, attrs)

  defp create_changeset(module_or_bill, attrs) do
    module_or_bill
    |> cast(attrs, @required_fields ++ @optional_fields)
    |> validate_required(@required_fields)
  end
end
