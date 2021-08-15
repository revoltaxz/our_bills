defmodule OurBills.Repo.Migrations.AddBillsTable do
  use Ecto.Migration

  def up do
    create table(:bills, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :amount, :integer
      add :title, :string
      add :description, :string
      add :bill_date, :date, null: false

      timestamps()
    end

  end

  def down do
    drop table(:bills)
  end
end
