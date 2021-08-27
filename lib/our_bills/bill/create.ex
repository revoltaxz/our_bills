defmodule OurBills.Bill.Create do
  alias OurBills.{Bill, Repo}

  def call(params) do
    params
    |> Bill.build()
    |> create_bill()
  end

  defp create_bill({:ok, changeset}), do: Repo.insert(changeset)
  defp create_bill({:error, _changeset} = error), do: error
end
