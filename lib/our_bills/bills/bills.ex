defmodule OurBills.Bills do
  import Ecto.Query

  alias OurBills.Repo
  alias OurBills.Bills.Bill

  def create(params) do
    %Bill{}
    |> Bill.changeset(params)
    |> Repo.insert()
  end

  def list_by_month(month) do
    from(b in Bill,
      where: fragment("EXTRACT(MONTH FROM ?)", b.bill_date) == ^month
    )
    |> Repo.all()
  end
end
