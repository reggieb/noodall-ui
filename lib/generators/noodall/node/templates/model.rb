class <%= class_name %> < Noodall::Node
  # Define if this Node Template can be added as a root page in the top level of the tree
<%- if options.root? -%>
  root_template!
<%- else -%>
  # root_template!
<%- end -%>

  # Define which Node Templates can be used as children of Nodes using this template
  sub_templates <%= class_name %>
<%- if options.root? -%>
  root_template!
<%- end -%>

  # Define the number of each slot type this Node Template allows. Slots are defined in 'config/initializers/noodall.rb'
  # small_slots 4

<% for attribute in attributes -%>
  key :<%= attribute.name %>, <%= attribute.type.to_s.classify %>
<% end -%>
end
