menu = {
  "sections" => [
    # ---------------------------------------------------------------------
    {
      name: "Tacos",
      dishes: [ #menu["sections"][0][0]
      {
        name: "Al Pastor",
        price: 3.50,
        description: "pork, achiote, pineapple"
      },
      {
        name: "Carnitas",
        price: 3.50,
        description: "pork, orange, cinnamon"
      },
      {
        name: "Chorizo",
        price: 3.50,
        description: "pork, paprika, cumin, garlic"
      },
      {
        name: "Asada",
        price: 5.00,
        description: "steak, citrus, chile de arbol "
      },
      {
        name: "Barbacoa",
        price: 3.50,
        description: "beef, cumin, pasilla negra "
      },
      {
        name: "Leguna",
        price: 3.50,
        description: "beef tongue, cerveza victoria"
      },
    ]
  },
  # ---------------------------------------------------------------------
  {
    name: "Sides",
    dishes: [
      {
        name: "Totopos",
        price: 5.00,
        description: "hand torn blue masa chips "
      },
      {
        name: "Elote",
        price: 5.00,
        description: "charred corn, cilantrojalapeno crema, cotija"
      },
      {
        name: "Quinoa",
        price: 6.50,
        description: "jicama, corn, scallion, chile, nopal dressing "
      },
    ]
  },
  # ---------------------------------------------------------------------
  {
    name: "Breakfast",
    dishes: [
      {
        name: "Huevos La Mexicana",
        price: 7.00,
        description: "scrambled eggs, pico de gallo, crema, tortillas "
      },
      {
        name: "Quesadilla De Epazote",
        price: 7.00,
        description: "queso chihuahua, herbs, salsas"
      },
      {
        name: "Tostada De Aguacate",
        price: 7.00,
        description: "avocado, frijoles, cabbage, cotija, chile"
      },
    ]
  },
  # ---------------------------------------------------------------------
]
}

def show_menu(menu) # This is a method that iterates through the Menu hash above.
menu["sections"].each do |sections|
  p sections[:name]
  sections[:dishes].each do |dish|
    p dish[:name]
    p dish[:price]
    p dish[:description]
  end
end
end

def show_tacos(menu) #This method does the same as above, however it specifically gets the "tacos" sub menu under dishes.
menu["sections"].each do |sections|
  case sections[:name]
  when "Tacos"
    sections[:dishes].each do |dish|
      p dish[:name]
      p dish[:price]
      p dish[:description]
    end
  end
end
end

def show_sides(menu) #This method does the same as above, however it specifically gets the "sides" sub menu under dishes.
menu["sections"].each do |sections|
  case sections[:name]
  when "Sides"
    sections[:dishes].each do |dish|
      p dish[:name]
      p dish[:price]
      p dish[:description]
    end
  end
end
end

def show_Breakfast(menu) #This method does the same as above, however it specifically gets the "Breakfast" sub menu under dishes.
menu["sections"].each do |sections|
  case sections[:name]
  when "Breakfast"
    sections[:dishes].each do |dish|
      p dish[:name]
      p dish[:price]
      p dish[:description]
    end
  end
end
end

def shovel_user_input_into_array_as_hash(user_output, users_inputs, menu) #shovels user input into array as hash and matches with matching price.
menu["sections"].each do |sections|
  users_inputs.each do |item|
    sections[:dishes].each do |dish|
      if dish[:name] == item
        user_output << {item.to_s => dish[:price].to_s}
      end
    end
  end
end
end

def options(opt_a, opt_b, opt_c, opt_d) #This method puts options out in an a.b.c,d format.
puts "OPTIONS:\n
a) #{opt_a}.\n
b) #{opt_b}.\n
c) #{opt_c}.\n
d) #{opt_d}."
puts " "
end

def line_break # This method adds a line break
puts "*" * 60
end

