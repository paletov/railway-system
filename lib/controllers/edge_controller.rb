require 'edge'
require 'edge_repository'

class EdgeController
  def create_or_update(edge)
    if edge.valid? then EdgeRepository.save(edge)
    end
  end

  def get_edges(filter = {})
    EdgeRepository.where(filter)
  end

  def delete_edge(edge_id)
  end
end