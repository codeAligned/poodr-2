class Gear
  attr_reader :chainring, :cog, :wheel, :observer

  def initialize(args)
    # ...
    @observer = args[:observer]
  end

  def set_cog(new_cog)
    @cog = new_cog
    changed
  end

  def set_chainring(new_chainring)
    @chainring = new_chainring
    changed
  end

  def changed
    observer.changed(chainring, cog)
  end
end
