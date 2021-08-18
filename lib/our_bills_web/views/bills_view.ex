defmodule OurBillsWeb.BillsView do
  use OurBillsWeb, :view

  def render("index.json", %{bills: bills}) do
    Enum.map(bills, fn bill ->
      render(__MODULE__, "show.json", bill: bill)
    end)
  end

  def render("show.json", %{bill: bill}) do
    %{
      title: bill.title,
      date: bill.bill_date,
      description: bill.description,
      amount: bill.amount.amount
    }
  end
end
