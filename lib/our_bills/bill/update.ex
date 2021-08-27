defmodule OurBills.Bill.Update do
  alias Ecto.UUID
  alias OurBills.{Bill, Repo}

  def call(%{"id" => id} = params) do
    case UUID.cast(id) do
      :error -> {:error, "Invalid ID Format"}
      {:ok, _uuid} -> update(params)
    end
  end

  defp update(%{"id" => id} = params) do
    case fetch_bill(id) do
      nil -> {:error, "Bill not found"}
      bill -> update_bill(bill, params)
    end
  end

  defp fetch_bill(uuid), do: Repo.get(Bill, uuid)

  defp update_bill(bill, params) do
    bill
    |> Bill.changeset(params)
    |> Repo.update()
  end
end
