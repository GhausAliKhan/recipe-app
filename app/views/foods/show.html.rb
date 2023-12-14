<h1>Food Details</h1>

<table>
<thead>
  <tr>
    <th>Food</th>
    <th>Measurement Unit</th>
    <th>Unit Price</th>
    <th>Actions</th>
  </tr>
</thead>
<tbody>
    <tr>
      <td><%= @food.name %></td>
      <td><%= @food.measurement_unit %></td>
      <td>$ <%= @food.price %></td>
      <td>
      <%= link_to 'Back', foods_path %>
    </td>
    </tr>
</tbody>
</table>
