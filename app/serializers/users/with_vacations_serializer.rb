module Users
  class WithVacationsSerializer < Base

    has_many :vacations

    def vacations
      []
    end

  end
end