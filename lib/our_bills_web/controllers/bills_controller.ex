defmodule OurBillsWeb.BillsController do
  use OurBillsWeb, :controller

  alias OurBills

  def index(conn, %{"month" => month}) do
    month
    |> OurBills.list_bills()
    |> handle_list_response(conn)
  end

  def create(conn, params) do
    params
    |> OurBills.create_bill()
    |> handle_response(conn, "create.json", :created)
  end

  def update(conn, params) do
    params
    |> OurBills.update_bill()
    |> handle_response(conn, "update.json", :ok)
  end

  def delete(conn, %{"id" => id}) do
    id
    |> OurBills.delete_bill()
    |> handle_delete(conn)
  end

  defp handle_list_response(bills, conn) do
    conn
    |> put_status(:ok)
    |> render("index.json", bills: bills)
  end

  defp handle_delete({:ok, _bill}, conn) do
    conn
    |> put_status(:no_content)
    |> text("")
  end

  defp handle_delete({:error, _reason} = error, _conn), do: error

  defp handle_response({:ok, bill}, conn, view, status) do
    conn
    |> put_status(status)
    |> render(view, bill: bill)
  end

  defp handle_response({:error, _changeset} = error, _conn, _view, _status), do: error
end
