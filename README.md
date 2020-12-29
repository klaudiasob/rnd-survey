# RnD Survey

- Ruby [2.6.3]
- Rails [6.0.3.4]

## Install
#### 1. Check out the repository

```bash
git clone git@github.com:klaudiasob/rnd-survey.git
```

#### 2. Install gems

```ruby
bundle install
```

#### 3. Install javascript packages

```ruby
yarn install
```

#### 4. Create and setup the database

Run the following commands to setup the database and populate it with seed data.

```ruby
bundle exec rake db:setup
```

#### 5. Start the Rails server

You can start the rails server using the command given below.

```ruby
bundle exec rails s
```

And now you can visit the site with the URL http://localhost:3000

#### Test data
You can use following account to login into the application:
- email: `admin@example.com`; password: `password`