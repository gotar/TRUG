require "rom"

Trug::Container.namespace("persistence") do |container|
  ROM.use(:auto_registration)

  if ENV.fetch("RACK_ENV", "development") == "production"
    ROM.setup(:sql, ENV["DATABASE_UL"])
  else
    ROM.setup(:sql, container.config.app.database_url)
  end

  %w(relations commands).each do |type|
    container.require("lib/persistence/#{type}/**/*.rb")
  end

  container.register("rom", ROM.finalize.container)

  container.auto_register!("lib/persistence/repositories") do |repo|
    -> { repo.new(container["persistence.rom"]) }
  end

  container.require("core/container/persistence")
end
