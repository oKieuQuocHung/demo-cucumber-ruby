driver = Selenium::WebDriver.for:chrome

Given('user in signup screen') do
  driver.navigate.to "http://localhost:3000/users/new"
  current_url = driver.current_url
  expect(current_url).to eq("http://localhost:3000/users/new")
  sleep(2)
end

When('user input {string} into username field and {string} into password field') do |username, password|
  username_input = driver.find_element(:id, "user_username")
  password_input = driver.find_element(:id, "user_password")
  username_input.send_keys(username)
  password_input.send_keys(password)
  sleep(2)
end

When('user click signup button') do
  signup_button = driver.find_element(:id, 'signup').click
end

Then('user should see welcome screen') do
  current_url = driver.current_url
  expect(current_url).to eq("http://localhost:3000/welcome")
end

And('you see {string}') do |welcome_message|
  message = driver.find_element(:id, "message").text
  expect(message).to eq(welcome_message)
end

Given('user in login page') do
  driver.navigate.to "http://localhost:3000/login"
  current_url = driver.current_url
  expect(current_url).to eq("http://localhost:3000/login")
  sleep(2)
end

When('user login with {string} as username and {string} as password') do |username, password|
  username_input = driver.find_element(:id, "username")
  password_input = driver.find_element(:id, "password")
  username_input.send_keys(username)
  password_input.send_keys(password)
  sleep(1)
end

When('user click login button') do
  signup_button = driver.find_element(:id, 'login').click
  sleep(1)
end

Then('user does not navigate to welcome sceen') do
  expect(driver.current_url).to eq('http://localhost:3000/login')
end

Then('user see {string} title') do |string|
  login_title = driver.find_element(:id, "login_title").text
  expect(login_title).to eq("Login")
end
