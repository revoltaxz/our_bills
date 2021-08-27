defmodule OurBills do
  alias OurBills.Bill

  defdelegate create_bill(params), to: Bill.Create, as: :call
  defdelegate delete_bill(params), to: Bill.Delete, as: :call
  defdelegate update_bill(params), to: Bill.Update, as: :call
  defdelegate list_bills(params), to: Bill.Index, as: :call
end
