# Api

A simple phoenix api app, with a single public endpoint, root `/`.  
This app returns, at max 2 users with more than a random number of points.

## How it works 

When the Api app starts , it launches genserver with an initial state having a `max_number` (a random number between 0 to 100) and `timestamp`. This gen server runs every minute and updates every user's points in db and also refreshes the `max_number` of the genserver state with a new number.
The app has a single public endpoint which queries postgres database for all users with more points than `max_number` but only retrieve a max of 2 users.

## Installing / Getting started

To run this project, you will need to install the following dependencies on your system:

* [Elixir](https://elixir-lang.org/install.html)
* [Phoenix](https://hexdocs.pm/phoenix/installation.html)
* [PostgreSQL](https://www.postgresql.org/download/macosx/)

To get started, run the following commands:

Clone the repository -
```
git clone https://github.com/mansi-gupta29/api.git
```

Install the required dependencies
```
cd api/
mix deps.get 
```

Edit `config/dev.exs` file and change the database related configuration as applicable to your environment.
create the database and runs the database migrations and seed file.
```
mix ecto.setup  
```
Start app 
```
mix phx.server
```
Now you can visit localhost:4000 from your browser.

### Example 

Visit ```localhost:4000/``` 

You'll get -
```elixir
{
  'users': [{id: 29, points: 31}, {id: 16, points: 90}],
  'timestamp': `2020-07-30 17:09:33`
}
```


