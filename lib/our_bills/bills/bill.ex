defmodule OurBills.Bills.Bill do
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

  def changeset(bill, attrs) do
    bill
    |> cast(attrs, @required_fields ++ @optional_fields)
    |> validate_required(@required_fields)
  end
end
