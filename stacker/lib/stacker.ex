defmodule Stacker.Server do
  use GenServer.Behaviour

  def init(stack) do
    { :ok, stack }
  end

  # def handle_call(:pop, _from, [h|stack]) do
    # { :reply, h, stack }
  # end

  # def handle_call(:status, _from, stack) do
    # { :reply, stack, stack }
  # end
  def handle_call(args, _from, stack) do
    case args do
      :status ->
        {:reply, stack, stack}
      :pop ->
        [h|stack] = stack
        { :reply, h, stack }
    end
  end

  def handle_cast({ :push, new }, stack) do
    { :noreply, [new|stack] }
  end

  def handle_cast({ :clear }, stack) do
    { :noreply, [] }
  end
end
