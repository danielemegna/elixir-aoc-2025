alias :math, as: Math

defmodule Day08.JunctionBoxes do

  def euclidean_distance({x1, y1, z1}, {x2, y2, z2}) do
    x = Math.pow(x1 - x2, 2)
    y = Math.pow(y1 - y2, 2)
    z = Math.pow(z1 - z2, 2)

    Math.sqrt(x + y + z)
  end

end
