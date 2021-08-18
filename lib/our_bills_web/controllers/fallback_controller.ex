defmodule OurBillsWeb.FallbackController do
  use OurBillsWeb, :controller

  def call(conn, {:error, :bill_not_found}) do
    conn
    |> put_status(:not_found)
    |> put_view(OurBillsWeb.ErrorView)
    |> render("404.json", result: :bill_not_found)
  end

  def call(conn, {:error, error_result}) do
    conn
    |> put_status(:bad_request)
    |> put_view(OurBillsWeb.ErrorView)
    |> render("400.json", result: error_result)
  end
end
