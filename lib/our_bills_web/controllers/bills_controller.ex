defmodule OurBillsWeb.BillsController do
  use OurBillsWeb, :controller

  alias OurBills.Bills

  def index(conn, %{"month" => month}) do
    with bills <- Bills.list_by_month(month) do
      conn
      |> put_status(200)
      |> render("index.json", bills: bills)
    end
  end

  def create(conn, params) do
    with {:ok, bill} <- Bills.create(params) do
      conn
      |> put_status(:created)
      |> render("show.json", bill: bill)
    end
  end

  def update(conn, %{"id" => id} = params) do
    with {:ok, bill} <- Bills.get_bill(id),
         {:ok, bill} <- Bills.update(bill, params) do
      conn
      |> put_status(:ok)
      |> render("show.json", bill: bill)
    end
  end

  def delete(conn, %{"id" => id}) do
    with {:ok, bill} <- Bills.get_bill(id),
         {:ok, _bill} <- Bills.delete(bill) do
      conn
      |> put_status(:no_content)
      |> put_resp_header("content-type", "application/json")
      |> send_resp(204, "")
    end
  end
end
