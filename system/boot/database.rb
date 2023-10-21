Site::Container.boot :database, namespace: true do |site|
  init do
    require "rom"
    require "rom/yaml"

    config = ROM::Configuration.new(
      :yaml,
      "#{site.root}/db/meetups.yaml",
    )

    register "config", config
  end

  start do
    config = container["database.config"]
    config.auto_registration site.root.join("lib/database")

    register "rom", ROM.container(config)
  end
end
