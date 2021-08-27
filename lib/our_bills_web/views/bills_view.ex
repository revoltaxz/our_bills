defmodule OurBillsWeb.BillsView do
  use OurBillsWeb, :view

  alias OurBills.Bill

  def render("index.json", %{bills: bills}) do
    Enum.map(bills, fn bill ->
      render(__MODULE__, "show.json", bill: bill)
    end)
  end

  def render("show.json", %{
        bill: %Bill{title: title, bill_date: bill_date, description: description, amount: amount}
      }) do
    %{
      title: title,
      date: bill_date,
      description: description,
      amount: amount.amount
    }
  end

  def render("create.json", %{
        bill: %Bill{title: title, bill_date: bill_date, description: description, amount: amount}
      }) do
    %{
      message: "Bill created",
      bill: %{
        title: title,
        date: bill_date,
        description: description,
        amount: amount.amount
      }
    }
  end

  def render("update.json", %{
        bill: %Bill{title: title, bill_date: bill_date, description: description, amount: amount}
      }) do
    %{
      message: "Bill updated",
      bill: %{
        title: title,
        date: bill_date,
        description: description,
        amount: amount.amount
      }
    }
  end
end
