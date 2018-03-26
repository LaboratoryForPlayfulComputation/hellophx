defmodule HellophxWeb.RoomChannel do
  use Phoenix.Channel


  def join("room:lobby", _message, socket) do
    {:ok, socket}
  end
  
  def join("room:random", _message, socket) do
    IO.puts(inspect(self()))
    {:ok, socket}
  end

  def join("room:" <> _private_room_id, _params, _socket) do
    {:error, %{reason: "unauthorized"}}
  end

  def handle_cast({:rando, item}, state) do
    broadcast!("room:random", "new_number", %{body: item})
    {:noreply, [item | state]}
  end
  
  

end