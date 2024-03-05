# Design Patterns: Strategy
# Example 1:
#define la interfaz para las estrategias de envio
module ShippingCostStrategy
  def calculate_cost
    raise NotImplementedError, "#{self.class} no implementa el método 'calculate_cost'"
  end
end

#Define las estrategias concretas para el calculo del costo de envio
class StandardShipping
  include ShippingCostStrategy
  def calculate_cost(weight, distance)
    base_cost = 10.0
    distance_cost = distance * 0.5
    weight_cost = weight * 0.1
    base_cost + distance_cost + weight_cost
  end
end

class ExpressShipping
  include ShippingCostStrategy
  def calculate_cost(weight, distance)
    base_cost = 15.0
    distance_cost = distance * 0.5
    weight_cost = weight * 0.2
    base_cost + distance_cost + weight_cost
  end
end

# Define la clase que utiliza la estrategia
class Order
  attr_reader :weight, :distance, :shipping_cost_strategy

  def initialize(weight, distance, shipping_cost_strategy = StandardShipping.new)
    @weight = weight
    @distance = distance
    @shipping_cost_strategy = shipping_cost_strategy
  end

  def calculate_total_cost(product_cost)
    product_cost + shipping_cost_strategy.calculate_cost(weight, distance)
  end

  def set_shipping_cost_strategy(strategy)
    @shipping_cost_strategy = strategy
  end
end

# Ejemplo de uso
order = Order.new(8, 100)
puts "El costo total con envio standard es: #{order.calculate_total_cost(56.98)}"

order.set_shipping_cost_strategy(ExpressShipping.new)
puts "El costo total con envio express es: #{order.calculate_total_cost(56.98)}"
