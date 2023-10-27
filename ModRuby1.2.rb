#var 8
class Car
  attr_accessor :id, :brand, :model, :year, :color, :price, :registration_number

  def initialize(id, brand, model, year, color, price, registration_number)
    @id = id
    @brand = brand
    @model = model
    @year = year
    @color = color
    @price = price
    @registration_number = registration_number
  end

  def to_s
    "Car ID: #{@id}, Brand: #{@brand}, Model: #{@model}, Year: #{@year}, Color: #{@color}, Price: #{@price}, Reg. Number: #{@registration_number}"
  end
end

class CarList
  def initialize
    @cars = []
  end

  def add_car(car)
    @cars << car
  end

  def find_by_brand(brand)
    @cars.select { |car| car.brand == brand }
  end

  def find_by_model_and_age(model, years)
    current_year = Time.now.year
    @cars.select { |car| car.model == model && (current_year - car.year) > years }
  end

  def find_by_year_and_price(year, price)
    @cars.select { |car| car.year == year && car.price > price }
  end

  def display_car_list(car_list)
    car_list.each do |car|
      puts car.to_s
    end
  end
end

# Створюємо об'єкти Car
car1 = Car.new(1, "Toyota", "Camry", 2019, "Silver", 25000, "ABC123")
car2 = Car.new(2, "Honda", "Civic", 2018, "Red", 20000, "XYZ456")
car3 = Car.new(3, "Ford", "Fusion", 2017, "Blue", 18000, "DEF789")

# Створюємо масив об'єктів
car_list = CarList.new
car_list.add_car(car1)
car_list.add_car(car2)
car_list.add_car(car3)

# Виводимо список автомобілів заданої марки
puts "Список автомобілів марки Toyota:"
car_list.display_car_list(car_list.find_by_brand("Toyota"))

# Виводимо список автомобілів заданої моделі, що експлуатуються більше 2 років
puts "Список автомобілів моделі Civic, які експлуатуються більше 2 років:"
car_list.display_car_list(car_list.find_by_model_and_age("Civic", 2))

# Виводимо список автомобілів заданого року випуску, ціна яких більша за 19000
puts "Список автомобілів 2018 року випуску, ціна яких більша за 19000:"
car_list.display_car_list(car_list.find_by_year_and_price(2018, 19000))
