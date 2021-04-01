defmodule SlugTest do
  use ExUnit.Case

  test "greets the world" do
    string = "https://www.bitkraft.vc/the-future-of-virtual-events/"
    slug = "The future of virtual events"
    Clipboard.copy(string)

    # Wait for input to flush
    :timer.sleep(100)
    assert slug == Slug.main()
  end
end
