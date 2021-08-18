defmodule OurBills.Bills do
  import Ecto.Query

  alias OurBills.Repo
  alias OurBills.Bills.Bill

  def create(params) do
    %Bill{}
    |> Bill.changeset(params)
    |> Repo.insert()
  end

  def update(bill, params) do
    bill
    |> Bill.changeset(params)
    |> Repo.update()
  end

  def delete(bill) do
    bill
    |> Repo.delete()
  end

  def get_bill(id) do
    Bill
    |> where(id: ^id)
    |> Repo.one()
    |> handle_one_response()
  end

  def list_by_month(month) do
    {parsed_month, _} = Integer.parse(month)

    from(b in Bill,
      where: fragment("EXTRACT(MONTH FROM ?)", b.bill_date) == ^parsed_month
    )
    |> Repo.all()
  end

  defp handle_one_response(nil), do: {:error, :bill_not_found}
  defp handle_one_response(bill), do: {:ok, bill}
end
