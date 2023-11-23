class UsersController < ApplicationController
def index
    @users = User.all
end

def new
    @user = User.new
end

def create
        @user = User.new(user_params)

        if @user.save
                redirect_to user_path
        else
            render: new
        end

end

def edit
    <% form_with scope: :user, url: create_user_path, local: true do |f| %>

        <p>
        <% if @user.errors.any? %>
         <% @user.errors.each do |error| %>
            <li><%= error.full_message %></li>
            <% end %>
            <% end %>
            </p>


        <p>
            <%= f.label :username %><br/>
            <%= f.text_field :username %><br/>
        </p>
        <p>
        <%= f.label :email %><br/>
        <%= f.text_field :email %><br/>
        </p>
        <p>
        <%= f.submit %>
        </p>
        <% end %>



end

end
