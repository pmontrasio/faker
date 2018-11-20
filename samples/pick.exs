# mix run samples/run.exs

range_1 = 0..10000
range_2 = 61_090_588_800..61_122_211_199

Benchee.run(%{
  "(0..10000) with Enum.to_list/1" => fn ->
    range_1
    |> Enum.to_list()
    |> Enum.at(Faker.random_between(0, Enum.count(range_1) - 1))
  end,
  "(0..10000) without Enum.to_list/1" => fn ->
    range_1
    |> Enum.at(Faker.random_between(0, Enum.count(range_1) - 1))
  end
})

Benchee.run(%{
  "(61090588800..61122211199) with Enum.to_list/1" => fn ->
    range_2
    |> Enum.to_list()
    |> Enum.at(Faker.random_between(0, Enum.count(range_2) - 1))
  end,
  "(61090588800..61122211199) without Enum.to_list/1" => fn ->
    range_2
    |> Enum.at(Faker.random_between(0, Enum.count(range_2) - 1))
  end
})
