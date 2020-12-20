defmodule Api do
  alias Api.{User, Repo}
  import Ecto.Query

  @doc """
  function to fetch user which have points greater than the max number in gen server .
  """

  def get_users_with_max_points(max_number) do
    from(u in User,
      where: u.points > ^max_number,
      select: %{
        id: u.id,
        points: u.points
      },
      limit: 2
    )
    |> Repo.all()
  end

  def update() do
    get_users()
    |> Enum.each(fn user ->
      changeset = User.changeset(user, %{points: Enum.random(0..100)})
      Repo.update(changeset)
    end)
  end

  defp get_users() do
    Repo.all(User)
  end
end
