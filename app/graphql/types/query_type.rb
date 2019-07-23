module Types
  class QueryType < Types::BaseObject
    # Add root-level fields here.
    # They will be entry points for queries on your schema.
    field :all_links, [LinkType], null: false, description: 'Retrieve all links'
    field :find_link, LinkType, null: false do
      description 'Find a post by ID'
      argument :id, ID, required: true
    end

    # this method is invoked, when `all_link` fields is being resolved
    def all_links
      Link.all
    end

    def find_link(id:)
      Link.find(id)
    end
  end
end
