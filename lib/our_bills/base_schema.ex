defmodule OurBills.BaseSchema do
  @moduledoc """
  Import common modules and setting up attributes
  to use binary_id in primary keys.
  """

  defmacro __using__(_) do
    quote do
      import Ecto.Changeset
      use Ecto.Schema

      @type t :: %unquote(__CALLER__.module){}

      @primary_key {:id, :binary_id, autogenerate: true}
      @foreign_key_type :binary_id
    end
  end
end
