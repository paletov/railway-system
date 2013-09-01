require 'edge'
require 'edge_repository'

class EdgeController
  def create_or_update(edge)
    if edge.valid? then EdgeRepository.save(edge)
    end
  end

  def get_edges(filter = {})
    filter[:is_deleted] = false
    EdgeRepository.where(filter)
  end

  def delete_edge(edge_id)
    edge = EdgeRepository.where(:edge_id => edge_id)
    edge.is_deleted = true
    EdgeRepository.save(edge)
  end
end