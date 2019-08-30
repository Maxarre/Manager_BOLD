class Task < ApplicationRecord
  include AlgoliaSearch
  belongs_to :list

  algoliasearch per_environment: true do
    attribute :name

    searchableAttributes ['name']
  end
end
