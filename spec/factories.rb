FactoryBot.define do
  factory(:user) do
    email("test@test.come")
    password("herpderp")
    password_confirmation("herpderp")
  end

  factory(:product) do
    name("Flying Fish")
    cost(66)
    guide("Avoid")
    notes("I seriously can't believe you'd want to eat this.")
  end

  factory(:review) do
    user
    product
    content("I loved it. It was better than Cats.")
  end

end
