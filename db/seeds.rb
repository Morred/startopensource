# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

ruby = Language.create(name: 'Ruby')
elixir = Language.create(name: 'Elixir')
js = Language.create(name: 'JavaScript')
c = Language.create(name: 'C')

project_cupcake = Project.create(
  name: 'Project Cupcake',
  url: 'http://www.github.com/cupcaketown/cupcake',
  description: 'The best cupcakes in town'
)

project_muffin = Project.create(
  name: 'Project Muffin',
  url: 'http://www.github.com/muffincity/muffin',
  description: 'Muffins you dream about'
)

Issue.create(
  project: project_cupcake,
  languages: [ruby, js],
  title: 'Apply frosting',
  github_issue_id: '123',
  url: 'http://www.github.com/cupcaketown/cupcake/issues/123'
)

Issue.create(
  project: project_cupcake,
  languages: [js],
  title: 'Add sparkles',
  github_issue_id: '124',
  url: 'http://www.github.com/cupcaketown/cupcake/issues/124'
)

Issue.create(
  project: project_muffin,
  languages: [elixir],
  title: 'Stir in chocolate chips',
  github_issue_id: '35',
  url: 'http://www.github.com/cupcaketown/muffin/issues/35'
)
