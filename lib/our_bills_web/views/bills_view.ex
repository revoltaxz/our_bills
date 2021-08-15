defmodule OurBillsWeb.BillsView do
  use OurBillsWeb, :view

  def render("index.json", %{bills: bills}) do
    bills
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
