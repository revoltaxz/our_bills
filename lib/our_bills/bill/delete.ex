defmodule OurBills.Bill.Delete do
  alias Ecto.UUID
  alias OurBills.{Bill, Repo}

  def call(id) do
    case UUID.cast(id) do
      :error -> {:error, "Invalid ID Format"}
      {:ok, uuid} -> delete(uuid)
    end
  end

  defp delete(uuid) do
    case fetch_bill(uuid) do
      nil -> {:error, "Bill not found"}
      bill -> Repo.delete(bill)
    end
  end

  defp fetch_bill(uuid), do: Repo.get(Bill, uuid)
end
