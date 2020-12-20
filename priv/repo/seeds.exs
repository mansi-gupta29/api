## Inserts 100 records into db .
Enum.each(
  1..100,
  fn _ ->
    Api.Repo.insert(%Api.User{})
  end
)
