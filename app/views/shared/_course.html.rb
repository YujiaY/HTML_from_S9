
<% content_for :student do %>
  <p><%= "Fake news:  You are an Student!" %></p>
  <p><%= "Fake news:  This is the Courses Show page for Student!" %></p>
  <br>
<p> Courses Name: <%= course.name %> | <%= link_to 'Show', course %></p>

	<br>
<% end %>