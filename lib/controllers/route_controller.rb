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
    filter[:is_deleted] = false
    RouteRepository.where(:is_deleted => false, :id => 2)
  end

  def delete_route(id)
    route = RouteRepository.where(:id => id).first
    if route != nil
      route.is_deleted = true
      RouteRepository.save(route)
    end
  end
end