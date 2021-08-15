defmodule OurBills.Bills do
  alias OurBills.Repo
  alias OurBills.Bills.Bill

  def create(params) do
    %Bill{}
    |> Bill.changeset(params)
    |> Repo.insert()
  end
end