prompt = "Your Response = " #used as a prompt after every gets.
show_whole_menu = ["a", "a)", "show whole menu"] #allowed user inputs for show whole menu (line 185)
show_taco_menu = ["b", "b)", "show taco menu"]#allowed user inputs for show taco menu (line 188)
show_sides_menu = ["c", "c)", "show sides menu"]#allowed user inputs for show sides menu (line 191)
show_breakfast_menu = ["d", "d)", "show breakfast menu"]#allowed user inputs for show breakfast menu (line 194)
restart_answers = ["place order", "quit", "exit", "order"] #allowed user inputs for until loop on 176 if user wants to restart the menu options.
place_order = ["place order", "order"] #allowed user inputs for line 210 if user wants to place order.
check = ["check", "yes", "check please", "bill"] #user input for question "Do you want your check?"

puts "🌮  Thank you for choosing Taquiza! 🌮"

restart = nil # Restart = nil so we can use it in our until loop. Restart will be clobbered to a gets.chomp

until restart_answers.include? restart # Restarts the "would you like to see the entire menu..."

puts "Would you like to see the entire menu, or would you like to only see tacos, sides, or breakfast menu's?"
options("Show Whole Menu", "Show Taco Menu", "Show Sides Menu", "Show Breakfast Menu")

print prompt
which_menu = gets.chomp.downcase #User chooses from menu options
line_break

if show_whole_menu.include? which_menu #depending on user input, and of the below if statements will display the appropriate menu.
  show_menu(menu)
end
if show_taco_menu.include? which_menu
  show_tacos(menu)
end
if show_sides_menu.include? which_menu
  show_sides(menu)
end
if show_breakfast_menu.include? which_menu
  show_Breakfast(menu)
end
line_break
puts "Do you want to see the menu again, or place your order. (If you want to quit, just say 'quit')"
print prompt
restart = gets.chomp.downcase #This will either end or continu the until loop depending on user input.
end

check_please = nil #Check please = nil because so that it passes the include loop until its clobbered.

until check.include? check_please # This loop will continue to loop the until the user is satisfied with their order and inputs check please.

ordered_items = [] # This array stores the user order (user input on line 210)

puts "What would you like to order? (When you are done, type 'done')"
while ordered_items.last != "Done" #Loop until last item in the following gets is "done"
  print prompt
  ordered_items << gets.chomp.split.map(&:capitalize)*' ' #Shovels users order into the ordered items array.
end

ordered_items.pop #Removes the last item ("done" in this case) un the ordered_items array.
users_inputs = ordered_items # New variable user_input thats equal to ordered_items.

user_output = []
#The following method call gets the users input(order) and gets the ordered items price, then shovels that price into the user_output array as array of hashes
#with the key being the order, and value being the price.
shovel_user_input_into_array_as_hash(user_output, users_inputs, menu)

prices_array = user_output.flat_map(&:values) #sets prices_array equal to the values (prices in this case)

prices_array.map!(&:to_f)#Changes prices from strings to floats.

total_price = prices_array.inject(0){|sum,x| sum + x } #adds all of the prices in prices_array together

line_break
puts "Would you like your check?"
print prompt
check_please = gets.chomp.downcase
end #ends loop when user asks for check.

line_break

puts "Your total bill is $#{total_price.to_f}."
def list_items_and_prices_together(user_output)
user_output.each do |hash|
puts hash.keys.first + " $" + hash.values.last
end
end

list_items_and_prices_together(user_output)

percent_tip = nil

tip_percent = percent_tip

line_break

until (tip_percent.is_a?(Float)) do

puts "Please enter a valid percent for your tip."
puts "What percent tip would you like to give?"
print prompt
begin
  tip_percent = Float(gets)
rescue ArgumentError
  tip_percent = nil
end
end

line_break

total_price = total_price.to_f
tip = (total_price * tip_percent) / 100 #put total_bill and percent_tip in paranthesis so that they are done before we divide.
tax = total_price * 0.06
total = total_price + tip + tax
tip = "%.2f" % tip
tax = "$%.2f" % tax # This will format my tip to look like money. It adds the dollar sign, and gives it the 2 decimal place format that money has.
total = "$%.2f" % total #same as above, but for the total var
puts "TOTAL:\n
"
puts "Tip: $#{tip} \nTax(6%): #{tax} \nTotal amount due: #{total}\n
"
puts "Have a great day and thank you for choosing taquiza!"
