defmodule Volko.Utils do
  import Ecto.Changeset
  def trim(nil), do: nil
  def trim(value) when is_binary(value), do: String.trim(value)

  def update_changes(changeset, fields, function) when is_list(fields) do
    Enum.reduce(fields, changeset, &update_change(&2, &1, function))
  end
end
