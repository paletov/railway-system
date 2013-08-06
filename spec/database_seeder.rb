require 'role'
require 'role_repository'

require 'user'
require 'user_repository'

require 'railway_station'
require 'railway_station_repository'

require 'edge'
require 'edge_repository'

require 'route'
require 'route_repository'

require 'active_support'

class DatabaseSeeder
  class << self
    def seed
      seed_roles
      seed_users
      seed_railway_stations
      seed_routes
      seed_edges
    end

    def seed_roles
      save_role(:name => "Admin")
      save_role(:name => "User")
    end

    def save_role(args = {})
      role = Role.new(args)
      RoleRepository.save(role)
    end

    def seed_users
      save_user(:name => "AdminUser", :password => "AdminUser", :role_id => RoleRepository.where(:name => "Admin").first.id)
      save_user(:name => "RegularUser", :password => "RegularUser", :role_id => RoleRepository.where(:name => "User").first.id)
    end

    def save_user(args = {})
      user = User.new(args)
      UserRepository.save(user)
    end

    def seed_railway_stations
      # 1
      save_railway_station(:name => "Nesebar")
      # 2
      save_railway_station(:name => "Burgas")
      # 3
      save_railway_station(:name => "Varna")
      # 4
      save_railway_station(:name => "Dobrich")
      # 5
      save_railway_station(:name => "Qmbol")
      # 6
      save_railway_station(:name => "Sliven")
      # 7
      save_railway_station(:name => "Stara Zagora")
      # 8
      save_railway_station(:name => "Kardjali")
      # 10
      save_railway_station(:name => "Borovec")
      # 11
      save_railway_station(:name => "Plovdiv")
      # 12
      save_railway_station(:name => "Ruse")
      # 13
      save_railway_station(:name => "Sofia")
    end

    def save_railway_station(args = {})
      railway_station = RailwayStation.new(args)
      RailwayStationRepository.save(railway_station)
    end

    def seed_routes
      save_route(:name => "Burgas -> Dobrich", :company_name => "Company1")
      save_route(:name => "Burgas -> Nesebar", :company_name => "Company2")
      save_route(:name => "Nesebar -> Stara Zagora", :company_name => "Company3")
      save_route(:name => "Burgas -> Sofia", :company_name => "Company4")
      save_route(:name => "Sofia -> Borovets", :company_name => "Company5")
      save_route(:name => "Sofia -> Dobrich", :company_name => "Company6")
      save_route(:name => "Burgas -> Sliven", :company_name => "Company7")
      save_route(:name => "Qmbol -> Nesebar", :company_name => "Company8")
      save_route(:name => "Qmbol -> Kardjali", :company_name => "Company9")
      save_route(:name => "Borovets -> Ruse", :company_name => "Company10")
    end

    def save_route(args = {})
      route = Route.new(args)
      RouteRepository.save(route)
    end

    def seed_edges
      datetime = DateTime.now + 1.days
      # Edges for route 1
      save_edge(:route_id => 1, :number_in_route => 1, :start_railway_station_id => 2, :end_railway_station_id => 3,
        :start_datetime => datetime + 0.minutes, :end_datetime => datetime + 90.minutes, :price => 800)
      save_edge(:route_id => 1, :number_in_route => 2, :start_railway_station_id => 3, :end_railway_station_id => 4,
        :start_datetime => datetime + 100.minutes, :end_datetime => datetime + 200.minutes, :price => 1000)
      save_edge(:route_id => 1, :number_in_route => 2, :start_railway_station_id => 4, :end_railway_station_id => 12,
        :start_datetime => datetime + 205.minutes, :end_datetime => datetime + 295.minutes, :price => 1800)

      # Edges for route 2
      save_edge(:route_id => 2, :number_in_route => 1, :start_railway_station_id => 2, :end_railway_station_id => 1,
        :start_datetime => datetime + 5.minutes, :end_datetime => datetime + 60.minutes, :price => 700)

      # Edges for route 3
      save_edge(:route_id => 3, :number_in_route => 1, :start_railway_station_id => 1, :end_railway_station_id => 2,
        :start_datetime => datetime + 70.minutes, :end_datetime => datetime + 90.minutes, :price => 1200)
      save_edge(:route_id => 3, :number_in_route => 2, :start_railway_station_id => 2, :end_railway_station_id => 3,
        :start_datetime => datetime + 100.minutes, :end_datetime => datetime + 180.minutes, :price => 1000)
      save_edge(:route_id => 3, :number_in_route => 3, :start_railway_station_id => 3, :end_railway_station_id => 7,
        :start_datetime => datetime + 190.minutes, :end_datetime => datetime + 220.minutes, :price => 1200)

      # Edges for route 4
      save_edge(:route_id => 4, :number_in_route => 1, :start_railway_station_id => 2, :end_railway_station_id => 6,
        :start_datetime => datetime + 0.minutes, :end_datetime => datetime + 100.minutes, :price => 1000)
      save_edge(:route_id => 4, :number_in_route => 2, :start_railway_station_id => 6, :end_railway_station_id => 7,
        :start_datetime => datetime + 110.minutes, :end_datetime => datetime + 200.minutes, :price => 1500)
      save_edge(:route_id => 4, :number_in_route => 3, :start_railway_station_id => 7, :end_railway_station_id => 11,
        :start_datetime => datetime + 230.minutes, :end_datetime => datetime + 290.minutes, :price => 1000)
      save_edge(:route_id => 4, :number_in_route => 4, :start_railway_station_id => 11, :end_railway_station_id => 13,
        :start_datetime => datetime + 300.minutes, :end_datetime => datetime + 400.minutes, :price => 1700)

      # Edges for route 5
      save_edge(:route_id => 5, :number_in_route => 1, :start_railway_station_id => 13, :end_railway_station_id => 10,
        :start_datetime => datetime + 40.minutes, :end_datetime => datetime + 110.minutes, :price => 1700)

      # Edges for route 6
      save_edge(:route_id => 6, :number_in_route => 1, :start_railway_station_id => 13, :end_railway_station_id => 12,
        :start_datetime => datetime + 150.minutes, :end_datetime => datetime + 290.minutes, :price => 2000)
      save_edge(:route_id => 6, :number_in_route => 2, :start_railway_station_id => 12, :end_railway_station_id => 4,
        :start_datetime => datetime + 300.minutes, :end_datetime => datetime + 370.minutes, :price => 1700)

      # Edges for route 7
      save_edge(:route_id => 7, :number_in_route => 1, :start_railway_station_id => 2, :end_railway_station_id => 5,
        :start_datetime => datetime + 5.minutes, :end_datetime => datetime + 70.minutes, :price => 600)
      save_edge(:route_id => 7, :number_in_route => 2, :start_railway_station_id => 5, :end_railway_station_id => 6,
        :start_datetime => datetime + 75.minutes, :end_datetime => datetime + 90.minutes, :price => 300)

      # Edges for route 8
      save_edge(:route_id => 8, :number_in_route => 1, :start_railway_station_id => 5, :end_railway_station_id => 2,
        :start_datetime => datetime + 50.minutes, :end_datetime => datetime + 100.minutes, :price => 900)
      save_edge(:route_id => 8, :number_in_route => 2, :start_railway_station_id => 2, :end_railway_station_id => 1,
        :start_datetime => datetime + 120.minutes, :end_datetime => datetime + 160.minutes, :price => 800)

      # Edges for route 9
      save_edge(:route_id => 9, :number_in_route => 1, :start_railway_station_id => 5, :end_railway_station_id => 7,
        :start_datetime => datetime + 0.minutes, :end_datetime => datetime + 70.minutes, :price => 900)
      save_edge(:route_id => 9, :number_in_route => 2, :start_railway_station_id => 7, :end_railway_station_id => 4,
        :start_datetime => datetime + 80.minutes, :end_datetime => datetime + 180.minutes, :price => 1100)
      save_edge(:route_id => 9, :number_in_route => 3, :start_railway_station_id => 4, :end_railway_station_id => 12,
        :start_datetime => datetime + 210.minutes, :end_datetime => datetime + 300.minutes, :price => 1500)
      save_edge(:route_id => 9, :number_in_route => 4, :start_railway_station_id => 12, :end_railway_station_id => 13,
        :start_datetime => datetime + 310.minutes, :end_datetime => datetime + 390.minutes, :price => 2100)
      save_edge(:route_id => 9, :number_in_route => 5, :start_railway_station_id => 13, :end_railway_station_id => 8,
        :start_datetime => datetime + 410.minutes, :end_datetime => datetime + 500.minutes, :price => 2400)

      # Edges for route 10
      save_edge(:route_id => 10, :number_in_route => 1, :start_railway_station_id => 10, :end_railway_station_id => 13,
        :start_datetime => datetime + 120.minutes, :end_datetime => datetime + 210.minutes, :price => 1900)
      save_edge(:route_id => 10, :number_in_route => 2, :start_railway_station_id => 13, :end_railway_station_id => 12,
        :start_datetime => datetime + 220.minutes, :end_datetime => datetime + 290.minutes, :price => 1900)
    end

    def save_edge(args = {})
      edge = Edge.new(args)
      EdgeRepository.save(edge)
    end
  end
end