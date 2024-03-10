[![CI](https://github.com/dmitry-tkachuk/rails-project-63/actions/workflows/main.yml/badge.svg)](https://github.com/dmitry-tkachuk/rails-project-63/actions/workflows/main.yml)
[![Actions Status](https://github.com/dmitry-tkachuk/rails-project-63/actions/workflows/hexlet-check.yml/badge.svg)](https://github.com/dmitry-tkachuk/rails-project-63/actions)

# HexletCode
**Easy form generator**
## Installation

Add it to your Gemfile:

```ruby
gem 'HexletCode'
```

Run the following command to install it:

```console
make install
make test
make lint
```

### Usage

## Create form with Struct 
```ruby
User = Struct.new(:name, :job, keyword_init: true)
user = User.new name: 'John', job: "Developer"

HexletCode.form_for user do |f|
  f.input :name
  f.input :job
  f.submit
end

# <form action="#" method="post">
#   <label for="name">Name</label>
#   <input name="name" type="text" value="John">
#   <label for="job">Job</label>
#   <input name="job" type="text" value="Developer">
#   <input type="submit" value="Save">
# </form>
```
## Pass attrubutes

Like this

```ruby
HexletCode.form_for @user do |f|
  f.input :name, class: "user-input"
  f.input :job
end


# <form action="#" method="post">
#   <label for="name">Name</label>
#   <input name="name" type="text" value="John" class="user-input">
#   <label for="job">Job</label>
#   <input name="job" type="text" value="Developer">
# </for
```

Or

```ruby
HexletCode.form_for user, url: '/users'

#<form action="/users" method="post"></form>
```

Want submit in your form? Easy!

```ruby
HexletCode.form_for @user do |f|
      f.submit "Send"
    end

# <form action="#" method="post">
#   <input type="submit" value="Send">
# </form>
```
