defmodule Hellophx.MisterRandom do
  use GenServer


  def start_link do
    GenServer.start_link(__MODULE__, :ok, [])
  end

  # Callbacks
  def send_random_once do
  	magicNumber = :rand.uniform(42)
  	#IO.puts(magicNumber)
  	HellophxWeb.Endpoint.broadcast("room:random", "new_number", %{body: magicNumber})
  end

  def send_random_repeatedly do
  	send_random_once()
  	schedule()
  end

  def init(:ok) do
  	schedule()
  	{:ok, %{}}
  end

  def schedule do 
	Process.send_after(self(), :send_random, 500)
  end

  def handle_info(:send_random, state) do
	send_random_repeatedly()
	{:noreply, state}    
  end


end


