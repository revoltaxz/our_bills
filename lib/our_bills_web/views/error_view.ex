defmodule OurBillsWeb.ErrorView do
  use OurBillsWeb, :view

  import Ecto.Changeset, only: [traverse_errors: 2]

  def template_not_found(template, _assigns) do
    %{errors: %{detail: Phoenix.Controller.status_message_from_template(template)}}
  end

  def render("404.json", %{result: :bill_not_found}) do
    %{
      title: "Bill not found",
      status: "404",
      message: "You must insert a valid and existent bill id"
    }
  end

  def render("400.json", %{result: result}) do
    %{message: translate_errors(result)}
  end

  defp translate_errors(changeset) do
    traverse_errors(changeset, fn {msg, opts} ->
      Enum.reduce(opts, msg, fn {key, value}, acc ->
        String.replace(acc, "%{#{key}}", to_string(value))
      end)
    end)
  end
end
