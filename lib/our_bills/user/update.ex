defmodule OurBills.User.Update do
  alias Ecto.UUID
  alias OurBills.{User, Repo}

  def call(%{"id" => id} = params) do
    case UUID.cast(id) do
      :error -> {:error, "Invalid ID Format"}
      {:ok, _uuid} -> update(params)
    end
  end

  defp update(%{"id" => id} = params) do
    case fetch_user(id) do
      nil -> {:error, "User not found"}
      user -> update_user(user, params)
    end
  end

  defp fetch_user(uuid), do: Repo.get(User, uuid)

  defp update_user(user, params) do
    user
    |> User.changeset(params)
    |> Repo.update()
  end
end
