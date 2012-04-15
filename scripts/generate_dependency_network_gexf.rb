require File.expand_path("../helper", __FILE__)

nodes = []
edges = []

Dependency.order("id").each do |d|
  source = d.child
  target = d.parent

  nodes << source unless nodes.include? source
  nodes << target unless nodes.include? target
  edges << d
end

nodes_string = nodes.map { |node| "<node id='%s' label='%s' />" % [node.id, node.name] }.join("\n")
edges_string = edges.inject([]) { |result, edge|
  result << "<edge id='%d' source='%d' target='%d' />" % [result.size, edge.child_id, edge.parent_id]
  result
}.join("\n")

puts <<-GEXF
<gexf xmlns="http://www.gexf.net/1.2draft" xmlns:viz="http://www.gexf.net/1.1draft/viz" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://www.gexf.net/1.2draft http://www.gexf.net/1.2draft/gexf.xsd" version="1.2">
  <graph mode="dynamic" defaultedgetype="directed">
    <nodes>
      #{nodes_string}
    </nodes>
    <edges>
      #{edges_string}
    </edges>
  </graph>
</gexf>
GEXF
