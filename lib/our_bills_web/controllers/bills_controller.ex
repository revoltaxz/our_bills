defmodule OurBillsWeb.BillsController do
  use OurBillsWeb, :controller

  alias OurBills.Bills

  def index(conn, %{"month" => month}) do
    with {:ok, bills} <- Bills.list_by_month(month) do
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
end
