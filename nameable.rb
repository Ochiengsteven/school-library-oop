require './person'

class Nameable
  def correct_name
    raise NotImplementedError, 'Subclasses must implement correct_name method'
  end
end

class Decorator < Nameable
  def initialize(nameable)
    super()
    @nameable = nameable
  end

  def correct_name
    @nameable.correct_name
  end
end

# capitalize
class CapitalizeDecorator < Decorator
  def correct_name
    super().capitalize
  end
end

class TrimmerDecorator < Decorator
  def correct_name
    name = @nameable.correct_name
    return name[0, 10] if name.length > 10

    name
  end
end
