List.destroy_all
Task.destroy_all

# Lists
chores = List.create(id: 1, name: "Chores", list_type: "Check List", category: "Home", recurring: "weekly")
grocery_list = List.create(id: 2, name: "Grocery List", list_type: "Shopping List", category: "Home", list_time: 1, recurring: "weekly")
work = List.create(id: 3, name: "Work", list_type: "Checking List", category: "Work")
project = List.create(id: 4, name: "Home Project", list_type: "Checking List", category: "Home", deadline: "11-25-2016")

# Tasks of Chores lists
sweep = Task.create(list_id: 1, name: "sweep", category: "Home", priority: "low", description: "sweep kitchen, dining room, and bathroom", time_estimate: 1)
dishes = Task.create(list_id: 1, name: "dishes", category: "Home", priority: "low", description: "load dishwasher", time_estimate: 10)
laundry = Task.create(list_id: 1, name: "laundry", category: "Home", priority: "low", description: "collect clothes, seperate, wash, dry, and fold", time_estimate: 2)

# Tasks of Grocercy List
spinach = Task.create(list_id: 2, name: "spinach", category: "groceries", priority: "low", quantity: 2, cost: 2.5)
red_pepper = Task.create(list_id: 2, name: "red pepper", category: "groceries", priority: "low", quantity: 1, cost: 0.50)
sweat_potato = Task.create(list_id: 2, name: "sweat potato", category: "groceries", priority: "low", quantity: 1, cost: 0.75)
chicken = Task.create(list_id: 2, name: "chicken", category: "groceries", priority: "low", quantity: 2, description: "for lunches", cost: 5.50)

# Tasks of Work List
email = Task.create(list_id: 3, name: "morning emails", category: "email", priority: "high", description: "read, respond and file emails", time_estimate: 1)
kick_off_deck = Task.create(list_id: 3, name: "NASA Kick-off deck", category: "nasa", priority: "high", description: "deck for Kick-off call with NASA, new format in last week's email from Meredith.", time_estimate: 3, deadline:"2016-04-18 18:00:00 UTC")
nasa_tickets = Task.create(list_id: 3, name: "development tickets", category: "email", priority: "high", description: "dev tickets for head and footer", time_estimate: 1)

# Tasks Schema
# create_table "tasks", force: :cascade do |t|
#   t.integer  "list_id"
#   t.string   "name"
#   t.string   "category"
#   t.string   "priority"
#   t.text     "description"
#   t.integer  "time_estimate"
#   t.integer  "time_actual"
#   t.decimal  "cost"
#   t.date     "deadline"
#   t.string   "image"
#    t.integer "quantity"
#   t.datetime "created_at"
#   t.datetime "updated_at"
# end
