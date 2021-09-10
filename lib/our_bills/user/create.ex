defmodule OurBills.User.Create do
  alias OurBills.{User, Repo}

  def call(params) do
    params
    |> User.build()
    |> create_user()
  end

  defp create_user({:ok, changeset}), do: Repo.insert(changeset)
  defp create_user({:error, _changeset} = error), do: error
end
