require 'route'
require 'route_repository'
require 'edge'
require 'edge_repository'

class RouteController
  def create_or_update(route)
    if route.valid? then RouteRepository.save(route)
    end
  end

  def get_routes(filter = {})
    RouteRepository.where(filter)
  end

  def delete_route(user_id)
  end
end