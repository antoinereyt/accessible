defmodule Accessible do
  @moduledoc false

  defmacro __using__(_) do
    quote location: :keep do
      @behaviour Access

      if Version.compare(System.version(), "1.7.0") == :lt do
        defdelegate get(term, key), to: Map
        defdelegate get(term, key, default), to: Map
      end

      defdelegate fetch(term, key), to: Map
      defdelegate get_and_update(term, key, fun), to: Map
      defdelegate pop(data, key), to: Map
    end
  end
end
