Trug::Container.namespace("persistence") do |container|
  container.register("persist_user") do
    container["persistence.rom"].command(:users)[:create]
  end

  container.register("update_user") do
    container["persistence.rom"].command(:users)[:update]
  end

  container.register("find_user") do
    container["persistence.rom"].relation(:users)
  end
end
