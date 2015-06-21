module Calendars
  module Admin
    module Teams
      module Api
        class Create
          include WFlow::Process

          data_reader   :team_attributes
          data_accessor :team

          def perform
            self.team = Team.new(team_attributes.slice(:name).to_hash)

            associate_members
            associate_managers

            flow.failure!(status: :unprocessable_entity) unless team.save
          end

        protected

          def associate_members
            unless team_attributes[:member_ids].blank?
              attributes =
                team_attributes[:member_ids].map do |member_id|
                  { user_id: member_id }
                end

              self.team.team_members.build(attributes)
            end
          end

          def associate_managers
            unless team_attributes[:manager_ids].blank?
              attributes =
                team_attributes[:manager_ids].map do |member_id|
                  { user_id: member_id }
                end

              self.team.team_managers.build(attributes)
            end
          end
        end
      end
    end
  end
end