module Teams
  class FindManagedByUser
    include WFlow::Process

    data_reader :user
    data_writer :teams

    def perform
      self.teams = Team.managed_by(user)
    end
  end
end