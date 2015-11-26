module Persistence
  module Commands
    class UpdateUser < ROM::Commands::Update[:sql]
      relation :users
      register_as :update
      result :one
    end
  end
end
