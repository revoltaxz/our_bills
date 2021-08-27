defmodule OurBills.Bill.Index do
  import Ecto.Query

  alias OurBills.{Bill, Repo}

  def call(month) do
    list(month)
  end

  defp list(month) do
    list_bills_by_month(month)
  end

  def list_bills_by_month(month) do
    {parsed_month, _} = Integer.parse(month)

    from(b in Bill,
      where: fragment("EXTRACT(MONTH FROM ?)", b.bill_date) == ^parsed_month
    )
    |> Repo.all()
  end
end
