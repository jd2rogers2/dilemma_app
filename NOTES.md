from options new if multiple fields for needed for multiple factors
  <%= o.fields_for :factor_2, Factor.new do |f2| %>
    <%= f2.label :name %>
    <%= f2.text_field :name %>
    <%= f2.label :points %>
    <%= f2.text_field :points %><br>
  <% end %>
  <%= o.fields_for :factor_3, Factor.new do |f3| %>
    <%= f3.label :name %>
    <%= f3.text_field :name %>
    <%= f3.label :points %>
    <%= f3.text_field :points %><br>
  <% end %>
  <%= o.fields_for :factor_4, Factor.new do |f4| %>
    <%= f4.label :name %>
    <%= f4.text_field :name %>
    <%= f4.label :points %>
    <%= f4.text_field :points %><br>
  <% end %>
  <%= o.fields_for :factor_5, Factor.new do |f5| %>
    <%= f5.label :name %>
    <%= f5.text_field :name %>
    <%= f5.label :points %>
    <%= f5.text_field :points %><br>
  <% end %>